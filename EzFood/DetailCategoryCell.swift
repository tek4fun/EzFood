//
//  DetailCategoryCell.swift
//  EzFood
//
//  Created by Tu on 5/9/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit

class DetailCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var img_Food: UIImageView!
    @IBOutlet weak var lbl_FoodName: UILabel!
    @IBOutlet weak var lbl_FoodStyle: UILabel!
    
    
    func configCell(category:CategoryFood){
        self.img_Food.image = category.categoryImg
        self.lbl_FoodName.text = category.categoryTitle
        self.lbl_FoodStyle.text = category.categoryStyle
    }
    override func awakeFromNib() {
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 1.0
        self.layer.borderColor = hexStringToUIColor(hex: "#ECEEEE").cgColor
        self.layer.cornerRadius = 3.0
        self.img_Food.layer.cornerRadius = 5.0
        self.img_Food.layer.masksToBounds = true
    }
}
