//
//  ProductModelswift
//  InterviewProject
//
//  Created by Nabilla on 20/01/20.
//  Copyright © 2020. All rights reserved.
//

import UIKit
import CoreData

class ProductModel: NSObject {
    
    var productName: String = ""
    var productId: String = ""
    var productImage: String = ""
    
    init(withProductName productName: String,
         withProductId productId: String,
         withProductImage productImage: String) {
        self.productId = productId
        self.productName = productName
        self.productImage = productImage
    }

}
