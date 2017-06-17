//
//  MenuViewController.swift
//  testSQLiteSwift2
//
//  Created by eofficeair on 6/16/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class exerciseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableExercis: UITableView!
    var getExerciseModel = [exerciseModel]()
    var dbHelper = DatabaseHelper()
    var dataExerciseModel: exerciseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllExercise()
       

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadAllExercise(){
        getExerciseModel = dbHelper.getAllExercise()
        tableExercis.dataSource = self
        tableExercis.delegate = self
    }
       
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getExerciseModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! exerciseTableViewCell
        cell.exerciseTableViewCell = getExerciseModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataExerciseModel = (getExerciseModel[indexPath.row] as? exerciseModel)!
        self.performSegue(withIdentifier: "DetailExe", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailExe" {
            let vc = segue.destination as! showDetailExerciseViewController
            vc.getExerciseModel = dataExerciseModel
        }

    }
}


