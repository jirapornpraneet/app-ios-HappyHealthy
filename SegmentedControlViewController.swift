//
//  SegmentedControlViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/20/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class SegmentedControlViewController: UIViewController {
     var getUserTable = [UserTable]()
    // var getUserRowMaxTable = [UserTable]()
     var insertDataUser = [UserTable]()
     var dbHelper = DatabaseHelper()
     var genderList: [String] = ["Male", "Female"]
     var genderName: String = ""
    @IBOutlet var saveGender: UIButton!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    @IBOutlet var showGender: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getUserTable = dbHelper.getUser()
//        //getUserRowMaxTable = dbHelper.getUserRowMax()
//        if getUserTable.count == 0 {
//            return
//        }
        //let genderName: String = self.genderList[self.genderSegmentedControl.selectedSegmentIndex]
        showGender.text = genderName
//        loadAllDataUser()
    }
    
//    func loadAllDataUser() {
//        getUserTable = dbHelper.getUser()
//        //getUserRowMaxTable = dbHelper.getUserRowMax()
//        if getUserTable.count == 0 {
//            return
//        }
//        showGender.text = getUserTable[0].User_Gender
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedSaveGender(_ sender: Any) {
       let userResource = UserTable()
      // let genderName: String = self.genderList[self.genderSegmentedControl.selectedSegmentIndex]
        userResource.User_Gender = genderName
      dbHelper.insertUserTable(dataRowUserTable: userResource)
    }
    
    @IBAction func selectGenderSegmented(_ sender: Any) {
        let genderSelect: String = self.genderList[self.genderSegmentedControl.selectedSegmentIndex]
        genderName = genderSelect
        showGender.text = genderName
               /* switch genderSegmentedControl.selectedSegmentIndex {
        case 0:
            selectGender = "man"
        
        case 1:
           selectGender  = "Woman"
             //showGenderLabel.text = selectGender

        default:
            break
        }*/
        }
    }


