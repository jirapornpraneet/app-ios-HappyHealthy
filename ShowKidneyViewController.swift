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
    @IBOutlet var alertLevelGFRImage: UIImageView!
    @IBOutlet var lineAlertLevelKidneyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getKidneyTable = dbHelper.getKidney()
        let getCostGFR:Int? = (getKidneyTable[0].K_CostGFR!)
        
        if getCostGFR! >= 90 {
                    showKidneyLevelImage = UIImage(named: "textlevelkid1.png")
                    showLineKidneyLevelImage = UIImage(named: "prokid1.png")
        }else if getCostGFR! >= 60 && getCostGFR! < 90 {
                showKidneyLevelImage = UIImage(named: "textlevelkid2.png")
                showLineKidneyLevelImage = UIImage(named: "prokid2.png")
        }else if getCostGFR! >= 60 && getCostGFR! < 90 {
                showKidneyLevelImage = UIImage(named: "textlevelkid3.png")
                showLineKidneyLevelImage = UIImage(named: "prokid3.png")
        }else if getCostGFR! >= 60 && getCostGFR! < 90 {
                showKidneyLevelImage = UIImage(named: "textlevelkid4.png")
                showLineKidneyLevelImage = UIImage(named: "prokid4.png")
        }else{
            showKidneyLevelImage = UIImage(named: "textlevelkid5.png")
            showLineKidneyLevelImage = UIImage(named: "prokid5.png")

        }
    
        showDatetimeLabel.text = getKidneyTable[0].K_DateTime
        costGFRLabel.text = String(format: "%i",(getKidneyTable[0].K_CostGFR)!)
        alertLevelGFRImage.image = showKidneyLevelImage
        lineAlertLevelKidneyImage.image = showLineKidneyLevelImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
