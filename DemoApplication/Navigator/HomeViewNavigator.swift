//
//  HomeViewNavigator.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewNaviatorType {
    
    func navigateToViewController(window: UIWindow?)
}

struct HomeViewNavigator: HomeViewNaviatorType {
    
    
    private let assembler: Assembler
    
    init(assembler : Assembler) {
        
        self.assembler = assembler
        
    }
    internal func navigateToViewController(window: UIWindow?) {
        
        let viewController: HomeBarViewController = assembler.resolve()
        let navigationController = UINavigationController(rootViewController: viewController)
       // UIApperences.setstatusbarappreance(color: UIColor.clear)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
