//
//  ProfileRouter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class ProfileRouter: ProfilePresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: ProfileViewController?
    
    // MARK: Static methods
    
    static func createModule() -> ProfileViewController {
        let viewController = UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let presenter: ProfileViewToPresenterProtocol & ProfileInteractorToPresenterProtocol = ProfilePresenter()
        let router = ProfileRouter()
        let interactor = ProfileInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
