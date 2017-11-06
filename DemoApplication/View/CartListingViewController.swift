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
    
    
    
    @IBOutlet weak var lbl_TotalPrice: UILabel!
    @IBOutlet weak var tbl_CartList: UITableView!
    var viewModel :CartViewModelType
    
    init(_ model : CartViewModelType)
    {
        self.viewModel = model
        super.init(nibName: nil, bundle: nil)
        viewModel.viewDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(addToCart(notification:)), name: notificationNameAddToCart, object: nil)

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.UpdateTotalPrice()
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
        self.tbl_CartList.reloadData()
     }
    
    
    @objc func addToCart(notification: NSNotification)
    {
        if  let itemToAdd = notification.userInfo!["data"] as? Products
        {
            self.viewModel.cartArray?.append(itemToAdd)
            DispatchQueue.main.async
            {
                if self.tbl_CartList != nil
                {
                self.tbl_CartList.reloadData()
                 self.viewModel.UpdateTotalPrice()
                }
            }
        }
    }
    
      func removeFromCart(_ button: UIButton)
    {
        let index = Int(button.layer.name!)
        if let addItem = self.viewModel.cartArray?[index!]
        {
            self.viewModel.cartArray?.remove(at: index!)
            let path  = IndexPath(row: index!, section: 0)
            self.tbl_CartList.deleteRows(at: [path], with: .automatic)
            self.viewModel.UpdateTotalPrice()
            NotificationCenter.default.post(name: notificationNameRemoveFromCart, object:nil , userInfo: ["data": addItem])
        }
    }
    
   
    
}

extension CartListingViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (self.viewModel.cartArray?.count)!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cart_reusable_identifier, for: indexPath) as! CartListTableViewCell
        if let product = self.viewModel.cartArray?[indexPath.row]
        {
            cell.configureCell(product : product)
        }
        let btnRemove = cell.viewWithTag(33) as! UIButton
        btnRemove.addTarget(self, action: #selector(self.removeFromCart(_:)), for: UIControlEvents.touchUpInside)
        btnRemove.layer.name = indexPath.row.description
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
    func updatepriceLabel(total : Int)
    {
        if total > 0
        {
        DispatchQueue.main.async {
            self.lbl_TotalPrice.isHidden = false
            if self.lbl_TotalPrice != nil{
            self.lbl_TotalPrice.text = "Total  \(total.description)"
            }
        }
        }
        else
        {
            lbl_TotalPrice.isHidden = true
        }
    }
}


