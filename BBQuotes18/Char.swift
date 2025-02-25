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
    
}
