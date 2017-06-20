//
//  MenuViewController.swift
//  testSQLiteSwift2
//
//  Created by eofficeair on 6/16/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableExercis: UITableView!
    var getExerciseTable = [ExerciseTable]()
    var dbHelper = DatabaseHelper()
    var dataExerciseTable: ExerciseTable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllExercise()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadAllExercise(){
        getExerciseTable = dbHelper.getAllExercise()
        tableExercis.dataSource = self
        tableExercis.delegate = self
    }
       
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getExerciseTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ExerciseTableViewCell
        cell.ExerciseTableViewCell = getExerciseTable[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataExerciseTable = (getExerciseTable[indexPath.row] as? ExerciseTable)!
        self.performSegue(withIdentifier: "DetailExe", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailExe" {
            let vc = segue.destination as! ShowDetailExerciseViewController
            vc.getExerciseTable = dataExerciseTable
        }

    }
}


