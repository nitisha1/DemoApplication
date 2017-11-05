//
//  ProductViewModel.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

protocol ProductViewModelType {
    
    var viewDelegate : ProductViewDelegate? { get set }
    var productArray:[Products]?{get set}
    func getProductDetails()
}

class ProductViewModel: ProductViewModelType {
    var productArray: [Products]?

    var viewDelegate: ProductViewDelegate?
    
    init()
    {
        
        productArray = [Products]()
    }
    
    
    func getProductDetails() {
        
        let URL = "https://mobiletest-hackathon.herokuapp.com/getdata/"
        Alamofire.request(URL).responseObject { (response: DataResponse<Items>) in
            
            print(response.response?.statusCode)
            if let productArray = response.result.value?.products
            {
                print(productArray.count )
                self.productArray = productArray
                self.viewDelegate?.resfreshList()
            }
        }
    }

}



protocol ProductViewDelegate {
  
    func resfreshList()
}
