//
//  ProductRouter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class ProductRouter: ProductPresenterToRouterProtocol {
    // MARK: Properties
    
    weak var view: ProductViewController?
    
    // MARK: Static methods
    
    static func createModule() -> ProductViewController {
        let viewController = UIStoryboard.init(name: "Product", bundle: nil).instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        let presenter: ProductViewToPresenterProtocol & ProductInteractorToPresenterProtocol = ProductPresenter()
        let router = ProductRouter()
        let interactor = ProductInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        router.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func gotoDetailProduct(withId id: String, withListProduct listProduct: [ProductModel]) {
        let detailProduct = DetailProductRouter.createModule()
        detailProduct.hidesBottomBarWhenPushed = true
        detailProduct.productId = id
        detailProduct.arrayOfProduct = listProduct
        view?.navigationController?.pushViewController(detailProduct, animated: true)
    }
}
