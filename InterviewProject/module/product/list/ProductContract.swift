//
//  ProductContract.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

protocol ProductPresenterToViewProtocol: class {
    func showSuccess(withListProduct listOfProduct: [ProductModel])
    func showFailed(withMessage message: String)
}

protocol ProductPresenterToInteractorProtocol: class {
    var presenter: ProductInteractorToPresenterProtocol? { get set }
    func getListProduct()
}

protocol ProductInteractorToPresenterProtocol: class {
    func showSuccess(withListProduct listOfProduct: [ProductModel])
    func showFailed(withMessage message: String)
}

protocol ProductViewToPresenterProtocol: class {
    var view: ProductPresenterToViewProtocol? { get set }
    var interactor: ProductPresenterToInteractorProtocol? { get set }
    var router: ProductPresenterToRouterProtocol? { get set }
    func getListProduct()
}

protocol ProductPresenterToRouterProtocol: class {
    static func createModule() -> ProductViewController
    func gotoDetailProduct(withId id:String, withListProduct listProduct:[ProductModel])
}
