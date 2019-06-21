//
//  FincheeNewsData.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/16/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import Foundation

struct RobinhoodDataModel {
    var cards: [FincheeHeadlineViewModel] = []
    
    init(jsonContent: [[String: String]]) {
        self.cards = jsonContent.compactMap({ (cardModelJSON) -> FincheeHeadlineViewModel? in
            guard let title = cardModelJSON["title"],
                let text = cardModelJSON["text"],
                let link = cardModelJSON["link"] else { return nil }
            
            return FincheeHeadlineViewModel(title: title, text: text, link: link)
        })
    }
}

class RobinhoodData {
    static let jsonURL = Bundle.main.url(forResource: "RobinhoodData", withExtension: "json")!
    
    static var data: RobinhoodDataModel {
        do {
            let cardsData = try Data(contentsOf: jsonURL)
            
            if let cardsContent = try JSONSerialization.jsonObject(with: cardsData, options: JSONSerialization.ReadingOptions()) as? [[String: String]] {
                
                return RobinhoodDataModel(jsonContent: cardsContent)
                
            } else {
                return RobinhoodDataModel(jsonContent: [])
            }
        }
            
        catch {
            return RobinhoodDataModel(jsonContent: [])
        }
    }
}
