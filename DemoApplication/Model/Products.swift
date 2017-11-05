//
//  Products.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
import ObjectMapper


class Products : Mappable{
    
    var productname:String?
    var price:String?
    var vendorname:String?
    var vendoraddress:String?
    var productImg:String?
    var productGallery:[String]?
    var phoneNumber:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        productname <- map[ProductModelKeys.productname.rawValue]
        price <- map[ProductModelKeys.price.rawValue]
        vendorname <- map[ProductModelKeys.vendorname.rawValue]
        vendoraddress <- map[ProductModelKeys.vendoraddress.rawValue]
        productImg <- map[ProductModelKeys.productImg.rawValue]
        productGallery <- map[ProductModelKeys.productGallery.rawValue]
        phoneNumber <- map[ProductModelKeys.phoneNumber.rawValue]
    }
    
}
