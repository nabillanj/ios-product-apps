//
//  DetailProductPresenter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

class DetailProductPresenter: DetailProductViewToPresenterProtocol, DetailProductInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    var view: DetailProductPresenterToViewProtocol?
    var interactor: DetailProductPresenterToInteractorProtocol?
    var router: DetailProductPresenterToRouterProtocol?

}
