//
//  BaseTabBarController.swift
//  CodeTest
//
//  Created by Hive Innovation on 23/10/2022.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarUI()
        insertTabBar()
    }
    
    fileprivate func setupTabBarUI() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .darkGray
        tabBar.unselectedItemTintColor = .lightGray
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 12)!],
            for: .normal)
       
    }
    
    fileprivate func insertTabBar() {
        //HomeTab
        let homeVC = HomeRouter().viewController
        homeVC.tabBarItem.image = UIImage.imageName(.home)
        homeVC.tabBarItem.tag = 0
        

        //FavouriteTab
        let favVC = UIViewController()
        favVC.tabBarItem.image = UIImage.imageName(.favourite)
        favVC.tabBarItem.tag = 1
        
        
        //ProfileTab
        let profileVC = ProfileRouter().viewController
        profileVC.tabBarItem.image = UIImage.imageName(.profile)
        profileVC.tabBarItem.tag = 2
        
        viewControllers = [homeVC, favVC, profileVC]
        self.selectedIndex = 0
    }
}
