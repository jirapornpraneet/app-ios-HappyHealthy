//
//  MenuViewController.swift
//  testSQLiteSwift2
//
//  Created by eofficeair on 6/16/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet var tableExercis: UITableView!
    @IBOutlet weak var exerciseSearchBar: UISearchBar!
    var getExerciseTable = [ExerciseTable]()
    var dbHelper = DatabaseHelper()
    var dataExerciseTable: ExerciseTable?
    //SearchBar
    var getSearchExercise = [ExerciseTable]()
    var searchActive: Bool = false

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
        exerciseSearchBar.delegate = self
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getSearchExercise = dbHelper.getSearchExercise(word: searchText)
        self.tableExercis.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchActive) {
            return getSearchExercise.count
        }
        return getExerciseTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ExerciseTableViewCell
        if (searchActive){
            cell.ExerciseTableViewCell = getSearchExercise[indexPath.row]
        }else{
        cell.ExerciseTableViewCell = getExerciseTable[indexPath.row]
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (searchActive) {
            dataExerciseTable = (getSearchExercise[indexPath.row] as? ExerciseTable)!
            self.performSegue(withIdentifier: "DetailExe", sender: nil)
        }else{
           dataExerciseTable = (getExerciseTable[indexPath.row] as? ExerciseTable)!
           self.performSegue(withIdentifier: "DetailExe", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailExe" {
            let vc = segue.destination as! ShowDetailExerciseViewController
            vc.getExerciseTable = dataExerciseTable
        }
    }
}


