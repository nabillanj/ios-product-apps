//
//  ProductViewController.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ProductViewToPresenterProtocol?
    private var listOfProduct: [ProductModel] = []
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    /// Styling UI
    func setupUI() {
        setupNavColor()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(ProductCell.nib, forCellReuseIdentifier: ProductCell.identifier)
        
        presenter?.getListProduct()
    }
}

extension ProductViewController: ProductPresenterToViewProtocol {
    func showSuccess(withListProduct listOfProduct: [ProductModel]) {
        self.listOfProduct = listOfProduct
        tableView.reloadData()
    }
    
    func showFailed(withMessage message: String) {
        showAlertMessage(withMessage: message)
    }
}

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        productCell.bind(withProduct: listOfProduct[indexPath.row])
        
        return productCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter?.router?.gotoDetailProduct(withId: listOfProduct[indexPath.row].productId, withListProduct: listOfProduct)
    }
}
