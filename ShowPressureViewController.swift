//
//  ShowPressureViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/23/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ShowPressureViewController: UIViewController {
    var getPressureTable = [PressureTable]()
    var dbHelper = DatabaseHelper()
    var showPressureLevelImage:UIImage?
    var showLinePressureLevelImage:UIImage?
    var showHeartLevelImage:UIImage?
    var showLineHeartLevelImage:UIImage?
    var costTop:Int?
    var costDown:Int?
    var imageTextLevelPre:[UIImage] = [UIImage(named: "textlevelpre1.png")!,UIImage(named: "textlevelpre2.png")!,UIImage(named: "textlevelpre3.png")!,UIImage(named: "textlevelpre4.png")!,UIImage(named: "textlevelpre5.png")!,UIImage(named: "textlevelpre6.png")!]
    var imageLineLevelPre:[UIImage] = [UIImage(named: "pre6.png")!,UIImage(named: "pre5.png")!,UIImage(named: "pre4.png")!,UIImage(named: "pre3.png")!,UIImage(named: "pre2.png")!,UIImage(named: "pre1.png")!]
    
    @IBOutlet var lineAlertLevelHeartImage: UIImageView!
    @IBOutlet var alertLevelHeartImage: UIImageView!
    @IBOutlet var costHeartLabel: UILabel!
    @IBOutlet var lineAlertLevelPressureImage: UIImageView!
    @IBOutlet var showDatetimeLabel: UILabel!
    @IBOutlet var costPressureTopLabel: UILabel!
    @IBOutlet var costPressureDownLabel: UILabel!
    @IBOutlet var alertLevelPressureImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllDataPressure()
      // Do any additional setup after loading the view.
    }
    
    func loadAllDataPressure(){
        getPressureTable = dbHelper.getPressure()
        
        let getCostHeart:Int? = (getPressureTable[0].P_HeartRate!)
        let getPressureTop:Int? = (getPressureTable[0].P_CostPressureTop!)
        let getPressureDown:Int? = (getPressureTable[0].P_CostPressureDown!)
        
        if getCostHeart! >= 101 {
            showHeartLevelImage  = UIImage(named: "textlevelheart5.png")
            showLineHeartLevelImage = UIImage(named: "proheart5.png")
        }else if getCostHeart!  >= 85 && getCostHeart!   < 101{
            showHeartLevelImage  = UIImage(named: "textlevelheart4.png")
            showLineHeartLevelImage = UIImage(named: "proheart4.png")
        }else if getCostHeart!  >= 70 && getCostHeart!  < 85 {
            showHeartLevelImage  = UIImage(named: "textlevelheart3.png")
            showLineHeartLevelImage = UIImage(named: "proheart3.png")
        }else if getCostHeart!  >= 60 && getCostHeart!   < 70 {
            showHeartLevelImage  = UIImage(named: "textlevelheart2.png")
            showLineHeartLevelImage = UIImage(named: "proheart2.png")
        }else if getCostHeart!  >= 41 && getCostHeart!   < 60 {
            showHeartLevelImage  = UIImage(named: "textlevelheart1.png")
            showLineHeartLevelImage = UIImage(named: "proheart1.png")
        }else{
            showHeartLevelImage  = UIImage(named: "textlevelheart5.png")
            showLineHeartLevelImage = UIImage(named: "proheart5.png")
        }
        
    
        if getPressureTop! >= 180 {
            costTop  = 0
        }else if getPressureTop! >= 160 && getPressureTop! < 180 {
            costTop  = 1
        }else if getPressureTop! >= 140 && getPressureTop! < 160 {
            costTop  = 2
        }else if getPressureTop! >= 130 && getPressureTop! < 140 {
            costTop  = 3
        }else if getPressureTop! >= 120 && getPressureTop! < 130 {
            costTop  = 4
        }else if getPressureTop! >= 90 && getPressureTop! < 120 {
            costTop  = 5
        }else{
            costTop  = 0
        }
        
        if getPressureDown! >= 110 {
            costDown  = 0
        }else if getPressureDown! >= 100 && getPressureDown! < 110 {
            costDown  = 1
        }else if getPressureDown! >= 90 && getPressureDown! < 100 {
            costDown  = 2
        }else if getPressureDown! >= 85 && getPressureDown! < 90 {
            costDown  = 3
        }else if getPressureDown! >= 80 && getPressureDown! < 85 {
            costDown  = 4
        }else if getPressureDown! >= 60 && getPressureDown! < 80 {
            costDown  = 5
        }else{
            costDown  = 0
        }
        
        if costTop! < costDown! {
            showPressureLevelImage = imageTextLevelPre[costTop!]
            showLinePressureLevelImage = imageLineLevelPre[costTop!]
        }else{
            showPressureLevelImage = imageTextLevelPre[costDown!]
            showLinePressureLevelImage = imageLineLevelPre[costDown!]
        }

        showDatetimeLabel.text = getPressureTable[0].P_DateTime
        costPressureTopLabel.text = String(format: "%i",(getPressureTable[0].P_CostPressureTop)!)
        costPressureDownLabel.text = String(format: "%i",(getPressureTable[0].P_CostPressureDown)!)
        costHeartLabel.text = String(format: "%i",(getPressureTable[0].P_HeartRate!))
        alertLevelPressureImage.image = showPressureLevelImage
        lineAlertLevelPressureImage.image = showLinePressureLevelImage
        alertLevelHeartImage.image = showHeartLevelImage
        lineAlertLevelHeartImage.image = showLineHeartLevelImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
