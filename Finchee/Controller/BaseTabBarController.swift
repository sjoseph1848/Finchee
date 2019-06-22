//
//  BaseTabBarController.swift
//  Finchee
//
//  Created by Samuel Joseph on 6/21/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit


class BaseTabBarController:UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewControllers = [
        createNavController(viewController: UIViewController(), title: "Stock News", imageName: "apps"),
        createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
        createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search")
        ]
        
        
    }
    fileprivate func createNavController(viewController:UIViewController,title:String,imageName:String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named:imageName)
    
        return navController
    }
}
