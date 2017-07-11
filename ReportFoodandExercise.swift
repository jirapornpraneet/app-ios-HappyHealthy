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
    var getSumFoodandExercis = [HistorySUMTable]()
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
    
    @IBAction func selectDatePicker(_ sender: Any) {
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "dd-MM-yyyy"
        let setDate = dateFormatterShow.string(from: dateHistoryPicker.date)
        //saveDate = setDate
        loadAllData(dateChoose: setDate)
        
    }
    
    func loadAllData(dateChoose:String) {
        getFoodHistory = dbHelper.getFoodHistory(dateHistory: dateChoose)
        getExerciseHistory = dbHelper.getExerciseHistory(dateHistory: dateChoose)
  
        if getFoodHistory.count == 0  {
            return
        }
        
        if getExerciseHistory.count == 0 {
            return
        }
        
        getSumFoodandExercis = dbHelper.getSumFoodandExercise(dateHistory: dateChoose)
       
        let getSumFood:Double? = (getSumFoodandExercis[0].SUM_Food_Cal!)
        let getSumExercise:Double? = (getSumFoodandExercis[0].SUM_EX_Cal!)
        exerciseTotalcal.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_EX_Cal)!)
        foodTotalcal.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_Food_Cal)!)
        sumProtin.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_pro)!)
        sumCarbohydate.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_car)!)
        sumFat.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_fat)!)
        sumSugar.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_sugar)!)
        sumSodium.text = String(format: "%.02f", (getSumFoodandExercis[0].SUM_sodium)!)
        sumTotal = getSumFood! - getSumExercise!
        sumTotalCal.text = String(format: "%.02f", (sumTotal)!)
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "dd-MM-yyyy"
        let setDate = dateFormatterShow.string(from: dateHistoryPicker.date)
        saveDate = setDate
        loadAllData(dateChoose: saveDate!)
        self.tabBarController?.navigationItem.title = "รายงานการบริโภคและการออกกำลังกาย"
   
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
