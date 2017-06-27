//
//  AddFoodViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/27/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController,UITextFieldDelegate {
    var insertFoodTable = [FoodTable]()
    var dbHelper = DatabaseHelper()
    @IBOutlet var nameFoodTextField: UITextField!
    @IBOutlet var kcalFoodTextField: UITextField!
    @IBOutlet var amountFoodTextField: UITextField!
    @IBOutlet var unitFoodTextField: UITextField!
    @IBOutlet var netWeightFoodTextField: UITextField!
    @IBOutlet var netUnitFoodTextField: UITextField!
    @IBOutlet var proteinFoodTextField: UITextField!
    @IBOutlet var fatFoodTextField: UITextField!
    @IBOutlet var carbohydrateFoodTextField: UITextField!
    @IBOutlet var sugarFoodTextField: UITextField!
    @IBOutlet var sodiumFoodTextField: UITextField!
    @IBOutlet var detailFoodTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameFoodTextField.text = ""
        self.kcalFoodTextField.text = ""
        self.amountFoodTextField.text = ""
        self.unitFoodTextField.text = ""
        self.netWeightFoodTextField.text = ""
        self.netUnitFoodTextField.text = ""
        self.proteinFoodTextField.text = ""
        self.fatFoodTextField.text = ""
        self.carbohydrateFoodTextField.text = ""
        self.sugarFoodTextField.text = ""
        self.sodiumFoodTextField.text = ""
        self.detailFoodTextField.text = ""
        //set the delegate
        self.nameFoodTextField.delegate = self
        self.kcalFoodTextField.delegate = self
        self.amountFoodTextField.delegate = self
        self.unitFoodTextField.delegate = self
        self.netWeightFoodTextField.delegate = self
        self.netUnitFoodTextField.delegate = self
        self.proteinFoodTextField.delegate = self
        self.fatFoodTextField.delegate = self
        self.carbohydrateFoodTextField.delegate = self
        self.sugarFoodTextField.delegate = self
        self.sodiumFoodTextField.delegate = self
        self.detailFoodTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveFood(_ sender: Any) {
        let foodResource = FoodTable()
        foodResource.Food_Name = nameFoodTextField.text
        foodResource.Food_Calories = Double(kcalFoodTextField.text!)
        foodResource.Food_Amount = Int(amountFoodTextField.text!)
        foodResource.Food_Unit = unitFoodTextField.text
        foodResource.Food_Netweight = Double(netWeightFoodTextField.text!)
        foodResource.Food_NetUnit = netUnitFoodTextField.text!
        foodResource.Food_Protein = Double(proteinFoodTextField.text!)
        foodResource.Food_Carbohydrate = Double(carbohydrateFoodTextField.text!)
        foodResource.Food_Fat = Double(fatFoodTextField.text!)
        foodResource.Food_Sugars = Double(sugarFoodTextField.text!)
        foodResource.Food_Sodium = Double(sodiumFoodTextField.text!)
        foodResource.Food_Detail = detailFoodTextField.text
        dbHelper.insertFoodTable(dataRowFoodTable: foodResource)
    }
    
    //Hide KeyBoard when user touches outside keyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameFoodTextField.resignFirstResponder()
        kcalFoodTextField.resignFirstResponder()
        amountFoodTextField.resignFirstResponder()
        unitFoodTextField.resignFirstResponder()
        netWeightFoodTextField.resignFirstResponder()
        netUnitFoodTextField.resignFirstResponder()
        proteinFoodTextField.resignFirstResponder()
        fatFoodTextField.resignFirstResponder()
        carbohydrateFoodTextField.resignFirstResponder()
        sugarFoodTextField.resignFirstResponder()
        sodiumFoodTextField.resignFirstResponder()
        detailFoodTextField.resignFirstResponder()
        return true
    }

   

}
