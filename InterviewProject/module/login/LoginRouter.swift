//
//  LoginRouter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: LoginPresenterToRouterProtocol {
   
    // MARK: Properties
    
    weak var view: LoginViewController?
    
    // MARK: Static methods
    
    static func createModule() -> LoginViewController {
        let viewController = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let presenter: LoginViewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func gotoDashboard() {
        let dashboard = DashboardRouter.createModule()
        view?.navigationController?.pushViewController(dashboard, animated: true)
    }
}
