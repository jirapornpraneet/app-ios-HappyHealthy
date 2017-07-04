//
//  foodViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

    @IBOutlet var foodSearchBar: UISearchBar!
    @IBOutlet var tableFood: UITableView!
    var getFoodTable = [FoodTable]()
    var dbHelper = DatabaseHelper()
    var dataFoodTable: FoodTable?
    var FilteredFood = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllFood()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadAllFood(){
        getFoodTable = dbHelper.getAllFood()
        tableFood.dataSource = self
        tableFood.delegate = self
        foodSearchBar.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return getFoodTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FoodTableViewCell
           cell.FoodTableViewCell = getFoodTable[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataFoodTable = (getFoodTable[indexPath.row] as? FoodTable)!
        self.performSegue(withIdentifier: "DetailFood", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailFood" {
            let vc = segue.destination as! ShowDetailFoodViewController
            vc.getFoodTable = dataFoodTable
        }
    }
}


