//
//  LoginInteractor.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit
import CoreData

class LoginInteractor: LoginPresenterToInteractorProtocol {
  
    // MARK: Properties
    
    var presenter: LoginInteractorToPresenterProtocol?
    
    func login(withUsername username: String, withPassword password: String) {
        if username.isEmpty || password.isEmpty {
            presenter?.showFailedMessage(withMessage: "Please fill username or password")
        } else {
            CoreDataHelper.shared.saveUser(withUsername: username, withCompletion: { error in
                if error.isEmpty {
                    self.createProductList()
                } else {
                    self.presenter?.showFailedMessage(withMessage: error)
                }
            })
        }
    }
    
    func createProductList() {
        CoreDataHelper.shared.createProduct { (error) in
            if error.isEmpty {
                UserDefaults.standard.set(true, forKey: "isLogin")
                self.presenter?.showSuccessToDashboard()
            } else {
                self.presenter?.showFailedMessage(withMessage: error)
            }
        }
    }
}
