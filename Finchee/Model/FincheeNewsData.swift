//
//  FincheeNewsData.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/16/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import Foundation

//will use mock data from .json file for now until API is connected. 
struct FincheeDataModel {
    var headlines : [FincheeHeadlineViewModel] = []
    
    init(jsonContent: [[String:String]]){
        self.headlines = jsonContent.compactMap({ (headlineModelJSON) -> FincheeHeadlineViewModel? in
            guard let name = headlineModelJSON["name"],
                let title = headlineModelJSON["title"],
                let url = headlineModelJSON["url"] else { return nil }
            
            return FincheeHeadlineViewModel(name:name,title:title,url:url)
        })
    }
}

class FincheeNewsData {
    static let jsonURL = Bundle.main.url(forResource: "FincheeNewsData", withExtension: "json")!
    
    static var data: FincheeDataModel {
        do {
            let headlinesData = try Data(contentsOf: jsonURL)
            
            if let headlinesContent = try JSONSerialization.jsonObject(with: headlinesData, options: JSONSerialization.ReadingOptions()) as? [[String: String]] {
                
                return FincheeDataModel(jsonContent: headlinesContent)
                
            } else {
                return FincheeDataModel(jsonContent: [])
            }
        }
            
        catch {
            return FincheeDataModel(jsonContent: [])
        }
    }
}
