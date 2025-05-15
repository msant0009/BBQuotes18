//
//  StringExt.swift
//  BBQuotes18
//
//  Created by Mark Santoro on 5/15/25.
//

import Foundation

//extend the String type to accept two new functions
extension String {
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        self.removeSpaces().lowercased()
    }
    
    
    
    
    
}
