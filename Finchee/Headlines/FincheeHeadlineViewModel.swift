//
//  FincheeHeadlineViewModel.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/16/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import Foundation


class FincheeHeadlineViewModel {
    let title: String
    let text: String
    let link: String
    
    init(title: String, text: String, link: String) {
        self.title = title
        self.text = text
        self.link = link
    }
}
