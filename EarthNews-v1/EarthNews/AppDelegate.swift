//
//  AppDelegate.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-13.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let mainVC = NewsFeedViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = setNavigationController(for: mainVC)
        
        return true
    }
    
    private func setNavigationController(for vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGreen]
        navController.navigationBar.barTintColor = .systemBackground
//        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}

