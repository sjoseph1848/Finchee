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
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .black
        redViewController.navigationItem.title = "Stock News"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Stock News"
        redNavController.tabBarItem.image = UIImage(named:"apps")
        redNavController.navigationBar.prefersLargeTitles = true
        
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "Search"
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Search"
        blueNavController.navigationBar.prefersLargeTitles = true
        blueNavController.tabBarItem.image = #imageLiteral(resourceName: "search")
        
        
        viewControllers = [
        redNavController,
        blueNavController
        ]
        
    }
}
