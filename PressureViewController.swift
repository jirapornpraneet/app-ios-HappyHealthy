//
//  PressureViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/23/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class PressureViewController: UIViewController,UITextFieldDelegate {
    var getPressureTable = [PressureTable]()
    var insertDataPressure = [PressureTable]()
    var dbHelper = DatabaseHelper()
    var saveDatePressure:String = ""
    var pressureLevel:String = ""
    var heartLevel: String = ""
    var costPressureTop:Int?
    var costPressureDown:Int?
    var costTop:Int?
    var costDown:Int?
    var costHeart:Int?
    var pressureLevelName: [String] = ["พบแพทย์ทันที ระดับอันตราย","พบแพทย์ทันที ระดับสูงมาก","พบแพทย์ทันที ระดับสูง","พบแพทย์ทันที ระดับค่อนข้างสูง","ระดับปกติ","ระดับเหมาะสม"]
    //setShowAlertController
    var datePressure:String?
    var showCostTop:Int?
    var showCostDown:Int?
    var showCostHeart:Int?
    var levelPressure:String?
    var levelHeart:String?

    @IBOutlet var costPressureDownTextField: UITextField!
    @IBOutlet var costHeartTextField: UITextField!
    @IBOutlet var costPressureTopTextField: UITextField!
    @IBOutlet var dateInputPressurePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.costHeartTextField.text = ""
        self.costPressureDownTextField.text = ""
        self.costPressureTopTextField.text = ""
        self.costHeartTextField.delegate = self
        self.costPressureDownTextField.delegate = self
        self.costPressureTopTextField.delegate = self
        //insertDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy"
        let  setDate = dateFormatter.string(from: dateInputPressurePicker.date)
        saveDatePressure = setDate

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectDatePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy"
        let  setDate = dateFormatter.string(from: dateInputPressurePicker.date)
        saveDatePressure = setDate
    }
    
    func LevelPressure() -> String {
        costPressureTop = Int(costPressureTopTextField.text!)
        costPressureDown = Int(costPressureDownTextField.text!)
        
        if costPressureTop! >= 180 {
            costTop  = 0
        }else if costPressureTop! >= 160 && costPressureTop! < 180 {
            costTop  = 1
        }else if costPressureTop! >= 140 && costPressureTop! < 160 {
            costTop  = 2
        }else if costPressureTop! >= 130 && costPressureTop! < 140 {
            costTop  = 3
        }else if costPressureTop! >= 120 && costPressureTop! < 130 {
            costTop  = 4
        }else if costPressureTop! >= 90 && costPressureTop! < 120 {
            costTop  = 5
        }else{
            costTop  = 0
        }
        
        if costPressureDown! >= 110 {
            costDown  = 0
        }else if costPressureDown! >= 100 && costPressureDown! < 110 {
            costDown  = 1
        }else if costPressureDown! >= 90 && costPressureDown! < 100 {
            costDown  = 2
        }else if costPressureDown! >= 85 && costPressureDown! < 90 {
            costDown  = 3
        }else if costPressureDown! >= 80 && costPressureDown! < 85 {
            costDown  = 4
        }else if costPressureDown! >= 60 && costPressureDown! < 80 {
            costDown  = 5
        }else{
            costDown  = 0
        }
        
        
        if costTop! < costDown! {
            pressureLevel = pressureLevelName[costTop!]
        }else{
            pressureLevel = pressureLevelName[costDown!]
        }
        return pressureLevel

    }
    
    func LevelHeart() -> String {
        costHeart = Int(costHeartTextField.text!)
        
        if costHeart! >= 101 {
            heartLevel  = "ผิดปกติ"
        }else if costHeart! >= 85 && costHeart!  < 101{
            heartLevel  = "สูงเกินไป"
        }else if costHeart! >= 70 && costHeart!  < 85 {
            heartLevel  = "พอใช้"
        }else if costHeart! >= 60 && costHeart!  < 70 {
            heartLevel  = "ดี"
        }else if costHeart! >= 41 && costHeart!  < 60 {
            heartLevel  = "ดีมาก"
        }else{
            heartLevel  = "ผิดปกติ"
        }
        return heartLevel
     
    }

    @IBAction func saveDataPressure(_ sender: Any) {
        if ((costPressureTopTextField.text?.isEqual(""))! || (costPressureDownTextField.text?.isEqual(""))! || (costHeartTextField.text?.isEqual(""))!) {
            alertInputDataNull()
        }else{
        heartLevel = LevelHeart()
        pressureLevel = LevelPressure()
        
        datePressure = saveDatePressure
        showCostTop = Int(costPressureTopTextField.text!)
        showCostDown = Int(costPressureDownTextField.text!)
        showCostHeart = Int(costHeartTextField.text!)
        levelPressure = pressureLevel
        levelHeart = heartLevel

        let alertShow = UIAlertController (title:String(format:"คุณต้องการบันทึกข้อมูลใช่ไหม?"), message:String(format: "วันที่ : %@ \n ค่าความดันโลหิตตัวบน : %i \n  ค่าความดันโลหิตตัวล่าง : %i \n อยู่ในเกณฑ์ที่ : %@ \n อัตราการเต้นหัวใจ : %i \n อยู่ในเกณฑ์ที่ : %@ ", datePressure!, showCostTop! ,showCostDown!, levelPressure!, showCostHeart! , levelHeart!) , preferredStyle: UIAlertControllerStyle.alert)
        alertShow.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler: { (action) in
            alertShow.dismiss(animated: true, completion: nil)
            self.insertTablePressure()
            self.performSegue(withIdentifier: "ShowPressure", sender: sender)
        }))
        
        alertShow.addAction(UIAlertAction(title: "ยกเลิก" , style: UIAlertActionStyle.default, handler: { (action) in
            alertShow.dismiss(animated: true, completion: nil)
        }))
        self.present(alertShow,animated: true,completion: nil)
        }
    }
    
    func alertInputDataNull(){
        let alertShowSave = UIAlertController (title: "กรุณาใส่ข้อมูลโรคความดัน", message:"คุณต้องใส่ค่าความดันโลหิตและค่าการเต้นหัวใจก่อนทำการบันทึก" , preferredStyle: UIAlertControllerStyle.alert)
        alertShowSave.addAction(UIAlertAction(title: "ตกลง" , style: UIAlertActionStyle.default, handler:nil))
        self.present(alertShowSave, animated: true, completion: nil)
    }
    
    func insertTablePressure()  {
        heartLevel = LevelHeart()
        pressureLevel = LevelPressure()
        let pressureUserResource = PressureTable()
        pressureUserResource.P_DateTime = saveDatePressure
        pressureUserResource.P_CostPressureTop = Int(costPressureTopTextField.text!)
        pressureUserResource.P_CostPressureDown = Int(costPressureDownTextField.text!)
        pressureUserResource.P_HeartRate = Int(costHeartTextField.text!)
        pressureUserResource.P_Pressure_Level = pressureLevel
        pressureUserResource.P_HeartRate_Level = heartLevel
        dbHelper.insertPressureTable(dataRowPressureTable: pressureUserResource)
    }
    //Hide KeyBoard when user touches outside keyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            costHeartTextField.resignFirstResponder()
            costPressureDownTextField.resignFirstResponder()
            costPressureTopTextField.resignFirstResponder()
            costHeartTextField.resignFirstResponder()
            costPressureDownTextField.resignFirstResponder()
            costPressureTopTextField.resignFirstResponder()
        return true
    }

}
