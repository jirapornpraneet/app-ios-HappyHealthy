//
//  homeViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/14/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    var dbHelper = DatabaseHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
         dbHelper.getAllExercise()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
