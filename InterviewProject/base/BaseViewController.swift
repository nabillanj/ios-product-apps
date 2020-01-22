//
//  BaseViewController.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Set Navigation Bar Title and Styles
    ///
    /// - Parameter title: Title of Navigation Bar
    func setupNavTitle(_ title: String? = "") {
        if let title = title {
            navigationItem.title = title
        }
        
        setupNavColor()
        setNavbarHidden(isHidden: false)
    }
    
    
    /// Setup Navigation Bar color
    func setupNavColor() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    
    /// Styling Back Button Item
    ///
    /// - Parameter back: isShowing Back Button
    func setupBackButton(withBackButton back: Bool = false) {
        var items = [UIBarButtonItem]()
        
        if (back == true) {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "ic_back")!.withRenderingMode(.alwaysTemplate), for: .normal)
            button.addTarget(self, action:#selector(onBackPressed), for: .touchUpInside)
            button.frame = CGRect(x: 0, y: 0, width: 28, height: 60)
            button.widthAnchor.constraint(equalToConstant: button.frame.width).isActive = true
            
            let barButtonItemMenu = UIBarButtonItem()
            barButtonItemMenu.customView = button
            items.append(barButtonItemMenu)
            self.navigationItem.hidesBackButton = false
            self.navigationItem.leftBarButtonItems = items
        }else {
            self.navigationItem.hidesBackButton = true
        }
    }
    
    /// Showing Message Action with one OK Action
    ///
    /// - Parameter message: String of message
    func showAlertMessage(withMessage message: String) {
        let alertController = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    /// Set Hidden Navigation Bar
    ///
    /// - Parameter isHidden: Boolean of navbar hidden state
    func setNavbarHidden(isHidden: Bool = true) {
        self.navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    
    
    /// Function to back from previous controller
    @objc func onBackPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}
