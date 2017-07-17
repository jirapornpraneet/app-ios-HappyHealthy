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
    var netUnitnetWeight:String? = "กรัม"
    var nullNutrition:Double? = 0.0
    var detailFood:String? = ""
    @IBOutlet var nameFoodTextField: UITextField!
    @IBOutlet var kcalFoodTextField: UITextField!
    @IBOutlet var amountFoodTextField: UITextField!
    @IBOutlet var unitFoodTextField: UITextField!
    @IBOutlet var netWeightFoodTextField: UITextField!
    @IBOutlet var proteinFoodTextField: UITextField!
    @IBOutlet var fatFoodTextField: UITextField!
    @IBOutlet var carbohydrateFoodTextField: UITextField!
    @IBOutlet var sugarFoodTextField: UITextField!
    @IBOutlet var sodiumFoodTextField: UITextField!
    @IBOutlet var detailFoodTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameFoodTextField.text = ""
        self.kcalFoodTextField.text = ""
        self.amountFoodTextField.text = ""
        self.unitFoodTextField.text = ""
        self.netWeightFoodTextField.text = ""
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
    
    @IBAction func inputNameFood(_ sender: Any) {
        let foodName = nameFoodTextField.text!
        let foodKcal = kcalFoodTextField.text!
        let foodAmount = amountFoodTextField.text!
        let foodUnit = unitFoodTextField.text!
        let foodNetWeight = netWeightFoodTextField.text!
        
        if  foodName == "" || foodKcal == "" || foodAmount == "" || foodUnit == "" || foodNetWeight == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }  
    }
    
    @IBAction func inputAmountFood(_ sender: Any) {
        let foodName = nameFoodTextField.text!
        let foodKcal = kcalFoodTextField.text!
        let foodAmount = amountFoodTextField.text!
        let foodUnit = unitFoodTextField.text!
        let foodNetWeight = netWeightFoodTextField.text!
        
        if  foodName == "" || foodKcal == "" || foodAmount == "" || foodUnit == "" || foodNetWeight == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    @IBAction func inputUnitFood(_ sender: Any) {
        let foodName = nameFoodTextField.text!
        let foodKcal = kcalFoodTextField.text!
        let foodAmount = amountFoodTextField.text!
        let foodUnit = unitFoodTextField.text!
        let foodNetWeight = netWeightFoodTextField.text!
        
        if  foodName == "" || foodKcal == "" || foodAmount == "" || foodUnit == "" || foodNetWeight == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    

    @IBAction func inputKcalFood(_ sender: Any) {
        let foodName = nameFoodTextField.text!
        let foodKcal = kcalFoodTextField.text!
        let foodAmount = amountFoodTextField.text!
        let foodUnit = unitFoodTextField.text!
        let foodNetWeight = netWeightFoodTextField.text!
        
        if  foodName == "" || foodKcal == "" || foodAmount == "" || foodUnit == "" || foodNetWeight == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    @IBAction func inputNetWeightFood(_ sender: Any) {
        let foodName = nameFoodTextField.text!
        let foodKcal = kcalFoodTextField.text!
        let foodAmount = amountFoodTextField.text!
        let foodUnit = unitFoodTextField.text!
        let foodNetWeight = netWeightFoodTextField.text!
        
        if  foodName == "" || foodKcal == "" || foodAmount == "" || foodUnit == "" || foodNetWeight == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let foodName = nameFoodTextField.text!
        let foodKcal = kcalFoodTextField.text!
        let foodAmount = amountFoodTextField.text!
        let foodUnit = unitFoodTextField.text!
        let foodNetWeight = netWeightFoodTextField.text!
        
        if  foodName == "" || foodKcal == "" || foodAmount == "" || foodUnit == "" || foodNetWeight == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }

    @IBAction func saveFood(_ sender: Any) {
        //ShowAlertController
        let alertShow = UIAlertController (title: "ยืนยันการบันทึกข้อมูลอาหาร", message:"คุณแน่ใจใช่ไหม" , preferredStyle: UIAlertControllerStyle.alert)
        alertShow.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler: { (action) in
            alertShow.dismiss(animated: true, completion: nil)
            self.insertDataFood()
            self.alertSaveData()
        }))
        
        alertShow.addAction(UIAlertAction(title: "ยกเลิก" , style: UIAlertActionStyle.default, handler: { (action) in
            alertShow.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alertShow,animated: true,completion: nil)

    }
    
    func alertSaveData(){
        //ShowAlertController
        let alertShowSave = UIAlertController (title: "บันทึกข้อมูลอาหาร", message:" คุณได้บันทึกข้อมูลอาหารสำเร็จ" , preferredStyle: UIAlertControllerStyle.alert)
        alertShowSave.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler:nil))
        self.present(alertShowSave, animated: true, completion: nil)
    }
    
    func insertDataFood() {
        let foodResource = FoodTable()
        foodResource.Food_Name = nameFoodTextField.text
        foodResource.Food_Calories = Double(kcalFoodTextField.text!)
        foodResource.Food_Amount = Int(amountFoodTextField.text!)
        foodResource.Food_Unit = unitFoodTextField.text
        foodResource.Food_Netweight = Double(netWeightFoodTextField.text!)
        foodResource.Food_NetUnit = netUnitnetWeight
        if proteinFoodTextField.text == "" {
            foodResource.Food_Protein = Double(nullNutrition!)
        }else{
             foodResource.Food_Protein = Double(proteinFoodTextField.text!)
        }
        
        if carbohydrateFoodTextField.text == "" {
            foodResource.Food_Carbohydrate = Double(nullNutrition!)
        }else{
            foodResource.Food_Carbohydrate = Double(carbohydrateFoodTextField.text!)
        }
       
        if fatFoodTextField.text == "" {
            foodResource.Food_Fat = Double(nullNutrition!)
        }else{
            foodResource.Food_Fat = Double(fatFoodTextField.text!)
        }
      
        if sugarFoodTextField.text == "" {
            foodResource.Food_Sugars = Double(nullNutrition!)
        }else{
            foodResource.Food_Sugars = Double(sugarFoodTextField.text!)
        }
      
        if sodiumFoodTextField.text == "" {
            foodResource.Food_Sodium = Double(nullNutrition!)
        }else{
            foodResource.Food_Sodium = Double(sodiumFoodTextField.text!)
        }
        
        if detailFoodTextField.text == ""{
            foodResource.Food_Detail = detailFood
        }else{
            foodResource.Food_Detail = detailFoodTextField.text
        }
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
        proteinFoodTextField.resignFirstResponder()
        fatFoodTextField.resignFirstResponder()
        carbohydrateFoodTextField.resignFirstResponder()
        sugarFoodTextField.resignFirstResponder()
        sodiumFoodTextField.resignFirstResponder()
        detailFoodTextField.resignFirstResponder()
        return true
    }

   

}
