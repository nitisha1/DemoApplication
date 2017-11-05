//
//  GenericExtensions.swift
//  DemoApplication
//
//  Created by Nitisha on 05/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func createCardView() {
        
        let cornerRadius: CGFloat = 2
        
          let shadowOffsetWidth: Int = 0
          let shadowOffsetHeight: Int = 1
          let shadowColor: UIColor? = UIColor.black
           let shadowOpacity: Float = 0.1
    
        self.layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor?.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
    }
    
    
    
}


extension UIButton
{
    
    func addBorderToButton()
    {
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 2
    }
}
