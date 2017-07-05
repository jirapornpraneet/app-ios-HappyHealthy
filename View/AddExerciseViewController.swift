//
//  AddExerciseViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/27/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class AddExerciseViewController: UIViewController,UITextFieldDelegate {

    var insertExercisTable = [ExerciseTable]()
    var dbHelper = DatabaseHelper()
    @IBOutlet var nameExerciseTextField: UITextField!
    @IBOutlet var kcalExerciseTextField: UITextField!
    @IBOutlet var durationExerciseTextField: UITextField!
    @IBOutlet var diseaseExerciseTextField: UITextField!
    @IBOutlet var detailExerciseTextField: UITextField!
    @IBOutlet var descriptionExerciseTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.nameExerciseTextField.text = ""
         self.kcalExerciseTextField.text = ""
         self.durationExerciseTextField.text = ""
         self.diseaseExerciseTextField.text = ""
         self.detailExerciseTextField.text = ""
         self.descriptionExerciseTextField.text = ""
        //set the delegate
        self.nameExerciseTextField.delegate = self
        self.kcalExerciseTextField.delegate = self
        self.durationExerciseTextField.delegate = self
        self.diseaseExerciseTextField.delegate = self
        self.detailExerciseTextField.delegate = self
        self.descriptionExerciseTextField.delegate = self
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveExercise(_ sender: Any) {
        //ShowAlertController
        let alertShow = UIAlertController (title: "ยืนยันการบันทึกข้อมูลออกกำลังกาย", message:"คุณแน่ใจใช่ไหม" , preferredStyle: UIAlertControllerStyle.alert)
        alertShow.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler: { (action) in
            alertShow.dismiss(animated: true, completion: nil)
              self.insertDataExercise()
              self.alertSaveData()
        }))
        
        alertShow.addAction(UIAlertAction(title: "ยกเลิก" , style: UIAlertActionStyle.default, handler: { (action) in
            alertShow.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alertShow,animated: true,completion: nil)

    }
    func alertSaveData(){
        //ShowAlertController
        let alertShowSave = UIAlertController (title: "บันทึกข้อมูลออกกำลังกาย", message:" คุณได้บันทึกข้อมูลออกกำลังกายสำเร็จ" , preferredStyle: UIAlertControllerStyle.alert)
        alertShowSave.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler:nil))
        self.present(alertShowSave, animated: true, completion: nil)
     }

    func insertDataExercise() {
        let exerciseResource = ExerciseTable()
        exerciseResource.Exercise_Name = nameExerciseTextField.text
        exerciseResource.Exercise_Calories = Double(kcalExerciseTextField.text!)
        exerciseResource.Exercise_Duration = Double(durationExerciseTextField.text!)
        exerciseResource.Exercise_Detail = detailExerciseTextField.text
        exerciseResource.Exercise_Description = descriptionExerciseTextField.text
        exerciseResource.Exercise_Disease = diseaseExerciseTextField.text
        dbHelper.insertExerciseTable(dataRowExerciseTable: exerciseResource)
    }
    //Hide KeyBoard when user touches outside keyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameExerciseTextField.resignFirstResponder()
        kcalExerciseTextField.resignFirstResponder()
        durationExerciseTextField.resignFirstResponder()
        diseaseExerciseTextField.resignFirstResponder()
        detailExerciseTextField.resignFirstResponder()
        descriptionExerciseTextField.resignFirstResponder()
        return true
    }
    
    

}
