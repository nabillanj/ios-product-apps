//
//  LoginPresenter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

class LoginPresenter: LoginViewToPresenterProtocol, LoginInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    var view: LoginPresenterToViewProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    var router: LoginPresenterToRouterProtocol?
    
    func login(withUsername username: String, withPassword password: String) {
        interactor?.login(withUsername: username, withPassword: password)
    }
    
    func showSuccessToDashboard() {
        view?.showSuccessToDashboard()
    }
    
    func showFailedMessage(withMessage message: String) {
        view?.showFailedMessage(withMessage: message)
    }
}
