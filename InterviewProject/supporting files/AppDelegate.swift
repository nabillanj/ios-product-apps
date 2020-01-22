//
//  AppDelegate.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        checkLoginState()
        
        return true
    }

    func checkLoginState() {
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        
        var controller: UIViewController?
        if isLogin {
            controller = DashboardRouter.createModule()
        } else {
            controller = LoginRouter.createModule()
        }
    
        guard let vc = controller else {
            return
        }
        let navigation = UINavigationController(rootViewController: vc)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }

}

