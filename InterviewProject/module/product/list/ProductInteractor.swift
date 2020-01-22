//
//  ProductInteractor.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

class ProductInteractor: ProductPresenterToInteractorProtocol {
    
    // MARK: Properties
    
    var presenter: ProductInteractorToPresenterProtocol?
    
    func getListProduct() {
        let product = CoreDataHelper.shared.getProductList()
        if product.isEmpty {
            presenter?.showFailed(withMessage: "Empty product list")
        } else {
            presenter?.showSuccess(withListProduct: product)
        }
    }
}
