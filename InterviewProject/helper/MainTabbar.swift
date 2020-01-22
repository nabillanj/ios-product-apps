//
//  MainTabbar.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class MainTabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    /// Styling UI
    func setupUI() {
        let product = ProductRouter.createModule()
        let profile = ProfileRouter.createModule()
        
        product.tabBarItem = UITabBarItem(title: "Product", image: UIImage(named: "ic_product")?.withRenderingMode(.alwaysTemplate), tag: 1)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "ic_profile")?.withRenderingMode(.alwaysTemplate), tag: 2)
        
        viewControllers = [
            UINavigationController(rootViewController: product),
            UINavigationController(rootViewController: profile)
        ]
    }
}

extension MainTabbar: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
