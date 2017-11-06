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
    var cartArray:[Products]?{get set}
    func UpdateTotalPrice()
}

class CartViewModel: CartViewModelType {
    func UpdateTotalPrice()
    {
        let totalSum = cartArray?.reduce(0, {$0 + Int($1.price!)!})
         viewDelegate?.updatepriceLabel(total: totalSum!)
    }

    var cartArray: [Products]?
    var viewDelegate: CartViewDelegate?
    
    
    init() {
        
        cartArray = [Products]()
    }
}



protocol CartViewDelegate
{
    func updatepriceLabel(total : Int)
}
