//
//  HistoryDiabetesViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/26/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class HistoryDiabetesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var HistoryDiabetesTableView: UITableView!
    var getHistoryDiabetesTable = [DiabetesTable]()
    var dbHelper = DatabaseHelper()
    var dataDiabetesTable:DiabetesTable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHistoryDiabetesTable = dbHelper.getHistoryDiabetes()
        HistoryDiabetesTableView.dataSource = self
        HistoryDiabetesTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getHistoryDiabetesTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "CellHistoryDiabetes") as! HistoryDiabetesTableViewCell
        cell.HistoryDiabetesTableViewCell = getHistoryDiabetesTable[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
