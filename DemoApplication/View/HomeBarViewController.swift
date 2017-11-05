//
//  HomeBarViewController.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import UIKit

class HomeBarViewController: UITabBarController {
    
    
    var viewModel :HomeViewModelType
    
    init(_ model : HomeViewModelType)
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
        self.addTabBarControllers()
        // Do any additional setup after loading the view.
        //viewModel.getProductDetails()
        self.navigationItem.title = "Shop"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTabBarControllers()
    {
        
        tabBar.tintColor = UIColor.darkGray
        
        let productController = ProductListViewController(ProductViewModel())
        let cardListViewController = CartListingViewController(CartViewModel())
        
        
        productController.tabBarItem = UITabBarItem(
            title: "Products",
            image: UIImage(named: "ic_product"),
            tag: 1)
        cardListViewController.tabBarItem = UITabBarItem(
            title: "Cart",
            image:UIImage(named: "icons8_shopping_cart") ,
            tag:2)
        

        
        let tabControllers = [productController, cardListViewController]
        self.tabBarController?.setViewControllers(tabControllers, animated: true)
        self.viewControllers = tabControllers
        

   }
    
    // MARK: - Delegate method
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        return true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item.tag == 1
        {
            self.navigationItem.title = "Shop"
        }
        else if item.tag == 2
        {
            self.navigationItem.title = "Cart"

        }
        
    }

    
    override func tabBar(_ tabBar: UITabBar, didBeginCustomizing items: [UITabBarItem]) {
        
    }
}
extension HomeBarViewController : HomeViewDelegate
{
    
}
