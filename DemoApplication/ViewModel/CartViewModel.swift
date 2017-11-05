//
//  CartViewModel.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
protocol CartViewModelType {
    
    var viewDelegate : CartViewDelegate? { get set }
    
}

class CartViewModel: CartViewModelType {
    var viewDelegate: CartViewDelegate?
}



protocol CartViewDelegate {
    
}
