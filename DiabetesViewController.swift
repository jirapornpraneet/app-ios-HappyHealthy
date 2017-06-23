//
//  DiabetesViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/22/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class DiabetesViewController: UIViewController,UITextFieldDelegate {
    var getDiabetesTable = [DiabetesTable]()
    var insertDataDiabetes = [DiabetesTable]()
    var dbHelper = DatabaseHelper()
    var diabetesStatusList: [String] = ["ก่อนอาหาร", "หลังอาหาร"]
    var diabetesPeopleList: [String] = ["ผู้เป็นเบาหวาน", "คนปกติ"]
    var diabetesStatusName: String = ""
    var diabetesPeopleName: String = ""
    var saveDateDiabetes:String = ""
    var diabetesLevel: String = ""
    var costSugar:Int?
    
    @IBOutlet var peopleDiabetesSegmented: UISegmentedControl!
    
    @IBOutlet var inputCostSugarTextField: UITextField!
    @IBOutlet var statusDiabetesSegmented: UISegmentedControl!
    @IBOutlet var dateInputDiabetesPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputCostSugarTextField.text = ""
        self.inputCostSugarTextField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Hide KeyBoard when user touches outside keyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputCostSugarTextField.resignFirstResponder()
        return true
    }

    func NormalBefore() -> String{
        costSugar = Int(inputCostSugarTextField.text!)!
        if costSugar! >= 126 {
             diabetesLevel  = "วินิจฉัยเป็นเบาหวาน"
        }else if costSugar! >= 70 && costSugar! < 126{
             diabetesLevel = "ปกติ"
        }else{
             diabetesLevel = "น้ำตาลในเลือดต่ำกว่าปกติ"
        }
        return  diabetesLevel
    }
    
    func NormalAfter()-> String{
        costSugar = Int(inputCostSugarTextField.text!)!
        if costSugar! >= 200 {
            diabetesLevel  = "วินิจฉัยเป็นเบาหวาน"
        }else if costSugar! >= 70 && costSugar! < 200{
            diabetesLevel = "ปกติ"
        }else{
            diabetesLevel = "น้ำตาลในเลือดต่ำกว่าปกติ"
        }
        return diabetesLevel
    }

    func DiabetesBefore()->String{
        costSugar = Int(inputCostSugarTextField.text!)!
        if costSugar! >= 130 {
            diabetesLevel  = "พบแพทย์ทันที น้ำตาลในเลือดสูงมาก (อันตราย)"
        }else if costSugar! >= 100 && costSugar! < 130{
            diabetesLevel = "รีบปรึกษาแพทย์ น้ำตาลในเลือดสูง"
        }else if costSugar! >= 90 && costSugar! < 100{
            diabetesLevel = "ปรึกษาแพทย์ น้ำตาลเในเลือดค่อนข้างสูง"
        }else if costSugar! >= 70 && costSugar! < 90{
            diabetesLevel = "น้ำตาลในเลือดปกติ"
        }else{
            diabetesLevel = "พบแพทย์ทันที น้ำตาลในเลือดต่ำ อันตราย"
        }
        return diabetesLevel
    }

    func DiabetesAfter()-> String{
        costSugar = Int(inputCostSugarTextField.text!)!
        if costSugar! >= 180 {
            diabetesLevel  = "พบแพทย์ทันที น้ำตาลในเลือดสูงมาก (อันตราย)"
        }else if costSugar! >= 150 && costSugar! < 180{
            diabetesLevel = "รีบปรึกษาแพทย์ น้ำตาลในเลือดสูง"
        }else if costSugar! >= 110 && costSugar! < 150{
            diabetesLevel = "ปรึกษาแพทย์ น้ำตาลเในเลือดค่อนข้างสูง"
        }else if costSugar! >= 70 && costSugar! < 110{
            diabetesLevel = "น้ำตาลในเลือดปกติ"
        }else{
            diabetesLevel = "พบแพทย์ทันที น้ำตาลในเลือดต่ำ อันตราย"
        }
        return diabetesLevel
        
    }

    @IBAction func selectDatePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy HH:mm"
        let  setDate = dateFormatter.string(from: dateInputDiabetesPicker.date)
        saveDateDiabetes = setDate
    }
    
    @IBAction func selectStatusDiabetesSegmented(_ sender: Any) {
        switch statusDiabetesSegmented.selectedSegmentIndex {
        case 0:
            diabetesStatusName = "ก่อนอาหาร"
        case 1:
            diabetesStatusName = "หลังอาหาร"
        default:
            break;
        }
        
        let statusDiabetesSelect: String = self.diabetesStatusList[self.statusDiabetesSegmented.selectedSegmentIndex]
        diabetesStatusName = statusDiabetesSelect

    }

    @IBAction func selectPeopleDiabetesSegmented(_ sender: Any) {
        switch statusDiabetesSegmented.selectedSegmentIndex {
        case 0:
            diabetesPeopleName = "ผู้เป็นเบาหวาน"
        case 1:
            diabetesPeopleName = "คนปกติ"
        default:
            break;
        }
        
        let peopleDiabetesSelect: String = self.diabetesPeopleList[self.peopleDiabetesSegmented.selectedSegmentIndex]
        diabetesPeopleName = peopleDiabetesSelect
    }
    
    @IBAction func saveDataDiabetes(_ sender: Any) {
        
        if diabetesPeopleName == "คนปกติ" {
            if diabetesStatusName == "ก่อนอาหาร" {
                diabetesLevel = NormalBefore()
            }else{
                diabetesLevel = NormalAfter()
            }
        }else if diabetesPeopleName == "ผู้เป็นเบาหวาน" {
            if diabetesStatusName == "ก่อนอาหาร"{
                diabetesLevel = DiabetesBefore()
            }else{
                diabetesLevel = DiabetesAfter()
            }
        }
        let diabetesUserResource = DiabetesTable()
        diabetesUserResource.D_DateTime = saveDateDiabetes
        diabetesUserResource.D_CostSugar = Int(inputCostSugarTextField.text!)
        diabetesUserResource.D_Status = diabetesStatusName
        diabetesUserResource.D_People = diabetesPeopleName
        diabetesUserResource.D_Level = diabetesLevel
        dbHelper.insertDiabetesTable(dataRowDiabetesTable: diabetesUserResource)
    }

    
}


