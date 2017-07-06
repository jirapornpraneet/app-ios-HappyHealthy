//
//  HistoryPressureViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/26/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class HistoryPressureViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var HistoryPressureTableView: UITableView!
    var getHistoryPressureTable = [PressureTable]()
    var dbHelper = DatabaseHelper()
    var dataPressureTable:PressureTable?
    var deleteHistory = [PressureTable]()
    var deleteId:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHistoryPressureTable = dbHelper.getHistoryPressure()
        HistoryPressureTableView.dataSource = self
        HistoryPressureTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getHistoryPressureTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "CellHistoryPressure") as! HistoryPressureTableViewCell
        cell.HistoryPressureTableViewCell = getHistoryPressureTable[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        getHistoryPressureTable = dbHelper.getHistoryPressure()
        deleteId = getHistoryPressureTable[indexPath.row].P_Id
        if editingStyle == .delete {
            deleteHistory = dbHelper.deleteHistoryPressure(P_Id: deleteId!)
            getHistoryPressureTable = dbHelper.getHistoryPressure()
            HistoryPressureTableView.reloadData()
        }
    }
}
