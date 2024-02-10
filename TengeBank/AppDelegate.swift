//
//  AppDelegate.swift
//  TengeBank
//
//  Created by Turonboyev Diyorbek on 31/01/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabbarVC()
        window?.makeKeyAndVisible()
        
        return true
    }

}
