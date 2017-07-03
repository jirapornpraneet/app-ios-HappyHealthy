//
//  ReportFoodandExercise.swift
//  HappyHealthy
//
//  Created by Jiraporn Praneet on 7/3/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ReportFoodandExercise: UIViewController {
    var getSumFoodandExercis = [HistorySUMTable]()
    var getFoodHistory = [FoodHistoryTable]()
    var getExerciseHistory = [ExerciseHistoryTable]()
    var dbHelper = DatabaseHelper()
    var sumTotal:Double?
    var saveDate:String = ""

    @IBOutlet weak var exerciseTotalcal: UILabel!
    @IBOutlet weak var foodTotalcal: UILabel!
    @IBOutlet var dateHistoryPicker: UIDatePicker!
    @IBOutlet weak var sumProtin: UILabel!
    @IBOutlet weak var sumCarbohydate: UILabel!
    @IBOutlet weak var sumFat: UILabel!
    @IBOutlet weak var sumSugar: UILabel!
    @IBOutlet weak var sumSodium: UILabel!
    @IBOutlet weak var sumTotalCal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectDatePicker(_ sender: Any) {
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "dd-MM-yyyy"
        let  setDate = dateFormatterShow.string(from: dateHistoryPicker.date)
        //saveDate = setDate
        loadAllData(dateChoose: setDate)
        
    }
    
    func loadAllData(dateChoose:String) {
        
       getFoodHistory = dbHelper.getFoodHistory(dateHistory: dateChoose)
        if getFoodHistory.count == 0 {
            return
        }
       getExerciseHistory = dbHelper.getExerciseHistory(dateHistory: dateChoose)
        if getExerciseHistory.count == 0 {
            return
        }
        getSumFoodandExercis = dbHelper.getSumFoodandExercise(dateHistory: dateChoose)
        
        
        let getSumFood:Double? = (getSumFoodandExercis[0].SUM_Food_Cal!)
        let getSumExercise:Double? = (getSumFoodandExercis[0].SUM_EX_Cal!)
        sumTotal = getSumFood! - getSumExercise!
        exerciseTotalcal.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_EX_Cal)!)
        foodTotalcal.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_Food_Cal)!)
        sumProtin.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_pro)!)
        sumCarbohydate.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_car)!)
        sumFat.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_fat)!)
        sumSugar.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_sugar)!)
        sumSodium.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_sodium)!)
        sumTotalCal.text = String(format: "%.02f", (sumTotal)!)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "dd-MM-yyyy"
        let  setDate = dateFormatterShow.string(from: dateHistoryPicker.date)
        saveDate = setDate
        loadAllData(dateChoose: saveDate)
    }
}
