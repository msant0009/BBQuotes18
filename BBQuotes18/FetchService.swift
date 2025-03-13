//
//  FetchService.swift
//  BBQuotes18
//
//  Created by Mark Santoro on 3/12/25.
//

import Foundation

struct FetchService {
    enum FetchError: Error {
        case badResponse
    }
    
    let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    // this is the entire URL
    //https://breaking-bad-api-six.vercel.app/api/quotes/random?production=Breaking+Bad
    
    func FetchQuote(from show: String) async throws -> Quote {
        // build a fetch URL
        let quoteURL = baseURL.appending(path: "quotes/random")
        let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(name: "production", value: show)])
            
        
        
        //Fetch Data
        
        
        // handle response
        
        
        // decode data
        
        //return quote
        
        
    }
    
}
