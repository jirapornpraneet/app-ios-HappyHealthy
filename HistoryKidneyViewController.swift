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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHistoryKidneyTable = dbHelper.getHistoryKidney()
        HistoryKidneyTableView.dataSource = self
        HistoryKidneyTableView.dataSource = self

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
    
}
