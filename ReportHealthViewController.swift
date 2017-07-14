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
     var showColorBgLabelPressure:UIColor?
     var arrayShowColorLevelPressure:[UIColor] = [UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0),UIColor(red:0.87, green:0.40, blue:0.17, alpha:1.0),UIColor(red:0.92, green:0.55, blue:0.39, alpha:1.0),UIColor(red:0.96, green:0.72, blue:0.62, alpha:1.0),UIColor(red:0.95, green:0.84, blue:0.35, alpha:1.0),UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)]
    
    

    @IBOutlet var costSugarLabel: UILabel!
    @IBOutlet var dateDiabetesLabel: UILabel!
    @IBOutlet var levelDiabetesLabel: UILabel!
    @IBOutlet var costGFRLabel: UILabel!
    @IBOutlet var dateKidneyLabel: UILabel!
    @IBOutlet var levelKidneyLabel: UILabel!
    @IBOutlet weak var datePressureLabel: UILabel!
    @IBOutlet weak var costPressureTopLabel: UILabel!
    @IBOutlet weak var costPressureDownLabel: UILabel!
    @IBOutlet var levelPresureLabel: UILabel!
    @IBOutlet weak var costHeartLabel: UILabel!
    @IBOutlet var levelHeartLabel: UILabel!
    @IBOutlet weak var alertDiabetesImage: UIImageView!
    @IBOutlet weak var alertKidneyImage: UIImageView!
    @IBOutlet weak var alertPressureImage: UIImageView!
    @IBOutlet weak var alertHeartImage: UIImageView!
    @IBOutlet weak var picker: AAPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let setDate = formatter.string(from: date)
        self.saveDate = setDate
        picker.text = saveDate
        self.loadDiabetes(dateChoose: self.saveDate)
        self.loadKidney(dateChoose: self.saveDate)
        self.loadPressure(dateChoose: self.saveDate)
        configPicker()
        levelDiabetesLabel.layer.masksToBounds = true
        levelDiabetesLabel.layer.cornerRadius = 8
        levelDiabetesLabel.textColor = UIColor.white
        levelKidneyLabel.layer.masksToBounds = true
        levelKidneyLabel.layer.cornerRadius = 8
        levelKidneyLabel.textColor = UIColor.white
        levelPresureLabel.layer.masksToBounds = true
        levelPresureLabel.layer.cornerRadius = 8
        levelPresureLabel.textColor = UIColor.white
        levelHeartLabel.layer.masksToBounds = true
        levelHeartLabel.layer.cornerRadius = 8
        levelHeartLabel.textColor = UIColor.white
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
        self.loadDiabetes(dateChoose: self.saveDate)
        self.loadKidney(dateChoose: self.saveDate)
        self.loadPressure(dateChoose: self.saveDate)
        }
 }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadDiabetes(dateChoose:String) {
        getCheckReportDiabetes = dbHelper.getCheckReportDiabetes(datedisease: dateChoose)
        if getCheckReportDiabetes.count == 0 {
            dateDiabetesLabel.text = "วัน-เดือน-ปี"
            costSugarLabel.text = "000"
            alertDiabetesImage.image = nil
            return
        }
        getReportDiabetes = dbHelper.getReportDiabetes(datedisease: dateChoose)
        
        let getCostSuger:Int? = (getReportDiabetes[0].D_CostSugar!)
        let getStatus:String? = (getReportDiabetes[0].D_Status!)
        let getPeople:String? = (getReportDiabetes[0].D_People!)
      
        if getPeople == "คนปกติ" {
            if getStatus == "ก่อนอาหาร" {
                if getCostSuger! >= 126 {
                    showAlertDiabetesImage = UIImage(named: "warning.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }else if getCostSuger! >= 70 && getCostSuger! < 126{
                    showAlertDiabetesImage = nil
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
                }else{
                    showAlertDiabetesImage = UIImage(named: "warning.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }
            }else{
                if getCostSuger! >= 200 {
                    showAlertDiabetesImage = UIImage(named: "warning.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }else if getCostSuger! >= 70 && getCostSuger! < 200 {
                    showAlertDiabetesImage = nil
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
                }else{
                    showAlertDiabetesImage = UIImage(named: "warning.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }
            }
        }else{
            if getStatus == "ก่อนอาหาร" {
                if getCostSuger! >= 130 {
                    showAlertDiabetesImage = UIImage(named: "warning.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }else if getCostSuger! >= 100 && getCostSuger! < 130{
                    showAlertDiabetesImage = nil
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.92, green:0.55, blue:0.39, alpha:1.0)
                }else if getCostSuger! >= 90 && getCostSuger! < 100{
                    showAlertDiabetesImage = nil
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.95, green:0.84, blue:0.35, alpha:1.0)
                }else if getCostSuger! >= 70 && getCostSuger! < 90{
                    showAlertDiabetesImage = nil
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
                }else{
                    showAlertDiabetesImage = UIImage(named: "warning.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }
            }else{
                if getCostSuger! >= 180{
                    showAlertDiabetesImage = UIImage(named: "warning.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }else if getCostSuger! >= 150 && getCostSuger! < 180{
                    showAlertDiabetesImage = nil
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.92, green:0.55, blue:0.39, alpha:1.0)
                }else if getCostSuger! >= 110 && getCostSuger! < 150{
                    showAlertDiabetesImage = nil
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.95, green:0.84, blue:0.35, alpha:1.0)
                }else if getCostSuger! >= 70 && getCostSuger! < 110{
                    showAlertDiabetesImage = nil
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
                }else{
                    showAlertDiabetesImage = UIImage(named: "warning.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }
            }
        }
        
        costSugarLabel.text = String(format: "%i" ,(getReportDiabetes[0].D_CostSugar)!)
        alertDiabetesImage.image = showAlertDiabetesImage
        dateDiabetesLabel.text = getReportDiabetes[0].D_DateTime
        levelDiabetesLabel.text = getReportDiabetes[0].D_Level
        
      }
    
    func loadKidney(dateChoose:String) {
        getCheckReportKidney = dbHelper.getCheckReportKidney(datedisease: dateChoose)
        
        if getCheckReportKidney.count == 0 {
            costGFRLabel.text = "000"
            dateKidneyLabel.text = "วัน-เดือน-ปี"
            alertKidneyImage.image = nil
            return
        }
        getReportKidney = dbHelper.getReportKidney(datedisease: dateChoose)
        
        let getCostGFR:Int? = (getReportKidney[0].K_CostGFR!)
        
        if getCostGFR! >= 90 {
            showAlertKidneyImage = nil
            levelKidneyLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
        }else if getCostGFR! >= 60 && getCostGFR! < 90 {
            showAlertKidneyImage = nil
            levelKidneyLabel.backgroundColor = UIColor(red:0.95, green:0.84, blue:0.35, alpha:1.0)
        }else if getCostGFR! >= 30 && getCostGFR! < 60 {
            showAlertKidneyImage = nil
            levelKidneyLabel.backgroundColor = UIColor(red:0.93, green:0.70, blue:0.58, alpha:1.0)
        }else if getCostGFR! >= 15 && getCostGFR! < 30 {
            showAlertKidneyImage = nil
            levelKidneyLabel.backgroundColor = UIColor(red:0.92, green:0.55, blue:0.39, alpha:1.0)
        }else{
            showAlertKidneyImage = UIImage(named: "warning.png")
            levelKidneyLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
        }
        
        getReportKidney = dbHelper.getReportKidney(datedisease: dateChoose)
        costGFRLabel.text = String(format: "%i" ,(getReportKidney[0].K_CostGFR)!)
        dateKidneyLabel.text = getReportKidney[0].K_DateTime
        alertKidneyImage.image =  showAlertKidneyImage
        levelKidneyLabel.text = getReportKidney[0].K_LevelCostGFR
    }
    
    func loadPressure(dateChoose:String) {
        getCheckReportPressure = dbHelper.getCheckReportPressure(datedisease: dateChoose)

        if getCheckReportPressure.count == 0 {
            datePressureLabel.text = "วัน-เดือน-ปี"
            costPressureTopLabel.text = "000"
            costPressureDownLabel.text = "000"
            costHeartLabel.text = "000"
            alertPressureImage.image = nil
            alertHeartImage.image = nil
            return
        }
        getReportPressure = dbHelper.getReportPressure(datedisease: dateChoose)
        
        let getCostHeart:Int? = (getReportPressure[0].P_HeartRate!)
        let getPressureTop:Int? = (getReportPressure[0].P_CostPressureTop!)
        let getPressureDown:Int? = (getReportPressure[0].P_CostPressureDown!)
        
        if getCostHeart! >= 101 {
            showAlertHeartImage = UIImage(named: "warning.png")
            levelHeartLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
        }else if getCostHeart!  >= 85 && getCostHeart!   < 101{
            showAlertHeartImage = nil
            levelHeartLabel.backgroundColor = UIColor(red:0.87, green:0.40, blue:0.17, alpha:1.0)
        }else if getCostHeart!  >= 70 && getCostHeart!  < 85 {
            showAlertHeartImage = nil
            levelHeartLabel.backgroundColor = UIColor(red:0.96, green:0.72, blue:0.62, alpha:1.0)
        }else if getCostHeart!  >= 60 && getCostHeart!   < 70 {
            showAlertHeartImage = nil
            levelHeartLabel.backgroundColor = UIColor(red:0.95, green:0.84, blue:0.35, alpha:1.0)
        }else if getCostHeart!  >= 41 && getCostHeart!   < 60 {
            showAlertHeartImage = nil
            levelHeartLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
        }else{
            showAlertHeartImage = UIImage(named: "warning.png")
            levelHeartLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
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
            showColorBgLabelPressure = arrayShowColorLevelPressure[costTop!]
            levelPresureLabel.backgroundColor = showColorBgLabelPressure
            if costTop == 0 {
                showAlertPressureImage = UIImage(named: "warning.png")
                alertPressureImage.image = showAlertPressureImage
            }else{
                alertPressureImage.image = nil
            }
      
        }else{
            showColorBgLabelPressure = arrayShowColorLevelPressure[costDown!]
            levelPresureLabel.backgroundColor = showColorBgLabelPressure
        if costDown == 0 {
            showAlertPressureImage = UIImage(named: "warning.png")
            alertPressureImage.image = showAlertPressureImage
        }else{
            alertPressureImage.image = nil
            }
        }
        
        getReportPressure = dbHelper.getReportPressure(datedisease: dateChoose)
        datePressureLabel.text = getReportPressure[0].P_DateTime
        costPressureTopLabel.text = String(format: "%i",(getReportPressure[0].P_CostPressureTop)!)
        costPressureDownLabel.text = String(format: "%i",(getReportPressure[0].P_CostPressureDown)!)
        costHeartLabel.text = String(format: "%i", (getReportPressure[0].P_HeartRate)!)
        levelPresureLabel.text = getReportPressure[0].P_Pressure_Level
        levelHeartLabel.text = getReportPressure[0].P_HeartRate_Level
        alertHeartImage.image = showAlertHeartImage
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "รายงานสุขภาพ"
    }
}

