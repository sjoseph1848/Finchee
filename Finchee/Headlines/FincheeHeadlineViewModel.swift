//
//  FincheeHeadlineViewModel.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/16/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import Foundation


class FincheeHeadlineViewModel {
    let name: String
    let title: String
    let url: String
    
    init(name: String, title: String, url: String) {
        self.name = name
        self.title = title
        self.url = url
    }
}
