//
//  DashboardPresenter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

class DashboardPresenter: DashboardViewToPresenterProtocol, DashboardInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    var view: DashboardPresenterToViewProtocol?
    var interactor: DashboardPresenterToInteractorProtocol?
    var router: DashboardPresenterToRouterProtocol?
    
    // TODO: implement ViewToPresenterProtocol or InteractorToPresenterProtocol methods
}
