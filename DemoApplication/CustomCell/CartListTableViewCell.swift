//
//  CartListTableViewCell.swift
//  DemoApplication
//
//  Created by Nitisha on 05/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import UIKit

class CartListTableViewCell: UITableViewCell {

    @IBOutlet weak var view_Background: UIView!
    @IBOutlet weak var lbl_ProductName: UILabel!
    @IBOutlet weak var lbl_Address: UILabel!
    @IBOutlet weak var btn_Call: UIButton!
     override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lbl_Price: UILabel!
    @IBOutlet weak var btn_Remove: UIButton!
    @IBOutlet weak var lbl_VendorName: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell()
    {
        self.view_Background.createCardView()
        self.btn_Call.addBorderToButton()
        self.btn_Remove.addBorderToButton()
    }
    
}
