//
//  CategoryVC.swift
//  EzFood
//
//  Created by Tu on 5/9/17.
//  Copyright © 2017 Moza. All rights reserved.
//

import UIKit
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class CategoryVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categoryFoods = [CategoryFood]()
    var category = CategoryFood()
    var foods = [Food]()
    var selectedFoodInfo = Array<String>()
    var foodName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //init model data
         // grill
        for i in 1...6 {
            let food = Food(img: UIImage(named:"grill" + String(i) + ".jpg")!, name: "Grill " + String(i), info: "Grill, Sauces, Holiday Foods.")
            foods.append(food)
            }
        category = CategoryFood(categoryImg: UIImage(named:"grill1.jpg")!, categoryTitle: "Grill", categoryStyle: "Wayfarer Style", food: foods)
        foods.removeAll()
        categoryFoods.append(category)
         // seafood
        for i in 1...6 {
            let food = Food(img: UIImage(named:"seafood" + String(i) + ".jpg")!, name: "SeaFood " + String(i), info: "Seafood, Sauces, Holiday Foods.")
            foods.append(food)
        }
        category = CategoryFood(categoryImg: UIImage(named:"seafood1.jpg")!, categoryTitle: "Seafood", categoryStyle: "Aviator Style", food: foods)
        foods.removeAll()
        categoryFoods.append(category)
         // beverage
        // seafood
        for i in 1...6 {
            let food = Food(img: UIImage(named:"beverage" + String(i) + ".jpg")!, name: "Beverage " + String(i), info: "Beverage, Holiday Drink.")
            foods.append(food)
        }
        category = CategoryFood(categoryImg: UIImage(named:"beverage1.jpg")!, categoryTitle: "Beverage", categoryStyle: "Mixy Style", food: foods)
        foods.removeAll()
        categoryFoods.append(category)
        // rice
        let food = Food(img: UIImage(named:"rice1.png")!, name: "Rice", info: "Rice, EveryDay Foods.")
        foods.append(food)
        category = CategoryFood(categoryImg: UIImage(named:"rice1.png")!, categoryTitle: "Rice", categoryStyle: "Asian Style", food: foods)
        foods.removeAll()
        categoryFoods.append(category)

        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension CategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 40)/2
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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryFoods.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailCategoryCell

        let category = categoryFoods[indexPath.row]
        
        cell.configCell(category: category)
                
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        foods = categoryFoods[indexPath.row].food
        foodName = categoryFoods[indexPath.row].categoryTitle

        performSegue(withIdentifier: "CategorySegueListorder", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategorySegueListorder"{
            let destinationNavigationController = segue.destination as! ListOrderVC
            destinationNavigationController.foodName = foodName
            destinationNavigationController.foods = foods
        }
        
    }
}
