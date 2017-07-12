//
//  ReportFoodandExercise.swift
//  HappyHealthy
//
//  Created by Jiraporn Praneet on 7/3/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit
import AAPickerView

class ReportFoodandExercise: UIViewController {
    var getSumFoodAll = [HistorySumFoodTable]()
    var getSumExerciseAll = [HistorySumExerciseTable]()
    var getFoodHistory = [FoodHistoryTable]()
    var getFoodTable = [FoodTable]()
    var dbHelper = DatabaseHelper()
    var dataFoodTable: FoodTable?
    var getExerciseHistory = [ExerciseHistoryTable]()
    var sumTotal:Double?
    var saveDate:String?
    var senderDate:String?
    

    @IBOutlet weak var exerciseTotalcal: UILabel!
    @IBOutlet weak var foodTotalcal: UILabel!
    @IBOutlet var dateHistoryPicker: AAPickerView!
    @IBOutlet weak var sumProtin: UILabel!
    @IBOutlet weak var sumCarbohydate: UILabel!
    @IBOutlet weak var sumFat: UILabel!
    @IBOutlet weak var sumSugar: UILabel!
    @IBOutlet weak var sumSodium: UILabel!
    @IBOutlet weak var sumTotalCal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let setDate = formatter.string(from: date)
        self.saveDate = setDate
        dateHistoryPicker.text = saveDate
        self.loadFood(dateChoose: self.saveDate!)
        self.loadExercise(dateChoose: self.saveDate!)
        configPicker()
    }
    
    func configPicker(){
        dateHistoryPicker.pickerType = .DatePicker
        dateHistoryPicker.datePicker?.datePickerMode = .date
        dateHistoryPicker.dateFormatter.dateFormat = "dd-MM-YYYY"
        dateHistoryPicker.dateDidChange = { date in
            print("selectedDate ", date )
            let dateFormatterShow = DateFormatter()
            dateFormatterShow.dateFormat = "dd-MM-yyyy"
            let setDate  = dateFormatterShow.string(from: date)
            print(">>> %@", dateFormatterShow.string(from: date))
            self.saveDate = setDate
            self.loadFood(dateChoose: self.saveDate!)
            self.loadExercise(dateChoose: self.saveDate!)
            self.tabBarController?.navigationItem.title = "รายงานการบริโภคและการออกกำลังกาย"
        }
    }

    func loadFood(dateChoose:String) {
        getFoodHistory = dbHelper.getFoodHistory(dateHistory: dateChoose)
        if getFoodHistory.count == 0   {
            return
        }
        getSumFoodAll = dbHelper.getSumFood(dateHistory: dateChoose)
        
        foodTotalcal.text = String(format: "%.02f", (getSumFoodAll[0].SUM_Food_Cal)!)
        sumProtin.text = String(format: "%.02f", (getSumFoodAll[0].SUM_pro)!)
        sumCarbohydate.text = String(format: "%.02f", (getSumFoodAll[0].SUM_car)!)
        sumFat.text = String(format: "%.02f", (getSumFoodAll[0].SUM_fat)!)
        sumSugar.text = String(format: "%.02f", (getSumFoodAll[0].SUM_sugar)!)
        sumSodium.text = String(format: "%.02f", (getSumFoodAll[0].SUM_sodium)!)
        let getSumFood:Double? = (getSumFoodAll[0].SUM_Food_Cal!)
        sumTotal = getSumFood!
        sumTotalCal.text = String(format: "%.02f", (sumTotal)!)
        getExerciseHistory = dbHelper.getExerciseHistory(dateHistory: dateChoose)
        if getExerciseHistory.count == 0 {
            return
        }
        getSumExerciseAll = dbHelper.getSumExercise(dateHistory: dateChoose)
        let getSumExercise:Double? = (getSumExerciseAll[0].SUM_EX_Cal!)
        sumTotal = getSumFood! - getSumExercise!
        sumTotalCal.text = String(format: "%.02f", (sumTotal)!)

    }
    
    func loadExercise(dateChoose:String){
        getExerciseHistory = dbHelper.getExerciseHistory(dateHistory: dateChoose)
        if getExerciseHistory.count == 0 {
            return
        }
        getSumExerciseAll = dbHelper.getSumExercise(dateHistory: dateChoose)
        exerciseTotalcal.text = String(format: "%.02f", (getSumExerciseAll[0].SUM_EX_Cal)!)
        let getSumExercise:Double? = (getSumExerciseAll[0].SUM_EX_Cal!)
        sumTotal =  getSumExercise!
        sumTotalCal.text = String(format: "%.02f", (sumTotal)!)
        getFoodHistory = dbHelper.getFoodHistory(dateHistory: dateChoose)
        if getFoodHistory.count == 0   {
            return
        }
        getSumFoodAll = dbHelper.getSumFood(dateHistory: dateChoose)
        let getSumFood:Double? = (getSumFoodAll[0].SUM_Food_Cal!)
        sumTotal = getSumFood! - getSumExercise!
        sumTotalCal.text = String(format: "%.02f", (sumTotal)!)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailHistoryFood"  {
            let vc = segue.destination as! listFoodHistoryViewController
            vc.senderDate = saveDate
        } else if segue.identifier == "DetailHistoryExercise"{
            let vc = segue.destination as! listExerciseHistoryViewController
            vc.senderDate = saveDate
        }
    
    }
}
