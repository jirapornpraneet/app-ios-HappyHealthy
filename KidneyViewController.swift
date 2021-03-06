//
//  KidneyViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/23/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class KidneyViewController: UIViewController,UITextFieldDelegate {
    var getKidneyTable = [KidneyTable]()
    var insertDataKidney = [KidneyTable]()
    var dbHelper = DatabaseHelper()
    var saveDateKidney:String?
    var kidneyLevel: String?
    var costGFR:Int?
    var date:String?
    //setShowAlertController
    var dateKidney:String?
    var showGFR:Int?
    var levelGFR:String?

    @IBOutlet var inputCostGFRTextField: UITextField!
    @IBOutlet var dateInputKidneyPicker: UIDatePicker!
    @IBOutlet var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputCostGFRTextField.text = ""
        self.inputCostGFRTextField.delegate = self
         //insertDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy"
        let  setDate = dateFormatter.string(from: dateInputKidneyPicker.date)
        saveDateKidney = setDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inputCostGFR(_ sender: Any) {
        let  inputText:String = inputCostGFRTextField.text!
        if inputText == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let  inputText:String = inputCostGFRTextField.text!
        if inputText == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    
    
    @IBAction func selectDatePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy"
        let  setDate = dateFormatter.string(from: dateInputKidneyPicker.date)
        saveDateKidney = setDate
    }
    

    @IBAction func saveDataKidney(_ sender: Any) {
        if ((inputCostGFRTextField.text?.isEqual(""))!){
            alertInputDataNull()
        }else{
            costGFR = Int(inputCostGFRTextField.text!)!
            if costGFR! >= 90 {
                kidneyLevel  = "ปกติ"
            }else if costGFR! >= 60 && costGFR! < 90{
                kidneyLevel = "ลดลงเล็กน้อย"
            }else if costGFR! >= 30 && costGFR! < 60{
                kidneyLevel = "ลดลงปานกลาง"
            }else if costGFR! >= 15 && costGFR! < 30{
                kidneyLevel = "ลดลงมาก"
            }else{
                kidneyLevel = "ลดลงอันตราย"
            }
            
            dateKidney = saveDateKidney
            showGFR = Int(inputCostGFRTextField.text!)
            levelGFR = kidneyLevel
            
            //ShowAlertController
            let alertShow = UIAlertController (title:String(format:"คุณต้องการบันทึกข้อมูลใช่ไหม?"), message:String(format: "วันที่ : %@ \n ค่าการทำงานไต : %i\n  อยู่ในเกณฑ์ที่ : %@ ", dateKidney!, costGFR! ,levelGFR!) , preferredStyle: UIAlertControllerStyle.alert)
            alertShow.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler: { (action) in
                alertShow.dismiss(animated: true, completion: nil)
                self.insertTableKidney()
                self.performSegue(withIdentifier: "ShowKidney", sender: sender)
            }))
            
            alertShow.addAction(UIAlertAction(title: "ยกเลิก" , style: UIAlertActionStyle.default, handler: { (action) in
                alertShow.dismiss(animated: true, completion: nil)
            }))
            self.present(alertShow,animated: true,completion: nil)
        }
    }
    
    
    func alertInputDataNull(){
        let alertShowSave = UIAlertController (title: "กรุณาใส่ข้อมูลโรคไต", message:"คุณต้องใส่ค่าการทำงานไตก่อนทำการบันทึก" , preferredStyle: UIAlertControllerStyle.alert)
        alertShowSave.addAction(UIAlertAction(title: "ตกลง" , style: UIAlertActionStyle.default, handler:nil))
        self.present(alertShowSave, animated: true, completion: nil)
    }
    
    func insertTableKidney()  {
        costGFR = Int(inputCostGFRTextField.text!)!
        if costGFR! >= 90 {
            kidneyLevel  = "ปกติ"
        }else if costGFR! >= 60 && costGFR! < 90{
            kidneyLevel = "ลดลงเล็กน้อย"
        }else if costGFR! >= 30 && costGFR! < 60{
            kidneyLevel = "ลดลงปานกลาง"
        }else if costGFR! >= 15 && costGFR! < 30{
            kidneyLevel = "ลดลงมาก"
        }else{
            kidneyLevel = "ลดลงอันตราย"
        }
        
        let kidneyUserResource = KidneyTable()
        kidneyUserResource.K_DateTime = saveDateKidney
        kidneyUserResource.K_CostGFR = Int(inputCostGFRTextField.text!)
        kidneyUserResource.K_LevelCostGFR = kidneyLevel
        dbHelper.insertKidneyTable(dataRowKidneyTable: kidneyUserResource)
    }
    
    //Hide KeyBoard when user touches outside keyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputCostGFRTextField.resignFirstResponder()
        return true
    }

}
