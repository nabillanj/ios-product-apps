//
//  CoreDataHelper.swift
//  InterviewProject
//
//  Created by Nabilla on 22/01/20.
//  Copyright © 2020 PT Intersolusi Teknologi Asia. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    
    static let shared = CoreDataHelper()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "InterviewProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - User Entity
    
    /// Save Login username to core data
    ///
    /// - Parameters:
    ///   - username: String of username
    ///   - completion: Return string of error message, will send empty string if success
    func saveUser(withUsername username: String, withCompletion completion: @escaping(String) -> Void) {
        let managedContext = CoreDataHelper.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        let data = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        data.setValue(username, forKey: "username")
        data.setValue("Male", forKey: "gender")
        data.setValue("022 12345678", forKey: "phone_number")
        
        do {
            try managedContext.save()
            completion("")
        } catch let error {
            completion(error.localizedDescription)
        }
    }
    
    /// Get data profile
    ///
    /// - Returns: Optional User, will return nil if user not found
    func getProfile() -> UserModel? {
        let managedContext = CoreDataHelper.shared.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let result = try managedContext.fetch(request) as! [NSManagedObject]
            if let profile = result.first {
                let user = UserModel(withUsername: profile.value(forKey: "username") as! String,
                                     withPhoneNumber: profile.value(forKey: "phone_number")  as! String,
                                     withGender: profile.value(forKey: "gender") as! String)
                return user
            }
        } catch let error {
            print("Error get profile \(error.localizedDescription)")
        }
        
        return nil
    }
    
    // MARK: - Product Entity
    
    
    /// Create Product
    ///
    /// - Parameter completion: return string of error message, will send empty string if success
    func createProduct(withCompletion completion: @escaping(String) -> Void) {
        var errorMessage = ""
        
        let managedContext = CoreDataHelper.shared.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "Product", in: managedContext)

        for id in 1...5 {
            let data = NSManagedObject(entity: userEntity!, insertInto: managedContext)
            data.setValue("ID\(id)", forKey: "product_id")
            data.setValue("Product \(id)", forKey: "product_name")
            data.setValue("img\(id)", forKey: "product_image")
            do {
                try managedContext.save()
            } catch let error {
                errorMessage = error.localizedDescription
            }
        }
        
        completion(errorMessage)
    }
    
    
    /// Return List of Product
    ///
    /// - Returns: List of Product
    func getProductList() -> [ProductModel] {
        let managedContext = CoreDataHelper.shared.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        var arrayOfProduct: [ProductModel] = []
        do {
            let result = try managedContext.fetch(request) as! [NSManagedObject]
            for data in result {
                let product = ProductModel(withProductName: data.value(forKey: "product_name") as! String,
                                           withProductId: data.value(forKey: "product_id") as! String,
                                           withProductImage: data.value(forKey: "product_image") as! String)
                arrayOfProduct.append(product)
            }
            
            return arrayOfProduct
        } catch let error {
            print("Error get profile \(error.localizedDescription)")
        }
        
        return arrayOfProduct
    }
}
