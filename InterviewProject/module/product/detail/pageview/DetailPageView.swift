//
//  DetailPageView.swift
//  InterviewProject
//
//  Created by Nabilla on 21/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class DetailPageView: UIViewController {
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    var image: UIImage? {
        didSet {
            self.imgProduct?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgProduct?.image = image
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
