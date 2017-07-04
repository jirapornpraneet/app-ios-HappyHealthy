//
//  listFoodHistoryViewController.swift
//  HappyHealthy
//
//  Created by Jiraporn Praneet on 7/4/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class listFoodHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
//    var getFoodTable: FoodTable?
    var dbHelper = DatabaseHelper()
    var getlistFoodHistory = [ListFoodHistory]()
    var dataListFoodHistoryTable: ListFoodHistory?


    @IBOutlet weak var listHistoryFoodTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllListHistoryFood()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAllListHistoryFood() {
        getlistFoodHistory = dbHelper.getListHistoryFood()
        listHistoryFoodTable.dataSource = self
        listHistoryFoodTable.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getlistFoodHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! DetailFoodHistoryTableViewCell
        cell.DetailFoodHistoryTableViewCell = getlistFoodHistory[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataListFoodHistoryTable = (getlistFoodHistory[indexPath.row] as? ListFoodHistory)!
        self.performSegue(withIdentifier: "DetailHistoryFood", sender: nil)
    }
    
    }
