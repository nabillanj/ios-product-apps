//
//  ProfileInteractor.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit
import CoreData

class ProfileInteractor: ProfilePresenterToInteractorProtocol {
    
    // MARK: Properties
    
    var presenter: ProfileInteractorToPresenterProtocol?
    
    func getProfileData() {
        if let profile = CoreDataHelper.shared.getProfile() {
            self.presenter?.showSuccess(withProfile: profile)
        } else {
            self.presenter?.showFailed(withMessage: "Error showing profile")
        }
    }
}
