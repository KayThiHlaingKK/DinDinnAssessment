//
//  AppCoordinator.swift
//  CodeTest
//
//  Created by Hive Innovation on 23/10/2022.
//

import UIKit
class AppCoordinator {
    
    static let shared = AppCoordinator()
    
    func coordinate(window: UIWindow?) {
        window?.rootViewController = UINavigationController(rootViewController: BaseTabBarController())
        window?.makeKeyAndVisible()
    }
}

func shared() -> AppDelegate
{
    return UIApplication.shared.delegate as! AppDelegate
}
