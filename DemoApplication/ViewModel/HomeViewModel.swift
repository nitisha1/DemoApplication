//
//  HomeViewModel.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
 
protocol HomeViewModelType {
    
    var viewDelegate : HomeViewDelegate? { get set }
    func getProductDetails()
}

class HomeViewModel: HomeViewModelType {
   

    var viewDelegate: HomeViewDelegate?
    
    func getProductDetails() {
        
        let URL = "https://mobiletest-hackathon.herokuapp.com/getdata/"
        Alamofire.request(URL).responseObject { (response: DataResponse<Items>) in
        
            let productArray = response.result.value?.products
            print(productArray?.count ?? 0)
        }
    }
}



protocol HomeViewDelegate {
    
}
