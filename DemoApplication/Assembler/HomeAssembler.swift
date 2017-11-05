//
//  HomeAssembler.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
protocol HomeAssembler {
    
    func resolve() -> HomeBarViewController
    
    func resolve() -> HomeViewModelType
    
}

extension HomeAssembler
{
   func resolve() -> HomeBarViewController
   {
    return HomeBarViewController(resolve())
    }
    
    func resolve() -> HomeViewModelType {
        return HomeViewModel()
    }
}
