//
//  SearchResult.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/23/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import Foundation

struct SearchResult:Decodable {
    let symbolsList:[Symbols]
    
}

struct Symbols:Decodable {
    let symbol: String
    let name: String
    let price: Float 
}
