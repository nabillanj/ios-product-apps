//
//  ProductPresenter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

class ProductPresenter: ProductViewToPresenterProtocol, ProductInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    var view: ProductPresenterToViewProtocol?
    var interactor: ProductPresenterToInteractorProtocol?
    var router: ProductPresenterToRouterProtocol?
    
    func getListProduct() {
        interactor?.getListProduct()
    }
    
    func showSuccess(withListProduct listOfProduct: [ProductModel]) {
        view?.showSuccess(withListProduct: listOfProduct)
    }
    
    func showFailed(withMessage message: String) {
        view?.showFailed(withMessage: message)
    }

}
