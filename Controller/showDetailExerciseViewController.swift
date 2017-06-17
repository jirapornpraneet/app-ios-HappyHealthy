//
//  ShowDetailExerciseViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class showDetailExerciseViewController: UIViewController {

    var getExerciseModel: exerciseModel?
    var dbHelper = DatabaseHelper()
    
    @IBOutlet var nameExerciseLabel: UILabel!
    @IBOutlet var desExerciseLabel: UILabel!
    @IBOutlet var kcalExerciseLabel: UILabel!
    @IBOutlet var detailExerciseLabel: UILabel!
    @IBOutlet var disExerciseLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        nameExerciseLabel.text = getExerciseModel?.Exercise_Name
        kcalExerciseLabel.text = String(format: "%f",(getExerciseModel?.Exercise_Calories)!)
        desExerciseLabel.text = getExerciseModel?.Exercise_Description
        disExerciseLabel.text = getExerciseModel?.Exercise_Disease
        detailExerciseLabel.text = getExerciseModel?.Exercise_Detail
        // Do any additional setup after loading the view.
    }
    
}
