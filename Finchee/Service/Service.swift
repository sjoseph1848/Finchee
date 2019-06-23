//
//  Service.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/23/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchSymbols(completion:@escaping ([Symbols],Error?) -> ()) {
        print("Fetching symbolList from Service Layer")
        
        let urlString = "https://financialmodelingprep.com/api/v3/company/stock/list"
        
        guard let url = URL(string: urlString) else {return}
        //fetch data from internet
        URLSession.shared.dataTask(with: url) {(data,resp,err) in
            
            if let err = err {
                print("Failed to fetch apps:",err)
                completion([],nil)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let searchResult = try
                    JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.symbolsList, nil)
                
            }catch let jsonErr {
                print("failed to decode json:",jsonErr)
                completion([],jsonErr)
            }
            
            }.resume() //fires off the request

    }
}
