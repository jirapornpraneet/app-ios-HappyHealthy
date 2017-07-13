//
//  listFoodHistoryViewController.swift
//  HappyHealthy
//
//  Created by Jiraporn Praneet on 7/4/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class listFoodHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var senderDate:String?
    var dbHelper = DatabaseHelper()
    var getlistFoodHistory = [ListFoodHistory]()
    var dataListFoodHistoryTable: ListFoodHistory?
    var deleteHistory = [ListFoodHistory]()
    var deleteId:Int?
  
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
        getlistFoodHistory = dbHelper.getListHistoryFood(dateHistory: senderDate!)
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
        
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
          getlistFoodHistory = dbHelper.getListHistoryFood(dateHistory: senderDate!)
          deleteId = getlistFoodHistory[indexPath.row].History_Food_Id
        if editingStyle == .delete {
            deleteHistory = dbHelper.deleteHistoryFood(History_Food_Id: deleteId!)
            getlistFoodHistory = dbHelper.getListHistoryFood(dateHistory: senderDate!)
            listHistoryFoodTable.reloadData()
        }
    }
   
}
