//
//  ProductListViewController.swift
//  DemoApplication
//
//  Created by Nitisha on 04/11/17.
//  Copyright © 2017 imriel. All rights reserved.
//

import UIKit
private let resusableIdentifier = "Cell"

class ProductListViewController: UIViewController {

    @IBOutlet weak var collection_Products: UICollectionView!
    
    var viewModel :ProductViewModelType
    var margin: CGFloat = 10.0, cellsPerRow: CGFloat = 4.0 , cellitemSize:CGFloat = 0.0

    
    init(_ model : ProductViewModelType)
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
        
              // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(removeFromCart(notification:)), name: notificationNameRemoveFromCart, object: nil)

        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CollectionViewCell", bundle: bundle)
        self.collection_Products?.register(nib, forCellWithReuseIdentifier: resusableIdentifier)
 
        self.collection_Products.delegate = self
        self.collection_Products.dataSource = self
  
       collection_Products.backgroundColor = UIColor.clear
       
        guard let flowLayout = collection_Products?.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin) // not required
        setCollectionViewCellsDisplay(for: (collection_Products?.bounds.size)!)
        
        viewModel.getProductDetails()
        
    }
    
    func setCollectionViewCellsDisplay(for size: CGSize) {
        guard let collectionView = collection_Products, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
      
        let itemWidth = (UIScreen.main.bounds.size.width/2)
         cellitemSize = CGFloat(itemWidth)
        flowLayout.itemSize = CGSize(width: (itemWidth - 20), height: (itemWidth+50))
        collectionView.collectionViewLayout.invalidateLayout()
         collection_Products.reloadData()
     }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func actionAddToCart(_ button : UIButton)
    {
        print(button.layer.name ?? "")
        let index = Int(button.layer.name!)
        if let addItem = self.viewModel.productArray?[index!]
        {
           self.viewModel.productArray?.remove(at: index!)
           let path  = IndexPath(row: index!, section: 0)
            self.collection_Products.performBatchUpdates({
                self.collection_Products.deleteItems(at: [path])
            }) { (finished) in
                self.collection_Products.reloadItems(at: self.collection_Products.indexPathsForVisibleItems)
            }
        NotificationCenter.default.post(name: notificationNameAddToCart, object:nil , userInfo: ["data": addItem])
        }
    }
    
    @objc func removeFromCart(notification: NSNotification)
    {
        if  let itemToAdd = notification.userInfo!["data"] as? Products
        {
            self.viewModel.productArray?.append(itemToAdd)
            DispatchQueue.main.async
                {
                    if self.collection_Products != nil
                    {
                        self.collection_Products.reloadData()
                    }
             }
        }
    }
    
}

extension ProductListViewController : UICollectionViewDelegate , UICollectionViewDataSource
{
    
      func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (self.viewModel.productArray?.count)!
    }
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resusableIdentifier, for: indexPath) as! CollectionViewCell
        // Configure the cell
        if let product = self.viewModel.productArray?[indexPath.row]
        {
        cell.setUpCell(product : product)
        }
        
        let btnAdd = cell.viewWithTag(11) as! UIButton
        btnAdd.addTarget(self, action: #selector(self.actionAddToCart(_:)), for: UIControlEvents.touchUpInside)
        btnAdd.layer.name = indexPath.row.description
         return cell
    }
    
  
    
}
extension ProductListViewController : ProductViewDelegate
{
    func resfreshList() {
        
        DispatchQueue.main.async
            {
            self.collection_Products.reloadData()
        }
    }
}
