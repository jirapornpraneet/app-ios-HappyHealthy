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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHistoryPressureTable = dbHelper.getHistoryPressure()
        HistoryPressureTableView.dataSource = self
        HistoryPressureTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
}
