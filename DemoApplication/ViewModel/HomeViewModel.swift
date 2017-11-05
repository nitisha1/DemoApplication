//
//  HomeViewModel.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation

 
protocol HomeViewModelType {
    
    var viewDelegate : HomeViewDelegate? { get set }
    
}

class HomeViewModel: HomeViewModelType {
    var viewDelegate: HomeViewDelegate?

 
}



protocol HomeViewDelegate
{
    
}
