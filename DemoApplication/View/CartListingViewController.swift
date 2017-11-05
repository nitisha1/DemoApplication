//
//  CartListingViewController.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import UIKit
private let cart_reusable_identifier = "CartListCell"

class CartListingViewController: UIViewController {
    
    
    
    @IBOutlet weak var tbl_CartList: UITableView!
    var viewModel :CartViewModelType
    
    init(_ model : CartViewModelType)
    {
        self.viewModel = model
        super.init(nibName: nil, bundle: nil)
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView()  {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CartListTableViewCell", bundle: bundle)
        self.tbl_CartList?.register(nib, forCellReuseIdentifier: cart_reusable_identifier)
        self.tbl_CartList.tableFooterView = UIView()
        self.tbl_CartList.delegate = self
        self.tbl_CartList.dataSource = self
        self.navigationItem.title = "Cart"
     }
}

extension CartListingViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cart_reusable_identifier, for: indexPath) as! CartListTableViewCell
       cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150.0
    }
 
   
}

extension CartListingViewController : CartViewDelegate
{
}


