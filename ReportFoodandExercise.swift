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
    var dbHelper = DatabaseHelper()
 

    @IBOutlet var dateHistoryPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAllData() {
         getSumFoodandExercis = dbHelper.getSumFoodandExercise()
    }
}
