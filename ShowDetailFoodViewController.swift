//
//  showDetailFoodViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ShowDetailFoodViewController: UIViewController {

    var getFoodTable: FoodTable?
    var dbHelper = DatabaseHelper()
    
    @IBOutlet var nameFoodLabel: UILabel!
    @IBOutlet var kcalFoodLabel: UILabel!
    @IBOutlet var unitFoodLabel: UILabel!
    @IBOutlet var netWeightFoodLabel: UILabel!
    @IBOutlet var netUnitFoodLabel: UILabel!
    @IBOutlet var proteinFoodLabel: UILabel!
    @IBOutlet var fatFoodLabel: UILabel!
    @IBOutlet var carbohydrateFoodLabel: UILabel!
    @IBOutlet var sugarsFoodLabel: UILabel!
    @IBOutlet var sodiumFoodLabel: UILabel!
    @IBOutlet var detailFoodLabel: UILabel!
    
    override func viewDidLoad() {
      super.viewDidLoad()
       nameFoodLabel.text = getFoodTable?.Food_Name
       kcalFoodLabel.text = String(format: "%f",(getFoodTable?.Food_Calories)!)
       unitFoodLabel.text = getFoodTable?.Food_Unit
       netWeightFoodLabel.text = String(format: "%f",(getFoodTable?.Food_Netweight)!)
       netUnitFoodLabel.text = getFoodTable?.Food_NetUnit
       proteinFoodLabel.text = String(format: "%f",(getFoodTable?.Food_Protein)!)
       fatFoodLabel.text = String(format: "%f",(getFoodTable?.Food_Fat)!)
       carbohydrateFoodLabel.text = String(format: "%f",(getFoodTable?.Food_Carbohydrate)!)
       sugarsFoodLabel.text = String(format: "%f",(getFoodTable?.Food_Sugars)!)
       sodiumFoodLabel.text = String(format: "%f",(getFoodTable?.Food_Sodium)!)
       detailFoodLabel.text = getFoodTable?.Food_Detail
    }
}
