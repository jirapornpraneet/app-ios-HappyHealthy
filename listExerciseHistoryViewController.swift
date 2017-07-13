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
    var deleteHistory = [ListExerciseHistory]()
    var deleteId:Int?
//    let notificationNameExercise = Notification.Name("NotificationIdentifierExercise")
    

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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        getlistExerciseHistory = dbHelper.getListHistoryExercise(dateHistory: senderDate!)
        deleteId = getlistExerciseHistory[indexPath.row].History_Exercise_Id
        if editingStyle == .delete {
            deleteHistory = dbHelper.deleteHistoryExercise(History_Exercise_Id: deleteId!)
            getlistExerciseHistory = dbHelper.getListHistoryExercise(dateHistory: senderDate!)
            listHistoryExerciseTable.reloadData()
//            NotificationCenter.default.post(name: notificationNameExercise, object: nil)
        }
    }
}
