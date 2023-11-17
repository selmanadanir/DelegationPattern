//
//  AppDelegate.swift
//  DelegateDemo
//
//  Created by Selman Adanır on 24.08.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let rootVC = UINavigationController(rootViewController: FirstController())
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }
}
