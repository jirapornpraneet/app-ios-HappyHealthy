//
//  listExerciseHistoryViewController.swift
//  HappyHealthy
//
//  Created by Jiraporn Praneet on 7/4/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class listExerciseHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var senderDate:String?
    var dbHelper = DatabaseHelper()
    var getlistExerciseHistory = [ListExerciseHistory]()
    var dataListExerciseHistoryTable: ListExerciseHistory?

    @IBOutlet weak var listHistoryExerciseTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllListHistoryExercise()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadAllListHistoryExercise() {
        getlistExerciseHistory = dbHelper.getListHistoryExercise(dateHistory: senderDate!)
        listHistoryExerciseTable.dataSource = self
        listHistoryExerciseTable.delegate = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getlistExerciseHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! DetailExerciseHistoryTableViewCell
        cell.DetailExerciseHistoryTableViewCell = getlistExerciseHistory[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataListExerciseHistoryTable = (getlistExerciseHistory[indexPath.row] as? ListExerciseHistory)!
        self.performSegue(withIdentifier: "DetailHistoryExercise", sender: nil)
    }

}
