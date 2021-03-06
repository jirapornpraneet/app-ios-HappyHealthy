//
//  userViewController.swift
//  testSQLiteSwift2
//
//  Created by eofficeair on 6/19/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITextFieldDelegate, UIScrollViewDelegate{
    var getUserTable = [UserTable]()
    var getCheckUserTable = [UserTable]()
    var insertDataUser = [UserTable]()
    var insertDiabetes = [DiabetesTable]()
    var dbHelper = DatabaseHelper()
    var genderList: [String] = ["Male", "Female"]
    var genderName: String = ""
    var diabetesPeopleList: [String] = ["คนปกติ", "เบาหวาน"]
    var diabetesPeopleName: String = ""
    var bmrUser:Double?
    var bmiUser:Double?
    var weigthUser: Double?
    var heightUser: Double?
    var ageUser:Double?
    var showBmi:String?
    var showImageViewBmi: UIImage?
    var getBmiUser:Double?
    
    @IBOutlet var saveData: UIBarButtonItem!
    @IBOutlet var nameUserTextField: UITextField!
    @IBOutlet var ageUserTextField: UITextField!
    @IBOutlet var weightUserTextField: UITextField!
    @IBOutlet var heightUserTextField: UITextField!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    @IBOutlet var bmiUserLabel: UILabel!
    @IBOutlet var bmrUserLabel: UILabel!
    @IBOutlet var showBmiUserLabel: UILabel!
    @IBOutlet var showImageBmi: UIImageView!
    @IBOutlet var diabetesSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameUserTextField.text = ""
        ageUserTextField.text = ""
        weightUserTextField.text = ""
        heightUserTextField.text = ""
        //set the delegate
        nameUserTextField.delegate = self
        ageUserTextField.delegate = self
        weightUserTextField.delegate = self
        heightUserTextField.delegate = self
        scrollView.delegate = self
        //genderUser
        let genderSelect: String = genderList[genderSegmentedControl.selectedSegmentIndex]
        genderName = genderSelect
        //diabeets
        let diabetesPeopleSelect:String = diabetesPeopleList[diabetesSegmentedControl.selectedSegmentIndex]
        diabetesPeopleName = diabetesPeopleSelect
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        scrollView.addGestureRecognizer(tap)
    }
    
    func setsaveDataButtonIsEnabled() {
        let editTexts = [nameUserTextField, ageUserTextField, weightUserTextField, heightUserTextField]
        let emptyCount = editTexts
            .filter { (textField) -> Bool in
                textField?.text == ""
        }
            .count
        saveData.isEnabled = emptyCount == 0
    }
    
    @IBAction func inputNameUser(_ sender: Any) {
        setsaveDataButtonIsEnabled()
    }

    @IBAction func inputAgeUser(_ sender: Any) {
        setsaveDataButtonIsEnabled()
    }
    
    @IBAction func inputWeightUser(_ sender: Any) {
        setsaveDataButtonIsEnabled()
    }
    
    @IBAction func inputHeightUser(_ sender: Any) {
        setsaveDataButtonIsEnabled()
    }
    
   //Hide KeyBoard when user touches outside keyBoard
    
    func dismissKeyboard() {
        scrollView.endEditing(true)
    }
    
    //Presses return key
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameUserTextField {
            nameUserTextField.becomeFirstResponder()
        } else if textField == ageUserTextField {
            ageUserTextField.becomeFirstResponder()
        } else if textField == weightUserTextField {
            weightUserTextField.becomeFirstResponder()
        } else if textField == heightUserTextField {
            heightUserTextField.becomeFirstResponder()
        }
        
        return true
    }
    
    func  loadAllUser(){
        getCheckUserTable = dbHelper.getCheckUser()
        if getCheckUserTable.count == 0 {
            return
        }
        getUserTable = dbHelper.getUser()
        if getUserTable.count == 0 {
            return
        }
        
        getBmiUser = (getUserTable[0].User_BMI!)
        
        if (getBmiUser! <= 18.5){
            showBmi = "ผอม"
            showImageViewBmi = UIImage(named: "bmi1.png")
        }else if (getBmiUser! < 22.9){
            showBmi = "ปกติ"
            showImageViewBmi = UIImage(named: "bmi2.png")
        }else if (getBmiUser! < 24.9){
            showBmi = "ท้วม"
             showImageViewBmi = UIImage(named: "bmi3.png")
        }else if (getBmiUser!  < 29.9){
            showBmi = "อ้วนปานกลาง"
            showImageViewBmi = UIImage(named: "bmi4.png")
        }else {
            showBmi = "อ้วน"
            showImageViewBmi = UIImage(named: "bmi5.png")
        }

        nameUserTextField.text = getUserTable[0].User_Name
        ageUserTextField.text = String(format: "%i",(getUserTable[0].User_Age)!)
        weightUserTextField.text = String(format: "%.02f",(getUserTable[0].User_Weight)!)
        heightUserTextField.text = String(format: "%i", (getUserTable[0].User_Height)!)
        bmiUserLabel.text = String(format: "%.02f", (getUserTable[0].User_BMI)!)
        bmrUserLabel.text = String(format: "%.02f", (getUserTable[0].User_BMR)!)
        showBmiUserLabel.text = showBmi
        showImageBmi.image = showImageViewBmi
        
        if getUserTable[0].User_Gender == "Male"{
            genderSegmentedControl.selectedSegmentIndex = 0
        } else {
            genderSegmentedControl.selectedSegmentIndex = 1
        }
        
        if getUserTable[0].User_Diabetes == "คนปกติ"{
            diabetesSegmentedControl.selectedSegmentIndex = 0
        } else {
            diabetesSegmentedControl.selectedSegmentIndex = 1
        }
        
    }


    @IBAction func selectGenderSegmented(_ sender: Any) {
        switch genderSegmentedControl.selectedSegmentIndex {
        case 0:
            genderName = "Male"
        case 1:
            genderName = "Female"
        default:
            break;
        }
        let genderSelect: String = genderList[genderSegmentedControl.selectedSegmentIndex]
        genderName = genderSelect
    }
    
    
    @IBAction func selectPeopleDiabetes(_ sender: Any) {
        switch diabetesSegmentedControl.selectedSegmentIndex {
        case 0:
            diabetesPeopleName = "คนปกติ"
        case 1:
            diabetesPeopleName = "เบาหวาน"
        default:
            break;
        }
        let diabetesPeopleSelect:String = diabetesPeopleList[diabetesSegmentedControl.selectedSegmentIndex]
        diabetesPeopleName = diabetesPeopleSelect
    }

    
    @IBAction func saveDataUserButton(_ sender: Any) {
        dismissKeyboard()
        let alertShow = UIAlertController (title: "ยืนยันการบันทึกข้อมูลผู้ใช้งาน", message:"คุณแน่ใจใช่ไหม" , preferredStyle: UIAlertControllerStyle.alert)
        alertShow.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler: { (action) in
            alertShow.dismiss(animated: true, completion: nil)
            self.insertHistoryTableUser()
            self.alertSaveData()
        }))
        
        alertShow.addAction(UIAlertAction(title: "ยกเลิก" , style: UIAlertActionStyle.default, handler: { (action) in
            alertShow.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alertShow,animated: true,completion: nil)
    }
    
    func insertHistoryTableUser()  {
        weigthUser = Double(weightUserTextField.text!)!
        heightUser = Double(heightUserTextField.text!)!
        bmiUser = ((weigthUser)! / (((heightUser)!/100)*2))
        ageUser = Double(ageUserTextField.text!)!
        
        if genderName == "Male"{
            bmrUser = 66 + (13.7 * (weigthUser)!) + (5 * (heightUser)!) - (6.8 * (ageUser)!)
        } else {
            bmrUser = 665 + (9.6 * (weigthUser)!) + (1.8 * (heightUser)!) - (4.7 * (ageUser)!)
        }
        
        let userResource = UserTable()
        userResource.User_Name = nameUserTextField.text
        userResource.User_Age = Int(ageUserTextField.text!)
        userResource.User_Weight = Double(weightUserTextField.text!)
        userResource.User_Height = Int(heightUserTextField.text!)
        userResource.User_BMI = Double(bmiUser!)
        userResource.User_BMR = Double(bmrUser!)
        userResource.User_Gender = genderName
        userResource.User_Diabetes = diabetesPeopleName
        dbHelper.insertUserTable(dataRowUserTable: userResource)

    }
    
    func alertSaveData(){
        let alertShowSave = UIAlertController (title: "บันทึกข้อมูลผู้ใช้งาน", message:" คุณได้บันทึกข้อมูลผู้ใช้งานสำเร็จ" , preferredStyle: UIAlertControllerStyle.alert)
        alertShowSave.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler:nil))
        self.present(alertShowSave, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadAllUser()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "ข้อมูลผู้ใช้งาน"
        self.tabBarController?.navigationItem.rightBarButtonItem = saveData
    }
    
}


