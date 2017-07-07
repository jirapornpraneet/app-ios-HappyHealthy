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

    @IBOutlet var lineAlertLevelDiabetesImage: UIImageView!
    @IBOutlet var showDatatimeLabel: UILabel!
    @IBOutlet var costSugarLabel: UILabel!
    @IBOutlet var alertLevelDiabetesImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDiabetesTable = dbHelper.getDiabetes()
        let getCostSuger:Int? = (getDiabetesTable[0].D_CostSugar!)
        let getStatus:String? = (getDiabetesTable[0].D_Status!)
        let getPeople:String? = (getDiabetesTable[0].D_People!)
        
        if getPeople == "คนปกติ" {
            if getStatus == "ก่อนอาหาร" {
                if getCostSuger! >= 126 {
                    showDiabetesLevelImage = UIImage(named: "textlevelnormal.png")
                    showLineDiabetesLevelImage = UIImage(named: "levelNormal1.png")
                }else if getCostSuger! >= 70 && getCostSuger! < 126{
                    showDiabetesLevelImage = UIImage(named: "textlevelnormal1.png")
                    showLineDiabetesLevelImage = UIImage(named: "levelNormal2.png")
                }else{
                    showDiabetesLevelImage = UIImage(named: "textlevelnormal1.png")
                    showLineDiabetesLevelImage = UIImage(named: "levelNormal1.png")
                }
                }else{
                    if getCostSuger! >= 200 {
                        showDiabetesLevelImage = UIImage(named: "textlevelnormal.png")
                        showLineDiabetesLevelImage = UIImage(named: "lol.png")
                    }else if getCostSuger! >= 70 && getCostSuger! < 200 {
                        showDiabetesLevelImage = UIImage(named: "textlevelnormal1.png")
                        showLineDiabetesLevelImage = UIImage(named: "lol1.png")
                    }else{
                        showDiabetesLevelImage = UIImage(named: "textlevelnormal2.png")
                        showLineDiabetesLevelImage = UIImage(named: "lol.png")
                }
            }
        }else{
            if getStatus == "ก่อนอาหาร" {
             if getCostSuger! >= 130 {
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes1.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes4.png")
            }else if getCostSuger! >= 100 && getCostSuger! < 130{
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes5.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes3.png")
            }else if getCostSuger! >= 90 && getCostSuger! < 100{
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes4.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes2.png")
            }else if getCostSuger! >= 70 && getCostSuger! < 90{
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes3.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes1.png")
            }else{
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes2.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes4.png")
            }
        }else{
            if getCostSuger! >= 180{
            showDiabetesLevelImage = UIImage(named: "textLevelDiabetes1.png")
            showLineDiabetesLevelImage = UIImage(named: "levelDiabetes4.png")
            }else if getCostSuger! >= 150 && getCostSuger! < 180{
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes5.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes3.png")
            }else if getCostSuger! >= 110 && getCostSuger! < 150{
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes4.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes2.png")
            }else if getCostSuger! >= 70 && getCostSuger! < 110{
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes3.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes1.png")
            }else{
                showDiabetesLevelImage = UIImage(named: "textLevelDiabetes2.png")
                showLineDiabetesLevelImage = UIImage(named: "levelDiabetes4.png")
                }
            }
        }
        showDatatimeLabel.text = getDiabetesTable[0].D_DateTime
        costSugarLabel.text = String(format: "%i",(getDiabetesTable[0].D_CostSugar)!)
        alertLevelDiabetesImage.image = showDiabetesLevelImage
        lineAlertLevelDiabetesImage.image = showLineDiabetesLevelImage

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
