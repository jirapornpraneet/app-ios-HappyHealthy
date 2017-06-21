//
//  ShowDetailExerciseViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ShowDetailExerciseViewController: UIViewController {

    var getExerciseTable: ExerciseTable?
    var dbHelper = DatabaseHelper()
    
    @IBOutlet var nameExerciseLabel: UILabel!
    @IBOutlet var desExerciseLabel: UILabel!
    @IBOutlet var kcalExerciseLabel: UILabel!
    @IBOutlet var detailExerciseLabel: UILabel!
    @IBOutlet var disExerciseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameExerciseLabel.text = getExerciseTable?.Exercise_Name
        kcalExerciseLabel.text = String(format: "%.2f",(getExerciseTable?.Exercise_Calories)!)
        desExerciseLabel.text = getExerciseTable?.Exercise_Description
        disExerciseLabel.text = getExerciseTable?.Exercise_Disease
        detailExerciseLabel.text = getExerciseTable?.Exercise_Detail
        // Do any additional setup after loading the view.
    }
    
}
