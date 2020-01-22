//
//  DetailProductViewController.swift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class DetailProductViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var pageProductControl: UIPageControl!

    var arrayOfProduct: [ProductModel] = []
    var productId: String = ""
    private var controllers: [UIViewController] = []
    private var pageViewController: UIPageViewController {
        return self.children[0] as! UIPageViewController
    }
    
    var presenter: DetailProductViewToPresenterProtocol?

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// Styling UI
    func setupUI() {
        setupNavTitle("Product Detail")
        setupBackButton(withBackButton: true)

        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        for _ in arrayOfProduct {
            let detailPageView = UIStoryboard.init(name: "DetailPageView", bundle: nil).instantiateViewController(withIdentifier: "DetailPageView")
            controllers.append(detailPageView)
        }
        
        if let indexRow = arrayOfProduct.firstIndex(where: { $0.productId == productId }) {
            turnToPage(withIndex: indexRow)
        }
        
        pageProductControl.numberOfPages = arrayOfProduct.count
    }
    
    
    /// Check Next/Previous Page with Selected Index as parameter
    ///
    /// - Parameter index: Int of index
    func turnToPage(withIndex index: Int) {
        let productController = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        
        if let currentVC = pageViewController.viewControllers?.first {
            let currentIndex = controllers.firstIndex(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        
        configureDisplaying(withController: productController)
        pageViewController.setViewControllers([productController], direction: direction, animated: true, completion: nil)
    }
    
    
    /// Styling PageViewController and Page Control
    ///
    /// - Parameter viewController: Selected UIViewController
    func configureDisplaying(withController viewController: UIViewController) {
        for (index, controller) in controllers.enumerated() {
            if viewController == controller {
                if let productController = viewController as? DetailPageView {
                    productController.image = UIImage(named: arrayOfProduct[index].productImage)
                    pageProductControl.currentPage = index
                }
            }
        }
    }
}

extension DetailProductViewController: DetailProductPresenterToViewProtocol {
    
}

extension DetailProductViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(withController: pendingViewControllers.first as! DetailPageView)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            self.configureDisplaying(withController: previousViewControllers.first as! DetailPageView)
        }
    }
}
