//
//  HistoryKidneyViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/26/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class HistoryKidneyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var HistoryKidneyTableView: UITableView!
    var getHistoryKidneyTable = [KidneyTable]()
    var dbHelper = DatabaseHelper()
    var dataKidneyTable:KidneyTable?
    var deleteHistory = [KidneyTable]()
    var idKidney:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHistoryKidneyTable = dbHelper.getHistoryKidney()
        HistoryKidneyTableView.dataSource = self
        HistoryKidneyTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getHistoryKidneyTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "CellHistoryKidney") as! HistoryKidneyTableViewCell
        cell.HistoryKidneyTableViewCell = getHistoryKidneyTable[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        getHistoryKidneyTable = dbHelper.getHistoryKidney()
        deleteHistory = dbHelper.deleteHistoryKidney(K_Id: idKidney!)
        if editingStyle == .delete {
            self.deleteHistory.remove(at: indexPath.row)
            //Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
            
        }
    }
    
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let itemToMove = getHistoryKidneyTable[fromIndexPath.row]
        getHistoryKidneyTable.remove(at: fromIndexPath.row)
        getHistoryKidneyTable.insert(itemToMove, at: toIndexPath.row)
    }
}
