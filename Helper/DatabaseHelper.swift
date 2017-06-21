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
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
            let databasePath = documentsPath.appendingPathComponent("HappyHealthy_Sqlite.db")
            
            let filemanager = FileManager.default
            print("", try? filemanager.contentsOfDirectory(atPath: documentsPath as String))

            db = try DatabaseQueue(path: databasePath)
        }
        catch{
            print(" Connect database fail !")
        }
        return db
    }()
    
    func getAllExercise() -> [ExerciseTable]{
        var getExerciseTable = [ExerciseTable]()
        try! dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from exercise"){
                    let rowExerciseTable = ExerciseTable()
                      rowExerciseTable.Exercise_Id = row.value(named: "Exercise_Id") as Int
                      rowExerciseTable.Exercise_Name = row.value(named: "Exercise_Name") as String
                      rowExerciseTable.Exercise_Calories = row.value(named: "Exercise_Calories") as Double
                      rowExerciseTable.Exercise_Duration = row.value(named: "Exercise_Duration") as Double
                      rowExerciseTable.Exercise_Disease = row.value(named: "Exercise_Disease") as String
                      rowExerciseTable.Exercise_Detail  = row.value(named: "Exercise_Detail") as String
                      rowExerciseTable.Exercise_Description = row.value(named: "Exercise_Description") as String
                    
                    getExerciseTable.append(rowExerciseTable)
                }
            } catch let error as DatabaseError {
                // The SQLite error code: 19 (SQLITE_CONSTRAINT)
                error.resultCode
                
                // The extended error code: 787 (SQLITE_CONSTRAINT_FOREIGNKEY)
                error.extendedResultCode
                
                // The eventual SQLite message: FOREIGN KEY constraint failed
                error.message
                
                // The eventual erroneous SQL query
                // "INSERT INTO pets (masterId, name) VALUES (?, ?)"
                error.sql
                
                // Full error description:
                // "SQLite error 787 with statement `INSERT INTO pets (masterId, name)
                //  VALUES (?, ?)` arguments [1, "Bobby"]: FOREIGN KEY constraint failed""

                print("Get All Exercise Fail!!")
            }
        }
        return getExerciseTable
    }
    
    func getExerciseHistory() -> [ExerciseHistoryTable]{
        var getExerciseHistoryTable = [ExerciseHistoryTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from Exercise_History "){
                    let rowExerciseHistoryTable = ExerciseHistoryTable()
                    rowExerciseHistoryTable.History_Exercise_Id = row.value(named: "History_Exercise_Id") as Int
                    rowExerciseHistoryTable.History_Exercise_Date = row.value(named: "History_Exercise_Date") as String
                    rowExerciseHistoryTable.Exercise_Id = row.value(named: "Exercise_Id") as Int
                    rowExerciseHistoryTable.Exercise_TotalDuration = row.value(named: "Exercise_TotalDuration") as Double
                    
                    getExerciseHistoryTable.append(rowExerciseHistoryTable)
                }
            }
            catch {
                print("Get All Exercise Fail!!")
            }
        }
        return getExerciseHistoryTable
    }
    
    func getAllFood() -> [FoodTable]{
        var getFoodTable = [FoodTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from food "){
                    let rowFoodTable = FoodTable()
                    rowFoodTable.Food_Id = row.value(named: "Food_Id") as Int
                    rowFoodTable.Food_Name = row.value(named: "Food_Name") as String
                    rowFoodTable.Food_Calories = row.value(named: "Food_Calories") as Double
                    rowFoodTable.Food_Unit = row.value(named: "Food_Unit") as String
                    rowFoodTable.Food_Netweight = row.value(named: "Food_Netweight") as Double
                    rowFoodTable.Food_NetUnit  = row.value(named: "Food_NetUnit") as String
                    rowFoodTable.Food_Protein = row.value(named: "Food_Protein") as Double
                    rowFoodTable.Food_Fat = row.value(named: "Food_Fat") as Double
                    rowFoodTable.Food_Carbohydrate = row.value(named: "Food_Carbohydrate") as Double
                    rowFoodTable.Food_Sugars = row.value(named: "Food_Sugars") as Double
                    rowFoodTable.Food_Sodium = row.value(named: "Food_Sodium") as Double
                    rowFoodTable.Food_Detail  = row.value(named: "Food_Detail") as String
              
                    getFoodTable .append(rowFoodTable)
                }
            }
            catch {
                print("Get All Exercise Fail!!")
            }
        }
        return getFoodTable 
    }

    func getFoodHistory() -> [FoodHistoryTable]{
        var getFoodHistoryTable = [FoodHistoryTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from Food_History"){
                    let rowFoodHistoryTable = FoodHistoryTable()
                    rowFoodHistoryTable.History_Food_Id = row.value(named: "History_Food_Id") as Int
                    rowFoodHistoryTable.History_Food_Date = row.value(named: "History_Food_Date") as String
                    rowFoodHistoryTable.Food_Id = row.value(named: "Food_Id") as Int
                    rowFoodHistoryTable.Food_TotalAmount = row.value(named: "Food_TotalAmount") as Double
                    getFoodHistoryTable.append(rowFoodHistoryTable)
                }
            }
            catch {
                print("Get All Exercise Fail!!")
            }
        }
        return getFoodHistoryTable
    }

    func getDiabetes() -> [DiabetesTable]{
        var getDiabetesTable = [DiabetesTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from Diabetes"){
                    let rowDiabetesTable = DiabetesTable()
                    rowDiabetesTable.D_Id = row.value(named: "D_Id") as Int
                    rowDiabetesTable.D_DateTime = row.value(named: "D_DateTime") as String
                    rowDiabetesTable.D_CostSugar = row.value(named: "D_CostSugar") as Int
                    rowDiabetesTable.D_Level = row.value(named: "D_Level") as String
                    rowDiabetesTable.D_Status = row.value(named: "D_Status") as String
                    rowDiabetesTable.D_People = row.value(named: "D_People") as String
                    getDiabetesTable.append(rowDiabetesTable)
                }
            }
            catch {
                print("Get All Exercise Fail!!")
            }
        }
        return getDiabetesTable
    }
    
    func getKidney() -> [KidneyTable]{
        var getKidneyTable = [KidneyTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from Kidney"){
                    let rowKidneyTable = KidneyTable()
                    rowKidneyTable.K_Id = row.value(named: "K_Id") as Int
                    rowKidneyTable.K_DateTime = row.value(named: "K_DateTime") as String
                    rowKidneyTable.K_CostGFR = row.value(named: "K_CostGFR") as Int
                    rowKidneyTable.K_LevelCostGFR = row.value(named: "K_LevelCostGFR") as String
                    getKidneyTable.append(rowKidneyTable)
                    
                }
            }
            catch {
                print("Get All Exercise Fail!!")
            }
        }
        return getKidneyTable
    }
 
    func getPressure() -> [PressureTable]{
        var getPressureTable = [PressureTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "select * from Pressure"){
                    let rowPressureTable = PressureTable()
                    rowPressureTable.P_Id = row.value(named: "P_Id") as Int
                    rowPressureTable.P_DateTime = row.value(named: "P_DateTime") as String
                    rowPressureTable.P_CostPressureTop = row.value(named: "P_CostPressureTop") as Int
                    rowPressureTable.P_CostPressureDown = row.value(named: "P_CostPressureDown") as Int
                    rowPressureTable.P_Cost_Level_Down = row.value(named: "P_Cost_Level_Down") as String
                    rowPressureTable.P_Cost_Level_Top = row.value(named: "P_Cost_Level_Top") as String
                    rowPressureTable.P_HeartRate = row.value(named: "P_HeartRate") as Int
                    rowPressureTable.P_HeartRate_Level = row.value(named: "P_HeartRate_Level") as String
                    getPressureTable.append(rowPressureTable)
                }
            }
            catch {
                print("Get All Exercise Fail!!")
            }
        }
        return getPressureTable
    }
    
    func getUser() -> [UserTable]{
        var getUserTable = [UserTable]()
        try! dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT * FROM User"){
                    let rowUserTable = UserTable()
                    rowUserTable.User_Id = row.value(named: "User_Id") as Int
                    rowUserTable.User_Name = row.value(named: "User_Name") as String
                    rowUserTable.User_Gender = row.value(named: "User_Gender" ) as String
                    rowUserTable.User_Age = row.value(named: "User_Age") as String
                    rowUserTable.User_Weight = row.value(named: "User_Weight" ) as Double
                    rowUserTable.User_Height = row.value(named: "User_Height") as Int
                    rowUserTable.User_BMI = row.value(named: "User_BMI") as Double
                    rowUserTable.User_BMR = row.value(named: "User_BMR") as Double
                    getUserTable.append(rowUserTable)
                }
            }
            catch let error as DatabaseError {
                
                // The SQLite error code: 19 (SQLITE_CONSTRAINT)
                error.resultCode
                
                // The extended error code: 787 (SQLITE_CONSTRAINT_FOREIGNKEY)
                error.extendedResultCode
                
                // The eventual SQLite message: FOREIGN KEY constraint failed
                error.message
                
                // The eventual erroneous SQL query
                // "INSERT INTO pets (masterId, name) VALUES (?, ?)"
                error.sql
                
                // Full error description:
                // "SQLite error 787 with statement `INSERT INTO pets (masterId, name)
                //  VALUES (?, ?)` arguments [1, "Bobby"]: FOREIGN KEY constraint failed""

                
                print("Get All User Fail!!")
            }
        }
        return getUserTable
    }

    func getUserRowMax() -> [UserTable]{
        var getUserRowMaxTable = [UserTable]()
        try! dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT * ,MAX (User_Id) FROM User"){
                    let rowUserTable = UserTable()
                    rowUserTable.User_Id = row.value(named: "User_Id") as Int
                    rowUserTable.User_Name = row.value(named: "User_Name") as String
                    rowUserTable.User_Gender = row.value(named: "User_Gender" ) as String
                    rowUserTable.User_Age = row.value(named: "User_Age") as String
                    rowUserTable.User_Weight = row.value(named: "User_Weight" ) as Double
                    rowUserTable.User_Height = row.value(named: "User_Height") as Int
                    rowUserTable.User_BMI = row.value(named: "User_BMI") as Double
                    rowUserTable.User_BMR = row.value(named: "User_BMR") as Double
                    getUserRowMaxTable.append(rowUserTable)
                }
            }
            catch let error as DatabaseError {
                
                // The SQLite error code: 19 (SQLITE_CONSTRAINT)
                error.resultCode
                
                // The extended error code: 787 (SQLITE_CONSTRAINT_FOREIGNKEY)
                error.extendedResultCode
                
                // The eventual SQLite message: FOREIGN KEY constraint failed
                error.message
                
                // The eventual erroneous SQL query
                // "INSERT INTO pets (masterId, name) VALUES (?, ?)"
                error.sql
                
                // Full error description:
                // "SQLite error 787 with statement `INSERT INTO pets (masterId, name)
                //  VALUES (?, ?)` arguments [1, "Bobby"]: FOREIGN KEY constraint failed""

            
                print("Get All User Fail!!")
            }
        }
        return getUserRowMaxTable
    }
    
    func insertUserTable(dataRowUserTable: UserTable) {
        try! dbQueue.inDatabase { db in
            do {
                try db.execute("INSERT INTO User (User_Name,User_Gender,User_Age,User_Weight,User_Height,User_BMI,User_BMR) VALUES (:User_Name,:User_Gender,:User_Age,:User_Weight,:User_Height,:User_BMI,:User_BMR)",
                               arguments: ["User_Name": dataRowUserTable.User_Name,"User_Gender": dataRowUserTable.User_Gender,"User_Age": dataRowUserTable.User_Age,"User_Weight":dataRowUserTable.User_Weight,"User_Height": dataRowUserTable.User_Height,"User_BMI": dataRowUserTable.User_BMI,"User_BMR": dataRowUserTable.User_BMR])
                print("Insert value")
            } catch let error as DatabaseError {
                
            print("Insert User Fail!!")
            }
        }
        

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
