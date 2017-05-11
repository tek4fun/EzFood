//
//  Food.swift
//  EzFood
//
//  Created by Tu on 5/9/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit

class CategoryFood{
    
//    var grill:Array<Any>
//    var seafood:Array<Any>
//    var beverage:Array<Any>
//    var rice:Array<Any>
//    var foody = NSMutableDictionary()
    
    
    var categoryImg = UIImage(named: "grill1.jpg")
    var categoryTitle = ""
    var categoryStyle = ""
    var food = [Food]()
    init () {}
    init(categoryImg:UIImage, categoryTitle:String, categoryStyle:String, food:[Food]) {
        self.categoryImg = categoryImg
        self.categoryTitle = categoryTitle
        self.categoryStyle = categoryStyle
        self.food = food
    }
    
    
//    override init() {
//        grill = ["Wayfarer Style","Grill, Sauces, Holiday Foods.","grill1.jpg","grill2.jpg","grill3.jpg","grill4.jpg","grill5.jpg","grill6.jpg","grill7.jpg"]
//        seafood = ["Aviator Style","Seafood, Sauces, Holiday Foods.","seafood1.jpg","seafood2.jpg","seafood3.jpg","seafood4.jpg","seafood5.jpg","seafood6.jpg","seafood7.jpg"]
//        beverage = ["Mixy Style","Holiday Drink.","beverage1.jpg","beverage2.jpg","beverage3.jpg","beverage4.jpg","beverage5.jpg","beverage6.jpg","beverage7.jpg"]
//        rice = ["Asian Style","rice, Everyday Foods.","rice1.png"]
//        
//        foody = ["Grill":grill,"Seafood":seafood,"Beverage":beverage,"Rice":rice]
//    }
    
}
