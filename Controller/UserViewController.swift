//
//  userViewController.swift
//  testSQLiteSwift2
//
//  Created by eofficeair on 6/19/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITextFieldDelegate {
    var getUserTable = [UserTable]()
    var insertDataUser = [UserTable]()
    var dbHelper = DatabaseHelper()
    @IBOutlet var nameUserTextField: UITextField!
    @IBOutlet var ageUserTextField: UITextField!
    @IBOutlet var weightUserTextField: UITextField!
    @IBOutlet var heightUserTextField: UITextField!
     @IBOutlet var genderUserTextField: UITextField!
     @IBOutlet var bmiUserTextField: UITextField!
     @IBOutlet var bmrUserTextField: UITextField!
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameUserTextField.text = ""
        self.ageUserTextField.text = ""
        self.weightUserTextField.text = ""
        self.heightUserTextField.text = ""
        self.bmiUserTextField.text = ""
        self.bmrUserTextField.text = ""
        self.genderUserTextField.text = ""
        //set the delegate
        self.nameUserTextField.delegate = self
        self.ageUserTextField.delegate = self
        self.weightUserTextField.delegate = self
        self.heightUserTextField.delegate = self
        self.bmiUserTextField.delegate = self
        self.bmrUserTextField.delegate = self
        self.genderUserTextField.delegate = self
        loadAllUser()
        // Do any additional setup after loading the view.
    }
    
    func  loadAllUser(){
        getUserTable = dbHelper.getUser()
        if getUserTable.count == 0 {
            return
        }
        nameUserTextField.text = getUserTable[0].User_Name
        ageUserTextField.text = getUserTable[0].User_Age
        weightUserTextField.text = String(format: "%f", (getUserTable[0].User_Weight)!)
        heightUserTextField.text = String(format: "%i", (getUserTable[0].User_Height)!)
        bmiUserTextField.text = String(format: "%f", (getUserTable[0].User_BMI)!)
        bmrUserTextField.text = String(format: "%f", (getUserTable[0].User_BMR)!)
        genderUserTextField.text = getUserTable[0].User_Gender
    }
    
    @IBAction func saveDataUserButton(_ sender: Any) {
        let userResource = UserTable()
        userResource.User_Name = nameUserTextField.text
        userResource.User_Age = ageUserTextField.text
        userResource.User_Weight = Double(weightUserTextField.text!)
        userResource.User_Height = Int(heightUserTextField.text!)
        userResource.User_BMI = Double(bmiUserTextField.text!)
        userResource.User_BMR = Double(bmrUserTextField.text!)
        userResource.User_Gender = genderUserTextField.text
        dbHelper.insertUserTable(dataRowUserTable: userResource)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Hide KeyBoard when user touches outside keyBoard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameUserTextField.resignFirstResponder()
        ageUserTextField.resignFirstResponder()
        weightUserTextField.resignFirstResponder()
        heightUserTextField.resignFirstResponder()
        bmiUserTextField.resignFirstResponder()
        bmrUserTextField.resignFirstResponder()
        genderUserTextField.resignFirstResponder()
        return true
    }

}


