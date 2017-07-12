//
//  ReportHealthViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/27/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit
import AAPickerView


class ReportHealthViewController: UIViewController{
     var getCheckReportDiabetes = [DiabetesTable]()
     var getCheckReportKidney = [KidneyTable]()
     var getCheckReportPressure = [PressureTable]()
     var getReportDiabetes = [DiabetesTable]()
     var getReportKidney = [KidneyTable]()
     var getReportPressure = [PressureTable]()
     var dbHelper = DatabaseHelper()
     var saveDate:String = ""
     var showAlertDiabetesImage:UIImage?
     var showAlertKidneyImage:UIImage?
     var showAlertPressureImage:UIImage?
     var showAlertHeartImage:UIImage?
     var costTop:Int?
     var costDown:Int?
     var imageAlertLevelPre:[UIImage] = [UIImage(named: "alertPressure1.png")!,UIImage(named: "alertPressure2.png")!,UIImage(named: "alertPressure3.png")!,UIImage(named: "alertPressure4.png")!,UIImage(named: "alertPressure5.png")!,UIImage(named: "alertPressure0.png")!,UIImage(named: "alertPressure6.png")!]

    @IBOutlet var costSugarLabel: UILabel!
    @IBOutlet var dateDiabetesLabel: UILabel!
    @IBOutlet var costGFRLabel: UILabel!
    @IBOutlet var dateKidneyLabel: UILabel!
    @IBOutlet weak var datePressureLabel: UILabel!
    @IBOutlet weak var costPressureTopLabel: UILabel!
    @IBOutlet weak var costPressureDownLabel: UILabel!
    @IBOutlet weak var costHeartLabel: UILabel!
    @IBOutlet weak var alertDiabetesImage: UIImageView!
    @IBOutlet weak var alertKidneyImage: UIImageView!
    @IBOutlet weak var alertPressureImage: UIImageView!
    @IBOutlet weak var alertHeartImage: UIImageView!
    @IBOutlet weak var picker: AAPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let setDate = formatter.string(from: date)
        self.saveDate = setDate
        picker.text = saveDate
        self.loadAllData(dateChoose: self.saveDate)
        configPicker()
    }
    
    func configPicker(){
        picker.pickerType = .DatePicker
        picker.datePicker?.datePickerMode = .date
        picker.dateFormatter.dateFormat = "dd-MM-yyyy"
        picker.dateDidChange = { date in
            print("selectedDate ", date )
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "dd-MM-yyyy"
        let setDate  = dateFormatterShow.string(from: date)
        print(">>> %@", dateFormatterShow.string(from: date))
        self.saveDate = setDate
        self.loadAllData(dateChoose: self.saveDate)
        self.tabBarController?.navigationItem.title = "รายงานสุขภาพ"
        }
 }
    
//    override func viewWillAppear(_ animated: Bool) {
////        let dateFormatterShow = DateFormatter()
////        dateFormatterShow.dateFormat = "dd-MM-yyyy"
////        let  setDate = dateFormatterShow.string(from: datePicker.date)
////        saveDate = setDate
////        loadAllData(dateChoose: saveDate)
////        self.tabBarController?.navigationItem.title = "รายงานสุขภาพ"
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadAllData(dateChoose:String) {
        //เบาหวาน
        getCheckReportDiabetes = dbHelper.getCheckReportDiabetes(datedisease: dateChoose)
        if getCheckReportDiabetes.count == 0 {
             return
        }
        getReportDiabetes = dbHelper.getReportDiabetes(datedisease: dateChoose)
        
        let getCostSuger:Int? = (getReportDiabetes[0].D_CostSugar!)
        let getStatus:String? = (getReportDiabetes[0].D_Status!)
        let getPeople:String? = (getReportDiabetes[0].D_People!)
        
        if getPeople == "คนปกติ" {
            if getStatus == "ก่อนอาหาร" {
                if getCostSuger! >= 126 {
                    showAlertDiabetesImage = UIImage(named: "alertNormal.png")
                }else if getCostSuger! >= 70 && getCostSuger! < 126{
                    showAlertDiabetesImage = UIImage(named: "alertNormal1.png")
                }else{
                    showAlertDiabetesImage = UIImage(named: "alertNormal2.png")
                }
            }else{
                if getCostSuger! >= 200 {
                    showAlertDiabetesImage = UIImage(named: "alertNormal.png")
                }else if getCostSuger! >= 70 && getCostSuger! < 200 {
                    showAlertDiabetesImage = UIImage(named: "alertNormal1.png")
                }else{
                    showAlertDiabetesImage = UIImage(named: "alertNormal2.png")
                }
            }
        }else{
            if getStatus == "ก่อนอาหาร" {
                if getCostSuger! >= 130 {
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes1.png")
                }else if getCostSuger! >= 100 && getCostSuger! < 130{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes4.png")
                }else if getCostSuger! >= 90 && getCostSuger! < 100{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes5.png")
                }else if getCostSuger! >= 70 && getCostSuger! < 90{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes2.png")
                }else{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes3.png")
                }
            }else{
                if getCostSuger! >= 180{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes1.png")
                }else if getCostSuger! >= 150 && getCostSuger! < 180{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes4.png")
                }else if getCostSuger! >= 110 && getCostSuger! < 150{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes5.png")
                }else if getCostSuger! >= 70 && getCostSuger! < 110{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes2.png")
                }else{
                    showAlertDiabetesImage = UIImage(named: "alertDiabetes3.png")
                }
            }
        }
        
        costSugarLabel.text = String(format: "%i" ,(getReportDiabetes[0].D_CostSugar)!)
        alertDiabetesImage.image = showAlertDiabetesImage
        dateDiabetesLabel.text = getReportDiabetes[0].D_DateTime
        
        //ไต
        getCheckReportKidney = dbHelper.getCheckReportKidney(datedisease: dateChoose)
        
        if getCheckReportKidney.count == 0 {
            return
        }
        getReportKidney = dbHelper.getReportKidney(datedisease: dateChoose)
        
        let getCostGFR:Int? = (getReportKidney[0].K_CostGFR!)
        
        if getCostGFR! >= 90 {
            showAlertKidneyImage = UIImage(named: "alertNormal1.png")
        }else if getCostGFR! >= 60 && getCostGFR! < 90 {
            showAlertKidneyImage = UIImage(named: "alertKidney2.png")
        }else if getCostGFR! >= 30 && getCostGFR! < 60 {
             showAlertKidneyImage = UIImage(named: "alertKidney3.png")
        }else if getCostGFR! >= 15 && getCostGFR! < 30 {
            showAlertKidneyImage = UIImage(named: "alertKidney4.png")
        }else{
            showAlertKidneyImage = UIImage(named: "alertKidney5.png")
        }

        getReportKidney = dbHelper.getReportKidney(datedisease: dateChoose)
        costGFRLabel.text = String(format: "%i" ,(getReportKidney[0].K_CostGFR)!)
        dateKidneyLabel.text = getReportKidney[0].K_DateTime
        alertKidneyImage.image =  showAlertKidneyImage
        getCheckReportPressure = dbHelper.getCheckReportPressure(datedisease: dateChoose)
        
        //ความดัน
        if getCheckReportPressure.count == 0 {
            return
        }
        getReportPressure = dbHelper.getReportPressure(datedisease: dateChoose)
    
        let getCostHeart:Int? = (getReportPressure[0].P_HeartRate!)
        let getPressureTop:Int? = (getReportPressure[0].P_CostPressureTop!)
        let getPressureDown:Int? = (getReportPressure[0].P_CostPressureDown!)
        
        if getCostHeart! >= 101 {
            showAlertHeartImage = UIImage(named: "alertHeart5.png")
        }else if getCostHeart!  >= 85 && getCostHeart!   < 101{
            showAlertHeartImage = UIImage(named: "alertHeart4.png")
        }else if getCostHeart!  >= 70 && getCostHeart!  < 85 {
            showAlertHeartImage = UIImage(named: "alertHeart3.png")
        }else if getCostHeart!  >= 60 && getCostHeart!   < 70 {
            showAlertHeartImage = UIImage(named: "alertHeart2.png")
        }else if getCostHeart!  >= 41 && getCostHeart!   < 60 {
            showAlertHeartImage = UIImage(named: "alertHeart1.png")
        }else{
            showAlertHeartImage = UIImage(named: "alertHeart5.png")
        }
        
        if getPressureTop! >= 180 {
            costTop  = 0
        }else if getPressureTop! >= 160 && getPressureTop! < 180 {
            costTop  = 1
        }else if getPressureTop! >= 140 && getPressureTop! < 160 {
            costTop  = 2
        }else if getPressureTop! >= 130 && getPressureTop! < 140 {
            costTop  = 3
        }else if getPressureTop! >= 120 && getPressureTop! < 130 {
            costTop  = 4
        }else if getPressureTop! >= 90 && getPressureTop! < 120 {
            costTop  = 5
        }else{
            costTop  = 0
        }
        
        if getPressureDown! >= 110 {
            costDown  = 0
        }else if getPressureDown! >= 100 && getPressureDown! < 110 {
            costDown  = 1
        }else if getPressureDown! >= 90 && getPressureDown! < 100 {
            costDown  = 2
        }else if getPressureDown! >= 85 && getPressureDown! < 90 {
            costDown  = 3
        }else if getPressureDown! >= 80 && getPressureDown! < 85 {
            costDown  = 4
        }else if getPressureDown! >= 60 && getPressureDown! < 80 {
            costDown  = 5
        }else{
            costDown  = 0
        }
        
        if costTop! < costDown! {
            showAlertPressureImage = imageAlertLevelPre[costTop!]
        }else{
            showAlertPressureImage = imageAlertLevelPre[costDown!]
        }
       
        getReportPressure = dbHelper.getReportPressure(datedisease: dateChoose)
        datePressureLabel.text = getReportPressure[0].P_DateTime
        costPressureTopLabel.text = String(format: "%i",(getReportPressure[0].P_CostPressureTop)!)
        costPressureDownLabel.text = String(format: "%i",(getReportPressure[0].P_CostPressureDown)!)
        costHeartLabel.text = String(format: "%i", (getReportPressure[0].P_HeartRate)!)
        alertPressureImage.image = showAlertPressureImage
        alertHeartImage.image = showAlertHeartImage
        }
}

