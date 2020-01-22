//
//  DashboardViewController.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: MainTabbar {
    
    // MARK: Properties
    
    var presenter: DashboardViewToPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension DashboardViewController: DashboardPresenterToViewProtocol {
    // TODO: implement view to presenter methods
}
