//
//  ShowKidneyViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/23/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ShowKidneyViewController: UIViewController {
    var getKidneyTable = [KidneyTable]()
    var dbHelper = DatabaseHelper()
    var showKidneyLevelImage:UIImage?
    var showLineKidneyLevelImage:UIImage?

    @IBOutlet var showDatetimeLabel: UILabel!
    @IBOutlet var costGFRLabel: UILabel!
    @IBOutlet var levelKidneyLabel: UILabel!
    @IBOutlet var alertLevelGFRImage: UIImageView!
    @IBOutlet var lineAlertLevelKidneyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelKidneyLabel.layer.masksToBounds = true
        levelKidneyLabel.layer.cornerRadius = 8
        levelKidneyLabel.textColor = UIColor.white
        costGFRLabel.layer.masksToBounds = true
        costGFRLabel.layer.cornerRadius = 8
        getKidneyTable = dbHelper.getKidney()
        let getCostGFR:Int? = (getKidneyTable[0].K_CostGFR!)
        
        if getCostGFR! >= 90 {
            showKidneyLevelImage = nil
            levelKidneyLabel.backgroundColor = UIColor(red:0.50, green:0.93, blue:0.05, alpha:1.0)
            showLineKidneyLevelImage = UIImage(named: "levelKidney1.png")
        }else if getCostGFR! >= 60 && getCostGFR! < 90 {
            showKidneyLevelImage = nil
            showLineKidneyLevelImage = UIImage(named: "levelKidney2.png")
            levelKidneyLabel.backgroundColor = UIColor(red:0.95, green:0.84, blue:0.35, alpha:1.0)
        }else if getCostGFR! >= 30 && getCostGFR! < 60 {
            showKidneyLevelImage = nil
            showLineKidneyLevelImage = UIImage(named: "levelKidney3.png")
            levelKidneyLabel.backgroundColor = UIColor(red:0.93, green:0.70, blue:0.58, alpha:1.0)
        }else if getCostGFR! >= 15 && getCostGFR! < 30 {
            showKidneyLevelImage = nil
            showLineKidneyLevelImage = UIImage(named: "levelKidney4.png")
            levelKidneyLabel.backgroundColor = UIColor(red:0.92, green:0.55, blue:0.39, alpha:1.0)
        }else{
            showKidneyLevelImage = UIImage(named: "warning.png")
            showLineKidneyLevelImage = UIImage(named: "levelKidney5.png")
            levelKidneyLabel.backgroundColor = UIColor(red:0.96, green:0.28, blue:0.28, alpha:1.0)
        }
        
            
        showDatetimeLabel.text = getKidneyTable[0].K_DateTime
        costGFRLabel.text = String(format: "%i",(getKidneyTable[0].K_CostGFR)!)
        alertLevelGFRImage.image = showKidneyLevelImage
        lineAlertLevelKidneyImage.image = showLineKidneyLevelImage
        levelKidneyLabel.text = getKidneyTable[0].K_LevelCostGFR
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
