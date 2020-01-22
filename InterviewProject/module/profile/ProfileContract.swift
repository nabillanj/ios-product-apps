//
//  ProfileContract.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

protocol ProfilePresenterToViewProtocol: class {
    func showSuccess(withProfile profile: UserModel)
    func showFailed(withMessage message: String)
}

protocol ProfilePresenterToInteractorProtocol: class {
    var presenter: ProfileInteractorToPresenterProtocol? { get set }
    func getProfileData()
}

protocol ProfileInteractorToPresenterProtocol: class {
    func showSuccess(withProfile profile: UserModel)
    func showFailed(withMessage message: String)
}

protocol ProfileViewToPresenterProtocol: class {
    var view: ProfilePresenterToViewProtocol? { get set }
    var interactor: ProfilePresenterToInteractorProtocol? { get set }
    var router: ProfilePresenterToRouterProtocol? { get set }
    
    func getProfileData()
}

protocol ProfilePresenterToRouterProtocol: class {
    static func createModule() -> ProfileViewController
}
