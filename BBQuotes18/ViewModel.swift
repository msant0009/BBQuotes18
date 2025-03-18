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
    
   init(status: FetchStatus, quote: Quote, character: Char) {
        self.status = status
        self.quote = quote
        self.character = character
    }
    
    
    
}
