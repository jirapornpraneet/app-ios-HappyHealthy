//
//  ReportHealthViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/27/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ReportHealthViewController: UIViewController{
     var getReport = [DiabetesTable]()
     var dbHelper = DatabaseHelper()
     var saveDate:String = ""
     //var insertDate:DateComponents
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var costSugarLabel: UILabel!
    @IBOutlet var dateDiabetesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "dd-MM-yyyy HH:mm"
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
        dateFormatterShow.dateFormat = "dd-MM-yyyy HH:mm"
        let  setDate = dateFormatterShow.string(from: datePicker.date)
        saveDate = setDate
    
        //loadAllData(dateChoose: setDate)
    }

    func loadAllData(dateChoose:String) {
         getReport = dbHelper.getReportHealth(datedisease: dateChoose)
         costSugarLabel.text = String(format: "%i" ,(getReport[0].D_CostSugar)!)
         dateDiabetesLabel.text = saveDate
    
    }

}
