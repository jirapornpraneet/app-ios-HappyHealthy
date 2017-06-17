//
//  showDetailFoodViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class showDetailFoodViewController: UIViewController {

    var getFoodModel: foodModel?
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
        
       nameFoodLabel.text = getFoodModel?.Food_Name
       kcalFoodLabel.text = String(format: "%f",(getFoodModel?.Food_Calories)!)
       unitFoodLabel.text = getFoodModel?.Food_Unit
       netWeightFoodLabel.text = String(format: "%f",(getFoodModel?.Food_Netweight)!)
       netUnitFoodLabel.text = getFoodModel?.Food_NetUnit
       proteinFoodLabel.text = String(format: "%f",(getFoodModel?.Food_Protein)!)
       fatFoodLabel.text = String(format: "%f",(getFoodModel?.Food_Fat)!)
       carbohydrateFoodLabel.text = String(format: "%f",(getFoodModel?.Food_Carbohydrate)!)
       sugarsFoodLabel.text = String(format: "%f",(getFoodModel?.Food_Sugars)!)
       sodiumFoodLabel.text = String(format: "%f",(getFoodModel?.Food_Sodium)!)
       detailFoodLabel.text = getFoodModel?.Food_Detail
     
        // Do any additional setup after loading the view.
    }
 


}
