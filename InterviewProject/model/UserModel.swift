//
//  UserModel.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit
import CoreData

class UserModel: NSObject {

    var username: String?
    var phoneNumber: String?
    var gender: String?
    
    init(withUsername username: String,
         withPhoneNumber phoneNumber: String,
         withGender gender: String) {
        self.username = username
        self.phoneNumber = phoneNumber
        self.gender = gender
    }
    
}
