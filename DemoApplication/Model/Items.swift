//
//  Items.swift
//  DemoApplication
//
//  Created by Nitisha on 05/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
import ObjectMapper
class Items: Mappable {
    
    var products : [Products]?
    
    required init?(map: Map) {
        
    }
    
      func mapping(map: Map) {
        products <- map["products"]
    }
}
