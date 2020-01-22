//
//  LoginContract.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenterToViewProtocol: class {
    func showSuccessToDashboard()
    func showFailedMessage(withMessage message:String)
}

protocol LoginPresenterToInteractorProtocol: class {
    var presenter: LoginInteractorToPresenterProtocol? { get set }
    func login(withUsername username:String, withPassword password:String)
    func createProductList()
}

protocol LoginInteractorToPresenterProtocol: class {
    func showSuccessToDashboard()
    func showFailedMessage(withMessage message:String)
}

protocol LoginViewToPresenterProtocol: class {
    var view: LoginPresenterToViewProtocol? { get set }
    var interactor: LoginPresenterToInteractorProtocol? { get set }
    var router: LoginPresenterToRouterProtocol? { get set }
    func login(withUsername username:String, withPassword password:String)
}

protocol LoginPresenterToRouterProtocol: class {
    static func createModule() -> LoginViewController
    func gotoDashboard()
}
