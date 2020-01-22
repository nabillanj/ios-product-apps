//
//  ProfilePresenter.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

class ProfilePresenter: ProfileViewToPresenterProtocol, ProfileInteractorToPresenterProtocol {
    
    // MARK: Properties
    
    var view: ProfilePresenterToViewProtocol?
    var interactor: ProfilePresenterToInteractorProtocol?
    var router: ProfilePresenterToRouterProtocol?
    
    func showSuccess(withProfile profile: UserModel) {
        view?.showSuccess(withProfile: profile)
    }
    
    func showFailed(withMessage message: String) {
        view?.showFailed(withMessage: message)
    }
    
    func getProfileData() {
        interactor?.getProfileData()
    }
    
}
