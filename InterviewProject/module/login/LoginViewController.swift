//
//  LoginViewController.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    var presenter: LoginViewToPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// Styling UI
    func setupUI() {
        setNavbarHidden()
    }
    
    // MARK: - Actions
    @IBAction func didClickLoginButton(_ sender: Any) {
        presenter?.login(withUsername: tfUsername.text!, withPassword: tfPassword.text!)
    }
}

extension LoginViewController: LoginPresenterToViewProtocol {
    func showSuccessToDashboard() {
        presenter?.router?.gotoDashboard()
    }
    
    func showFailedMessage(withMessage message: String) {
        showAlertMessage(withMessage: message)
    }
    
}
