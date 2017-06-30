//
//  ReportHealthViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/27/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ReportHealthViewController: UIViewController{
     var getCheckRowDiabetes = [DiabetesTable]()
     var getReportDiabetes = [DiabetesTable]()
     var getReportKidney = [KidneyTable]()
     var getReportPressure = [PressureTable]()
     var dbHelper = DatabaseHelper()
     var saveDate:String = ""
     //var insertDate:DateComponents
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var costSugarLabel: UILabel!
    @IBOutlet var dateDiabetesLabel: UILabel!
    @IBOutlet var level: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var people: UILabel!
    @IBOutlet var costGFRLabel: UILabel!
    @IBOutlet var dateKidneyLabel: UILabel!
    @IBOutlet weak var datePressureLabel: UILabel!
    @IBOutlet weak var costPressureTopLabel: UILabel!
    @IBOutlet weak var costPressureDownLabel: UILabel!
    @IBOutlet weak var costHeartLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "dd-MM-yyyy"
        let  setDate = dateFormatterShow.string(from: datePicker.date)
        saveDate = setDate
        loadAllData(dateChoose: saveDate)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectDatePicker(_ sender: Any) {
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "dd-MM-yyyy"
        let  setDate = dateFormatterShow.string(from: datePicker.date)
        saveDate = setDate
        loadAllData(dateChoose: saveDate)
  
    }

    func loadAllData(dateChoose:String) {
         //เบาหวาน
        getCheckRowDiabetes = dbHelper.getCheckRowDiabetes(datedisease: dateChoose)
        if getCheckRowDiabetes.count == 0 {
             return
        }
        getReportDiabetes = dbHelper.getReportDiabetes(datedisease: dateChoose)
        
//        getReportDiabetes = dbHelper.getReportDiabetes(datedisease: dateChoose)
//         getReportPressure = dbHelper.getReportPressure(datedisease: dateChoose)
//         getReportKidney = dbHelper.getReportKidney(datedisease: dateChoose)
//        if getReportDiabetes.count == 0 {
//            return
//        }
//        
//        if getReportPressure.count == nil {
//            return
//        }
//        if getReportKidney.count == 0 {
//            return
//        }
//
        costSugarLabel.text = String(format: "%i" ,(getReportDiabetes[0].D_CostSugar)!)
        level.text = getReportDiabetes[0].D_Level
        status.text = getReportDiabetes[0].D_Status
        people.text = getReportDiabetes[0].D_People
        dateDiabetesLabel.text = getReportDiabetes[0].D_DateTime
//        //ไต
//        getReportKidney = dbHelper.getReportKidney(datedisease: dateChoose)
//        costGFRLabel.text = String(format: "%i" ,(getReportKidney[0].K_CostGFR)!)
//        dateKidneyLabel.text = getReportKidney[0].K_DateTime
//        //ความดัน
//        getReportPressure = dbHelper.getReportPressure(datedisease: dateChoose)
//        datePressureLabel.text = getReportPressure[0].P_DateTime
//        costPressureTopLabel.text = String(format: "%i",(getReportPressure[0].P_CostPressureTop)!)
//        costPressureDownLabel.text = String(format: "%i",(getReportPressure[0].P_CostPressureDown)!)
//        costHeartLabel.text = String(format: "%i", (getReportPressure[0].P_HeartRate)!)
        }
    }

