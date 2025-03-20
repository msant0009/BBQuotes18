//
//  ViewModel.swift
//  BBQuotes18
//
//  Created by Mark Santoro on 3/17/25.
//

import Foundation

@Observable
@MainActor
class ViewModel {
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    // set permission to allow var to be seen but not changed
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var quote: Quote
    var character: Char
    
   init() {
       let decoder = JSONDecoder()
       decoder.keyDecodingStrategy = .convertFromSnakeCase
       
       let quoteData = try! Data(contentsOf: Bundle.main.url(forResource: "samplequote", withExtension: ".json")!)
       quote = try! decoder.decode(Quote.self, from: quoteData)
       
       let characterData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: ".json")!)
       character = try! decoder.decode(Char.self, from: characterData)
       
    }
    
    
    
}
