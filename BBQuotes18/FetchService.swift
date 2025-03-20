//
//  FetchService.swift
//  BBQuotes18
//
//  Created by Mark Santoro on 3/12/25.
//

import Foundation

struct FetchService { // some developers would call this FetchController
    private enum FetchError: Error {
        case badResponse
    }
    
    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    // this is the entire URL
    //https://breaking-bad-api-six.vercel.app/api/quotes/random?production=Breaking+Bad
    
    func fetchQuote(from show: String) async throws -> Quote {
        // build a fetch URL
        let quoteURL = baseURL.appending(path: "quotes/random")
        let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(name: "production", value: show)])
            
        //Fetch Data
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        // handle response
        // swift allows multiple guard checks on the same line:
        guard let response = response as? HTTPURLResponse, response.statusCode == 200// 200 = good response
        else {
            throw FetchError.badResponse
        }
              
        // decode data
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        //return quote
        
        return quote
        
    }
    
    func fetchCharacter(_ name: String) async throws -> Char {
        let characterURL = baseURL.appending(path: "characters")
        let fetchURL = characterURL.appending(queryItems: [URLQueryItem(name: "name", value: name)])
        
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200// 200 = good response
        else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let characters = try decoder.decode([Char].self, from: data)
        
        return characters[0]
        
    }
    
    func fetchDeath(for character: String) async throws -> Death? {
        let fetchURL = baseURL.appending(path: "deaths")
       
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200// 200 = good response
        else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deaths = try decoder.decode([Death].self, from: data)
        
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        
        return nil
        
        
    }
    
    
}
