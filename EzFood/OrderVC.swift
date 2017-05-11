//
//  OrderVC.swift
//  EzFood
//
//  Created by Tu on 5/10/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit
class OrderVC: UIViewController {
    
    @IBOutlet weak var lbl_customerName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lbl_Submit: UIButton!
    var iOrder = [Food]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        lbl_customerName.layer.borderWidth = 1.0
        lbl_customerName.layer.borderColor = hexStringToUIColor(hex: "#FF0033").cgColor
        lbl_Submit.layer.cornerRadius = lbl_Submit.frame.height/2
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationReceived(_:)), name: .myNoTifycationKey, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    func notificationReceived(_ notification: Notification) {
        if let userinfo = notification.userInfo as? [String: Any] {
            if let arrOrder = userinfo["arrayOrder"] as? [Food] {
                for item in arrOrder {
                    var isAddFood = false
                    for (index, _) in self.iOrder.enumerated() {
                        
                        if item.foodName == iOrder[index].foodName {
                            isAddFood = true
                            break
                        }
                    }
                    if isAddFood == false {
                        self.iOrder.append(item)
                    }
                }
                collectionView.reloadData()
            }
        }
    }
}
extension OrderVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 40
        let height = (collectionView.frame.height - 40)/3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.iOrder.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailOrderCell
        let food = self.iOrder[indexPath.row]
        cell.configCell(food: food)
        
        // action
        cell.onClickPlusAction = {
            food.quantity += 1
            let userinfo = ["arrayOrder":self.iOrder]
            
            collectionView.reloadData()
            NotificationCenter.default.post(name: .myNoTifycationKey, object: nil, userInfo: userinfo)
        }
        
        cell.onClickMinusAction = {
            
            if food.quantity == 1 {
                self.iOrder.remove(at: indexPath.row)
            }
            food.quantity -= 1
            
            let userinfo = ["arrayOrder":self.iOrder]
            collectionView.reloadData()
            NotificationCenter.default.post(name: .myNoTifycationKey, object: nil, userInfo: userinfo)
        }
        
        return cell
    }
    
}

