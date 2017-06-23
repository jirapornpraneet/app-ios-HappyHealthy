//
//  ShowPressureViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/23/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ShowPressureViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
