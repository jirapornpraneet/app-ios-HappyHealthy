//
//  ShowDiabetesViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/22/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ShowDiabetesViewController: UIViewController {
    var getDiabetesTable = [DiabetesTable]()
    var dbHelper = DatabaseHelper()
    var showDiabetesLevelImage:UIImage?
    var showLineDiabetesLevelImage:UIImage?
    var getUserTable = [UserTable]()

    @IBOutlet var lineAlertLevelDiabetesImage: UIImageView!
    @IBOutlet var showDatatimeLabel: UILabel!
    @IBOutlet var costSugarLabel: UILabel!
    @IBOutlet var levelDiabetesLabel: UILabel!
    @IBOutlet var alertLevelDiabetesImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelDiabetesLabel.layer.masksToBounds = true
        levelDiabetesLabel.layer.cornerRadius = 8
        levelDiabetesLabel.textColor = UIColor.white
        costSugarLabel.layer.masksToBounds = true
        costSugarLabel.layer.cornerRadius = 8
        getDiabetesTable = dbHelper.getDiabetes()
        let getCostSuger:Int? = (getDiabetesTable[0].D_CostSugar!)
        let getStatus:String? = (getDiabetesTable[0].D_Status!)
        getUserTable = dbHelper.getUser()
        let getPeople:String? = (getUserTable[0].User_Diabetes!)
        
        if getPeople == "คนปกติ" {
            if getStatus == "ก่อนอาหาร" {
                if getCostSuger! >= 126 {
                    showDiabetesLevelImage = UIImage(named: "warning.png")
                    showLineDiabetesLevelImage = UIImage(named: "levelNormal1.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }else if getCostSuger! >= 70 && getCostSuger! < 126{
                    showDiabetesLevelImage = nil
                    showLineDiabetesLevelImage = UIImage(named: "levelNormal2.png")
                     levelDiabetesLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
                }else{
                    showDiabetesLevelImage = UIImage(named: "warning.png")
                    showLineDiabetesLevelImage = UIImage(named: "levelNormal1.png")
                    levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }
                }else{
                    if getCostSuger! >= 200 {
                        showDiabetesLevelImage = UIImage(named: "warning.png")
                        showLineDiabetesLevelImage = UIImage(named: "levelNormal1.png")
                        levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                    }else if getCostSuger! >= 70 && getCostSuger! < 200 {
                        showDiabetesLevelImage = nil
                        showLineDiabetesLevelImage = UIImage(named: "levelNormal2.png")
                        levelDiabetesLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
                    }else{
                        showDiabetesLevelImage = UIImage(named: "warning.png")
                        showLineDiabetesLevelImage = UIImage(named: "levelNormal1.png")
                        levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }
            }
        }else{
            if getStatus == "ก่อนอาหาร" {
             if getCostSuger! >= 130 {
                showDiabetesLevelImage = UIImage(named: "warning.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes4.png")
                  levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
            }else if getCostSuger! >= 100 && getCostSuger! < 130{
                showDiabetesLevelImage = nil
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes3.png")
                levelDiabetesLabel.backgroundColor = UIColor(red:0.92, green:0.55, blue:0.39, alpha:1.0)
            }else if getCostSuger! >= 90 && getCostSuger! < 100{
                showDiabetesLevelImage = nil
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes2.png")
                levelDiabetesLabel.backgroundColor = UIColor(red:0.95, green:0.84, blue:0.35, alpha:1.0)
            }else if getCostSuger! >= 70 && getCostSuger! < 90{
                showDiabetesLevelImage = nil
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes1.png")
                levelDiabetesLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
            }else{
                showDiabetesLevelImage = nil
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes4.png")
                levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
            }
        }else{
            if getCostSuger! >= 180{
            showDiabetesLevelImage = UIImage(named: "warning.png")
            showLineDiabetesLevelImage = UIImage(named: "levelDiabetes4.png")
                 levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
            }else if getCostSuger! >= 150 && getCostSuger! < 180{
                showDiabetesLevelImage = nil
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes3.png")
                levelDiabetesLabel.backgroundColor = UIColor(red:0.92, green:0.55, blue:0.39, alpha:1.0)
            }else if getCostSuger! >= 110 && getCostSuger! < 150{
                showDiabetesLevelImage = nil
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes2.png")
                levelDiabetesLabel.backgroundColor = UIColor(red:0.95, green:0.84, blue:0.35, alpha:1.0)
            }else if getCostSuger! >= 70 && getCostSuger! < 110{
                showDiabetesLevelImage = nil
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes1.png")
                levelDiabetesLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
            }else{
                showDiabetesLevelImage = nil
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes4.png")
                levelDiabetesLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
                }
            }
        }
        showDatatimeLabel.text = getDiabetesTable[0].D_DateTime
        costSugarLabel.text = String(format: "%i",(getDiabetesTable[0].D_CostSugar)!)
        alertLevelDiabetesImage.image = showDiabetesLevelImage
        lineAlertLevelDiabetesImage.image = showLineDiabetesLevelImage
        levelDiabetesLabel.text = getDiabetesTable[0].D_Level

    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
