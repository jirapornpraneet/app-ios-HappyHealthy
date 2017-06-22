//
//  TestViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/21/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    var getUserTable = [UserTable]()
    var getUserRowMaxTable = [UserTable]()
    var insertDataUser = [UserTable]()
    var dbHelper = DatabaseHelper()
    var genderList: [String] = ["Male", "Female"]
    var genderName: String = ""
    var bmiUserArray: [String] = ["อ้วน","อ้วนปานกลาง","ท้วม","ปกติ","ผอม"]
    var bmiUser:String = ""
    var weigth:Double = 0
    var height:Int = 0
    var bmi:Double?
    
    @IBOutlet var weightUser: UITextField!
    @IBOutlet var heightUser: UITextField!
    @IBOutlet var showbmiUser: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllUser()
    }
    
    @IBAction func saveDataUser(_ sender: Any) {
         let userResource = UserTable()
        userResource.User_Weight = Double(weightUser.text!)
        userResource.User_Height = Int(heightUser.text!)
        userResource.User_BMI = (bmi)
        dbHelper.insertUserTable(dataRowUserTable: userResource)
        weigth = Double(weightUser.text!)!
        height = Int(heightUser.text!)!
        bmi = Double(weigth) + 2
        //showbmiUser.text = String(format: "%.2f", (getUserTable[0].User_BMI)!)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  loadAllUser(){
        getUserTable = dbHelper.getUser()
        //getUserRowMaxTable = dbHelper.getUserRowMax()
        
        if getUserTable.count == 0 {
            return
        }
        weightUser.text = String(format: "%.2f",(getUserTable[0].User_Weight)!)
        heightUser.text = String(format: "%i", (getUserTable[0].User_Height)!)
        showbmiUser.text = String(format: "%.2f", (getUserTable[0].User_BMI)!)
        
    }


}
