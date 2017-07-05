//
//  foodViewController.swift
//  HappyHealthy
//
//  Created by eofficeair on 6/17/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

    @IBOutlet var foodSearchBar: UISearchBar!
    @IBOutlet var tableFood: UITableView!
    var getFoodTable = [FoodTable]()
    var dbHelper = DatabaseHelper()
    var dataFoodTable: FoodTable?
    //SearchBar
    var getSearchFood = [FoodTable]()
    var searchActive: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllFood()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadAllFood(){
        getFoodTable = dbHelper.getAllFood()
        tableFood.dataSource = self
        tableFood.delegate = self
        foodSearchBar.delegate = self
    
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
        getSearchFood = dbHelper.getSearchFood(word: searchText)
        self.tableFood.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return getSearchFood.count
        }
        return getFoodTable.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FoodTableViewCell
        if(searchActive){
            cell.FoodTableViewCell = getSearchFood[indexPath.row]
        }else {
           cell.FoodTableViewCell = getFoodTable[indexPath.row]
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(searchActive){
            dataFoodTable = (getSearchFood[indexPath.row] as? FoodTable)!
            self.performSegue(withIdentifier: "DetailFood", sender: nil)
        }else{
            dataFoodTable = (getFoodTable[indexPath.row] as? FoodTable)!
            self.performSegue(withIdentifier: "DetailFood", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailFood" {
            let vc = segue.destination as! ShowDetailFoodViewController
            vc.getFoodTable = dataFoodTable
        }
    }
}


