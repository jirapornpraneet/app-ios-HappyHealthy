//
//  DatabaseHelper.swift
//  testSQLiteSwift2
//
//  Created by eofficeair on 6/16/2560 BE.
//  Copyright © 2560 bigdata. All rights reserved.
//

import GRDB

class DatabaseHelper {
    var dbQueue : DatabaseQueue = {
        var db : DatabaseQueue = DatabaseQueue ()
        do {
            db = try DatabaseQueue(path: Bundle.main.path(forResource: "HappyHealthy_Sqlite", ofType: "db")!)
        }
        catch{
            print(" Connect database fail !")
        }
        return db
    }()
    
    func getAllExercise() -> [exerciseModel]{
        var getExerciseModel = [exerciseModel]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from exercise "){
                    let rowExerciseModel = exerciseModel()
                      rowExerciseModel.Exercise_Id = row.value(named: "Exercise_Id") as Int
                      rowExerciseModel.Exercise_Name = row.value(named: "Exercise_Name") as String
                      rowExerciseModel.Exercise_Calories = row.value(named: "Exercise_Calories") as Double
                      rowExerciseModel.Exercise_Duration = row.value(named: "Exercise_Duration") as Double
                      rowExerciseModel.Exercise_Disease = row.value(named: "Exercise_Disease") as String
                      rowExerciseModel.Exercise_Detail  = row.value(named: "Exercise_Detail") as String
                      rowExerciseModel.Exercise_Description = row.value(named: "Exercise_Description") as String
                    
                    getExerciseModel .append(rowExerciseModel)
                }
            }
            catch {
                print("Get All Exercise Fail!!")
            }
        }
        return getExerciseModel
    }
    
    func getAllFood() -> [foodModel]{
        var getFoodModel = [foodModel]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from food "){
                    let rowFoodModel = foodModel()
                    rowFoodModel.Food_Id = row.value(named: "Food_Id") as Int
                    rowFoodModel.Food_Name = row.value(named: "Food_Name") as String
                    rowFoodModel.Food_Calories = row.value(named: "Food_Calories") as Double
                    rowFoodModel.Food_Unit = row.value(named: "Food_Unit") as String
                    rowFoodModel.Food_Netweight = row.value(named: "Food_Netweight") as Double
                    rowFoodModel.Food_NetUnit  = row.value(named: "Food_NetUnit") as String
                    rowFoodModel.Food_Protein = row.value(named: "Food_Protein") as Double
                    rowFoodModel.Food_Fat = row.value(named: "Food_Fat") as Double
                    rowFoodModel.Food_Carbohydrate = row.value(named: "Food_Carbohydrate") as Double
                    rowFoodModel.Food_Sugars = row.value(named: "Food_Sugars") as Double
                    rowFoodModel.Food_Sodium = row.value(named: "Food_Sodium") as Double
                    rowFoodModel.Food_Detail  = row.value(named: "Food_Detail") as String
              
                    getFoodModel .append(rowFoodModel)
                }
            }
            catch {
                print("Get All Exercise Fail!!")
            }
        }
        return getFoodModel
    }

    
    //Join
    /*func getAllHistoryExercise(Exercise_Id: Int) -> [exerciseHistoryModel] {
        var listHistoryExercise = [exerciseHistoryModel]()
        dbQueue.inDatabase { db in
            do{
                 for row in try Row.fetchAll(db, "select * from Exercise_History  Where Exercise_Id = \(Exercise_Id)" ) {
                    let newExerciseHistory = exerciseHistoryModel()
                    newExerciseHistory .History_Exercise_Id = row.value(named: "History_Exercise_Id") as Int
                    newExerciseHistory .History_Exercise_Date = row.value(named: "History_Exercise_Date") as String
                    newExerciseHistory .Exercise_Id = row.value(named: "Exercise_Id") as Int
                    newExerciseHistory .Exercise_TotalDuration = row.value(named: "Exercise_TotalDuration") as Double
                    
                    listHistoryExercise.append(newExerciseHistory)
             
            }
            } catch {
                print("get detail fail !!")
                
            }
                
            }
        
        return listHistoryExercise
    }*/

}
