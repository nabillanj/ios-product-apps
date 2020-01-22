//
//  DashboardRouter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class DashboardRouter: DashboardPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: DashboardViewController?
    
    // MARK: Static methods
    
    static func createModule() -> DashboardViewController {
        let viewController = UIStoryboard.init(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        let presenter: DashboardViewToPresenterProtocol & DashboardInteractorToPresenterProtocol = DashboardPresenter()
        let router = DashboardRouter()
        let interactor = DashboardInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
