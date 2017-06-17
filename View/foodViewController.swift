//
//  foodViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class foodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableFood: UITableView!
    var getFoodModel = [foodModel]()
    var dbHelper = DatabaseHelper()
    var dataFoodModel: foodModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllFood()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAllFood(){
        getFoodModel = dbHelper.getAllFood()
        tableFood.dataSource = self
        tableFood.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getFoodModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! foodTableViewCell
        cell.foodTableViewCell = getFoodModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataFoodModel = (getFoodModel[indexPath.row] as? foodModel)!
        self.performSegue(withIdentifier: "DetailFood", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailFood" {
            let vc = segue.destination as! showDetailFoodViewController
            vc.getFoodModel = dataFoodModel
        }
        
    }
}


