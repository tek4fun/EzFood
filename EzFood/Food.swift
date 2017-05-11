//
//  food.swift
//  EzFood
//
//  Created by Tu on 5/11/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit

class Food {
    var foodImg = UIImage(named: "grill1.jpg")
    var foodName = ""
    var foodInfo = ""
    var quantity = 0
    
    init(img:UIImage, name:String, info:String) {
        self.foodImg = img
        self.foodName = name
        self.foodInfo = info
    }
}
