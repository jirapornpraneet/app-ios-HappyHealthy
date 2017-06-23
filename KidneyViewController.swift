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
    var saveDateKidney:String = ""
    var kidneyLevel: String = ""
    var costGFR:Int?

    @IBOutlet var inputCostGFRTextField: UITextField!
    @IBOutlet var dateInputKidneyPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputCostGFRTextField.text = ""
        self.inputCostGFRTextField.delegate = self
         //insertDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy HH:mm"
        let  setDate = dateFormatter.string(from: dateInputKidneyPicker.date)
        saveDateKidney = setDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectDatePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "dd-MM-yyyy HH:mm"
        let  setDate = dateFormatter.string(from: dateInputKidneyPicker.date)
        saveDateKidney = setDate
    }

    @IBAction func saveDataKidney(_ sender: Any) {
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
