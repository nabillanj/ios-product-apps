//
//  DetailProductRouter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class DetailProductRouter: DetailProductPresenterToRouterProtocol {
    
    // MARK: Properties
    
    weak var view: DetailProductViewController?
    
    // MARK: Static methods
    
    static func createModule() -> DetailProductViewController {
        let viewController = UIStoryboard.init(name: "DetailProduct", bundle: nil).instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        let presenter: DetailProductViewToPresenterProtocol & DetailProductInteractorToPresenterProtocol = DetailProductPresenter()
        let router = DetailProductRouter()
        let interactor = DetailProductInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
