//
//  ProductViewModel.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
protocol ProductViewModelType {
    
    var viewDelegate : ProductViewDelegate? { get set }
    
}

class ProductViewModel: ProductViewModelType {
    var viewDelegate: ProductViewDelegate?
}



protocol ProductViewDelegate {
    
}
