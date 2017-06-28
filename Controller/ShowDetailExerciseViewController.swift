//
//  ShowDetailExerciseViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ShowDetailExerciseViewController: UIViewController,UITextFieldDelegate {
    var getExerciseTable: ExerciseTable?
    var dbHelper = DatabaseHelper()
    
    @IBOutlet var nameExerciseLabel: UILabel!
    @IBOutlet var desExerciseLabel: UILabel!
    @IBOutlet var kcalExerciseLabel: UILabel!
    @IBOutlet var detailExerciseLabel: UILabel!
    @IBOutlet var disExerciseLabel: UILabel!
    @IBOutlet var amountExerciseTextField: UITextField!
    var totalDuration:Double?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.amountExerciseTextField.delegate = self
        self.amountExerciseTextField.text = ""
        totalDuration = 1.0
        nameExerciseLabel.text = getExerciseTable?.Exercise_Name
        kcalExerciseLabel.text = String(format: "%.02f",(getExerciseTable?.Exercise_Calories)!)
        desExerciseLabel.text = getExerciseTable?.Exercise_Description
        disExerciseLabel.text = getExerciseTable?.Exercise_Disease
        detailExerciseLabel.text = getExerciseTable?.Exercise_Detail
        //setAddDurationExercise(total: totalDuration!)
    }
    
    @IBAction func textExerciseDidChanged(_ sender: Any) {
        if amountExerciseTextField.text == "" {
            return
        }
        totalDuration = 1.0
        totalDuration = Double(amountExerciseTextField.text!)
        setAddDurationExercise(total: totalDuration!)
    }
    
    func setAddDurationExercise(total:Double) {
        nameExerciseLabel.text = getExerciseTable?.Exercise_Name
        kcalExerciseLabel.text = (String(format: "%.02f",(getExerciseTable?.Exercise_Calories)! * total))
        desExerciseLabel.text = getExerciseTable?.Exercise_Description
        disExerciseLabel.text = getExerciseTable?.Exercise_Disease
        detailExerciseLabel.text = getExerciseTable?.Exercise_Detail
    }
    //Hide KeyBoard when user touches outside keyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        amountExerciseTextField.resignFirstResponder()
        return true
    }


}
