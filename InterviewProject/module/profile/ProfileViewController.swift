//
//  ProfileViewController.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: Properties
    var profileAccount: User?
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    var presenter: ProfileViewToPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // get profile data from database
        presenter?.getProfileData()
    }
    
    /// Styling UI
    func setupUI() {
        setupNavColor()
    }
}

extension ProfileViewController: ProfilePresenterToViewProtocol {
    func showSuccess(withProfile profile: UserModel) {
        lblUsername.text = profile.username
        lblGender.text = profile.gender
        lblPhoneNumber.text = profile.phoneNumber
    }
    
    func showFailed(withMessage message: String) {
        showAlertMessage(withMessage: message)
    }
}
