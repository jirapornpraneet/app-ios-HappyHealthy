//
//  showDetailFoodViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ShowDetailFoodViewController: UIViewController,UITextFieldDelegate {
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
    @IBOutlet var amountFoodTextField: UITextField!
    var totalAmount:Double?
    override func viewDidLoad() {
      super.viewDidLoad()
        //delegate
        self.amountFoodTextField.delegate = self
        self.amountFoodTextField.text = ""
        totalAmount = 1.0
        nameFoodLabel.text = getFoodTable?.Food_Name
        kcalFoodLabel.text = String(format: "%.02f",(getFoodTable?.Food_Calories)!)
        unitFoodLabel.text = getFoodTable?.Food_Unit
        netWeightFoodLabel.text = String(format: "%.02f",(getFoodTable?.Food_Netweight)!)
        netUnitFoodLabel.text = getFoodTable?.Food_NetUnit
        proteinFoodLabel.text = String(format: "%.02f",(getFoodTable?.Food_Protein)!)
        fatFoodLabel.text = String(format: "%.02f",(getFoodTable?.Food_Fat)!)
        carbohydrateFoodLabel.text = String(format: "%.02f",(getFoodTable?.Food_Carbohydrate)!)
        sugarsFoodLabel.text = String(format: "%.02f",(getFoodTable?.Food_Sugars)!)
        sodiumFoodLabel.text = String(format: "%.02f",(getFoodTable?.Food_Sodium)!)
        detailFoodLabel.text = getFoodTable?.Food_Detail
        setAddAmountDetail(total: totalAmount!)
    }
    
    //TextField ที่ใส่ข้อมูลลงไปจะมีการเปลี่ยนแปลง
    @IBAction func textDidChanged(_ sender: Any) {
        if amountFoodTextField.text == "" {
            return
        }
        totalAmount = 1.0
        totalAmount = Double(amountFoodTextField.text!)
        setAddAmountDetail(total: totalAmount!)
    }
    
    func setAddAmountDetail(total:Double){
        nameFoodLabel.text = getFoodTable?.Food_Name
        kcalFoodLabel.text = (String(format: "%.02f",(getFoodTable?.Food_Calories)! * total))
        unitFoodLabel.text = getFoodTable?.Food_Unit
        netWeightFoodLabel.text = (String(format: "%.02f",(getFoodTable?.Food_Netweight)! * total))
        netUnitFoodLabel.text = getFoodTable?.Food_NetUnit
        proteinFoodLabel.text = (String(format: "%.02f",(getFoodTable?.Food_Protein)! * total))
        fatFoodLabel.text = (String(format: "%.02f",(getFoodTable?.Food_Fat)! * total))
        carbohydrateFoodLabel.text = (String(format: "%.02f",(getFoodTable?.Food_Carbohydrate)! * total))
        sugarsFoodLabel.text = (String(format: "%.02f",(getFoodTable?.Food_Sugars)! * total))
        sodiumFoodLabel.text = (String(format: "%.02f",(getFoodTable?.Food_Sodium)! * total))
        detailFoodLabel.text = getFoodTable?.Food_Detail
    }
    //Hide KeyBoard when user touches outside keyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        amountFoodTextField.resignFirstResponder()
        return true
    }
    
}
