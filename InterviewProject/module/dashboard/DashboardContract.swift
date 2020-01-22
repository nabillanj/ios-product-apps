//
//  DashboardContract.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

protocol DashboardPresenterToViewProtocol: class {
    // TODO: Declare Presenter to View methods
}

protocol DashboardPresenterToInteractorProtocol: class {
    var presenter: DashboardInteractorToPresenterProtocol? { get set }
    // TODO: Declare Presenter to Interactor methods
}

protocol DashboardInteractorToPresenterProtocol: class {
    // TODO: Declare Interactor to Presenter methods
}

protocol DashboardViewToPresenterProtocol: class {
    var view: DashboardPresenterToViewProtocol? { get set }
    var interactor: DashboardPresenterToInteractorProtocol? { get set }
    var router: DashboardPresenterToRouterProtocol? { get set }
    // TODO: Declare View to Presenter methods
}

protocol DashboardPresenterToRouterProtocol: class {
    static func createModule() -> DashboardViewController
    // TODO: Declare Presenter to Router methods
}
