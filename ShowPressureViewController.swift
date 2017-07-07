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
    var imageTextLevelPre:[UIImage] = [UIImage(named: "textlevelPressure1.png")!,UIImage(named: "textlevelPressure2.png")!,UIImage(named: "textlevelPressure3.png")!,UIImage(named: "textlevelPressure4.png")!,UIImage(named: "textlevelPressure5.png")!,UIImage(named: "textlevelPressure6.png")!]
    var imageLineLevelPre:[UIImage] = [UIImage(named: "levelPressure6.png")!,UIImage(named: "levelPressure5.png")!,UIImage(named: "levelPressure4.png")!,UIImage(named: "levelPressure3.png")!,UIImage(named: "levelPressure2.png")!,UIImage(named: "levelPressure1.png")!]
    
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
            showHeartLevelImage  = UIImage(named: "textlevelHeart5.png")
            showLineHeartLevelImage = UIImage(named: "levelHeart5.png")
        }else if getCostHeart!  >= 85 && getCostHeart!   < 101{
            showHeartLevelImage  = UIImage(named: "textlevelHeart4.png")
            showLineHeartLevelImage = UIImage(named: "levelHeart4.png")
        }else if getCostHeart!  >= 70 && getCostHeart!  < 85 {
            showHeartLevelImage  = UIImage(named: "textlevelHeart3.png")
            showLineHeartLevelImage = UIImage(named: "levelHeart3.png")
        }else if getCostHeart!  >= 60 && getCostHeart!   < 70 {
            showHeartLevelImage  = UIImage(named: "textlevelHeart2.png")
            showLineHeartLevelImage = UIImage(named: "levelHeart2.png")
        }else if getCostHeart!  >= 41 && getCostHeart!   < 60 {
            showHeartLevelImage  = UIImage(named: "textlevelHeart1.png")
            showLineHeartLevelImage = UIImage(named: "levelHeart1.png")
        }else{
            showHeartLevelImage  = UIImage(named: "textlevelHeart5.png")
            showLineHeartLevelImage = UIImage(named: "levelHeart5.png")
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
