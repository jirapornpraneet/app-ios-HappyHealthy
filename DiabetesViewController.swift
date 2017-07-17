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
    var getUserTable = [UserTable]()
    var getCheckUserTable = [UserTable]()
    var dbHelper = DatabaseHelper()
    var diabetesStatusList: [String] = ["ก่อนอาหาร", "หลังอาหาร"]
    var diabetesStatusName: String = ""
    var diabetesPeopleName: String = ""
    var saveDateDiabetes:String = ""
    var diabetesLevel: String = ""
    var costSugar:Int?
    //setShowAlertController
    var dateDiabetes:String?
    var showCostSugar:Int?
    var levelDiabetes:String?
    var statusDiabetes:String?
    var peopleDiabetes:String?
    
    @IBOutlet var peopleDiabetesSegmented: UISegmentedControl!
    @IBOutlet var inputCostSugarTextField: UITextField!
    @IBOutlet var statusDiabetesSegmented: UISegmentedControl!
    @IBOutlet var dateInputDiabetesPicker: UIDatePicker!
    @IBOutlet var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputCostSugarTextField.text = ""
        self.inputCostSugarTextField.delegate = self
         //insertDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy"
        let  setDate = dateFormatter.string(from: dateInputDiabetesPicker.date)
        saveDateDiabetes = setDate
        //DiabetesStatus
        let statusDiabetesSelect: String = self.diabetesStatusList[self.statusDiabetesSegmented.selectedSegmentIndex]
        diabetesStatusName = statusDiabetesSelect
        //DiabetesPeople
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
            diabetesLevel = "ปรึกษาแพทย์ น้ำตาลในเลือดค่อนข้างสูง"
        }else if costSugar! >= 70 && costSugar! < 110{
            diabetesLevel = "น้ำตาลในเลือดปกติ"
        }else{
            diabetesLevel = "พบแพทย์ทันที น้ำตาลในเลือดต่ำ อันตราย"
        }
        return diabetesLevel
    }

    @IBAction func selectDatePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy"
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

    @IBAction func saveDataDiabetes(_ sender: Any) {
        getUserTable = dbHelper.getUser()
        if getUserTable.count == 0 {
            return
        }
        
        diabetesPeopleName = getUserTable[0].User_Diabetes!
        
        if ((inputCostSugarTextField.text?.isEqual(""))!){
            alertInputDataNull()
        }else{
            if diabetesPeopleName == "คนปกติ" {
                if diabetesStatusName == "ก่อนอาหาร" {
                    diabetesLevel = NormalBefore()
                }else{
                    diabetesLevel = NormalAfter()
                }
            }else if diabetesPeopleName == "เบาหวาน" {
                if diabetesStatusName == "ก่อนอาหาร"{
                    diabetesLevel = DiabetesBefore()
                }else{
                    diabetesLevel = DiabetesAfter()
                }
            }
            dateDiabetes = saveDateDiabetes
            showCostSugar = Int(inputCostSugarTextField.text!)
            levelDiabetes = diabetesLevel
            statusDiabetes = diabetesStatusName
            peopleDiabetes = diabetesPeopleName
            //ShowAlertController
            let alertShow = UIAlertController (title:String(format:"คุณต้องการบันทึกข้อมูลใช่ไหม?"), message:String(format: "วันที่ : %@ \n ค่าน้ำตาลในเลือด%@ : %i \n อยู่ในเกณฑ์ที่ : %@ \n  สถานะที่ : %@ ", dateDiabetes!,statusDiabetes!, showCostSugar! ,levelDiabetes!,peopleDiabetes!) , preferredStyle: UIAlertControllerStyle.alert)
            alertShow.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler: { (action) in
                alertShow.dismiss(animated: true, completion: nil)
                self.insertTableDiabetes()
                self.performSegue(withIdentifier: "ShowDiabetes", sender: sender)
                
            }))
            
            alertShow.addAction(UIAlertAction(title: "ยกเลิก" , style: UIAlertActionStyle.default, handler: { (action) in
                alertShow.dismiss(animated: true, completion: nil)
                
            }))
            self.present(alertShow,animated: true,completion: nil)
            
        }
    }
    
    @IBAction func inputCostSugar(_ sender: Any) {
        let  inputText:String = inputCostSugarTextField.text!
        if inputText == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        let  inputText:String = inputCostSugarTextField.text!
         if inputText == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    func alertInputDataNull(){
        let alertShowSave = UIAlertController (title: "กรุณาใส่ข้อมูลโรคเบาหวาน", message:"คุณต้องใส่ค่าน้ำตาลในเลือดก่อนทำการบันทึก" , preferredStyle: UIAlertControllerStyle.alert)
        alertShowSave.addAction(UIAlertAction(title: "ตกลง" , style: UIAlertActionStyle.default, handler:nil))
        self.present(alertShowSave, animated: true, completion: nil)
    }
    
    func insertTableDiabetes() {
        if diabetesPeopleName == "คนปกติ" {
            if diabetesStatusName == "ก่อนอาหาร" {
                diabetesLevel = NormalBefore()
            }else{
                diabetesLevel = NormalAfter()
            }
        }else if diabetesPeopleName == "เบาหวาน" {
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
        diabetesUserResource.D_Level = diabetesLevel
        dbHelper.insertDiabetesTable(dataRowDiabetesTable: diabetesUserResource)
    }
}


