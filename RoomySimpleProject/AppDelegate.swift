//
//  AppDelegate.swift
//  RoomySimpleProject
//
//  Created by Ammar.M on 3/10/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        var vc = UINavigationController()
        vc = UINavigationController(rootViewController: LaunchScreenViewController())
        vc.isNavigationBarHidden = true
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
    }
}

