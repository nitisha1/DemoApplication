//
//  CollectionViewCell.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view_background: UIView!
    @IBOutlet weak var img_Product: UIImageView!
    @IBOutlet weak var lbl_productName: UILabel!
    @IBOutlet weak var lbl_Price: UILabel!
    @IBOutlet weak var lbl_vendorName: UILabel!
    
    @IBOutlet weak var lbl_VendorAdd: UILabel!
    @IBOutlet weak var lbl_PriceValue: UILabel!
    
    @IBOutlet weak var btn_AddToCart: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    func setUpCell(product : Products)
    {
        view_background.createCardView()
        lbl_productName.text = product.productname
        lbl_VendorAdd.text = product.vendoraddress
        lbl_PriceValue.text = product.price
        lbl_vendorName.text = product.vendorname
        
     }
    
    
    @IBAction func action_AddToCart(_ sender: UIButton)
    {
        
    }
    
}
