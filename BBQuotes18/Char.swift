//
//  Char.swift
//  BBQuotes18
//
//  Created by Mark Santoro on 2/24/25.
//

import Foundation

struct Char: Codable {
    let name: String
    let birthday: String
    let occupation: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let portrayedBy: String
    var death: Death?// optionals set to nil by default
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthday
        case occupation
        case images
        case aliases
        case status
        case portrayedBy
        
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.birthday = try container.decode(String.self, forKey: .birthday)
        self.occupation = try container.decode([String].self, forKey: .occupation)
        self.images = try container.decode([URL].self, forKey: .images)
        self.aliases = try container.decode([String].self, forKey: .aliases)
        self.status = try container.decode(String.self, forKey: .status)
        self.portrayedBy = try container.decode(String.self, forKey: .portrayedBy)
  
       // up to here is auto generated
        
        // This is manually created
        let deathDecoder = JSONDecoder()
        deathDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deathData = try Data(contentsOf: Bundle.main.url(forResource: "sampledeath", withExtension: ".json")!)
        death = try deathDecoder.decode(Death.self, from: deathData)
    }
    
}
