//
//  DetailProductContract.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

protocol DetailProductPresenterToViewProtocol: class {
}

protocol DetailProductPresenterToInteractorProtocol: class {
    var presenter: DetailProductInteractorToPresenterProtocol? { get set }
}

protocol DetailProductInteractorToPresenterProtocol: class {
}

protocol DetailProductViewToPresenterProtocol: class {
    var view: DetailProductPresenterToViewProtocol? { get set }
    var interactor: DetailProductPresenterToInteractorProtocol? { get set }
    var router: DetailProductPresenterToRouterProtocol? { get set }
    
}

protocol DetailProductPresenterToRouterProtocol: class {
    static func createModule() -> DetailProductViewController
    // TODO: Declare Presenter to Router methods
}
