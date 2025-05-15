//
//  Episode.swift
//  BBQuotes18
//
//  Created by Mark Santoro on 5/15/25.
//

import Foundation

struct Episode: Decodable {
    let episode: Int // 101 = season1 episode1, 512 = season5 episode12
    let title: String
    let image: URL
    let synopsis: String
    let writtenBy: String
    let directedBy: String
    let airDate: String
    
    var seasonEpisode: String {
        return "Season\(episode / 100) Episode\(episode % 100)"
    }
    
}
