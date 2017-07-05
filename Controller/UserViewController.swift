//
//  userViewController.swift
//  testSQLiteSwift2
//
//  Created by eofficeair on 6/19/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITextFieldDelegate{
    var getUserTable = [UserTable]()
    var getCheckUserTable = [UserTable]()
    var insertDataUser = [UserTable]()
    var dbHelper = DatabaseHelper()
    var genderList: [String] = ["Male", "Female"]
    var genderName: String = ""
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameUserTextField.text = ""
        self.ageUserTextField.text = ""
        self.weightUserTextField.text = ""
        self.heightUserTextField.text = ""
        //set the delegate
        self.nameUserTextField.delegate = self
        self.ageUserTextField.delegate = self
        self.weightUserTextField.delegate = self
        self.heightUserTextField.delegate = self
        //genderUser
        let genderSelect: String = self.genderList[self.genderSegmentedControl.selectedSegmentIndex]
        genderName = genderSelect

    }
    
    
       func  loadAllUser(){
        
        getCheckUserTable = dbHelper.getCheckUser()
        if getCheckUserTable.count == 0 {
            return
        }
        getUserTable = dbHelper.getUser()
       // getUserRowMaxTable = dbHelper.getUserRowMax()
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
        
        let genderSelect: String = self.genderList[self.genderSegmentedControl.selectedSegmentIndex]
        genderName = genderSelect
    }


    @IBAction func saveDataUserButton(_ sender: Any) {
        //ShowAlertController
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
        dbHelper.insertUserTable(dataRowUserTable: userResource)

    }
    
    func alertSaveData(){
        //ShowAlertController
        let alertShowSave = UIAlertController (title: "บันทึกข้อมูลผู้ใช้งาน", message:" คุณได้บันทึกข้อมูลผู้ใช้งานสำเร็จ" , preferredStyle: UIAlertControllerStyle.alert)
        alertShowSave.addAction(UIAlertAction(title: "บันทึก" , style: UIAlertActionStyle.default, handler:nil))
        self.present(alertShowSave, animated: true, completion: nil)
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
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadAllUser()
        self.tabBarController?.navigationItem.title = "ข้อมูลผู้ใช้งาน"
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "ข้อมูลผู้ใช้งาน"
        self.tabBarController?.navigationItem.rightBarButtonItem = saveData     }
    
}


