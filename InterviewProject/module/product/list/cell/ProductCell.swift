//
//  ProductCell.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    /// Styling UI function
    func setupUI() {
        imgProduct.layer.cornerRadius = 8.0
    }
    
    
    /// Set Image Product
    ///
    /// - Parameter images: UIImage of selected product image
    func bind(withProduct product:ProductModel) {
        imgProduct.image = UIImage(named: product.productImage)
    }
    
    
    /// To return product cell identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    /// To return nib of product cell
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
