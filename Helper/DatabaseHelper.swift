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
             

                print("Get All Exercise Fail!!")
            }
        }
        return getExerciseTable
    }
    
    func insertExerciseTable(dataRowExerciseTable: ExerciseTable) {
        try! dbQueue.inDatabase { db in
            do {
                try db.execute("INSERT INTO Exercise(Exercise_Name,Exercise_Calories,Exercise_Duration,Exercise_Disease,Exercise_Detail,Exercise_Description) VALUES (:Exercise_Name,:Exercise_Calories,:Exercise_Duration,:Exercise_Disease,:Exercise_Detail,:Exercise_Description)",
                               arguments: ["Exercise_Name":dataRowExerciseTable.Exercise_Name,"Exercise_Calories":dataRowExerciseTable.Exercise_Calories,"Exercise_Duration":dataRowExerciseTable.Exercise_Duration,"Exercise_Disease":dataRowExerciseTable.Exercise_Disease,"Exercise_Detail":dataRowExerciseTable.Exercise_Detail,"Exercise_Description":dataRowExerciseTable.Exercise_Description])
                print("Insert Exercise value")
            } catch let error as DatabaseError {
                
                print("Insert Exercise Fail!!")
                print(error)
            }
        }
        
        
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
    
    func getAllHistoryExercise(Exercise_Id: Int) -> [ExerciseHistoryTable] {
        var listHistoryExercise = [ExerciseHistoryTable]()
        dbQueue.inDatabase { db in
            do{
                for row in try Row.fetchAll(db, "select * from Exercise_History  Where Exercise_Id = \(Exercise_Id)" ) {
                    let rowExerciseHistory = ExerciseHistoryTable()
                    rowExerciseHistory.History_Exercise_Id = row.value(named: "History_Exercise_Id") as Int
                    rowExerciseHistory.History_Exercise_Date = row.value(named: "History_Exercise_Date") as String
                    rowExerciseHistory.Exercise_Id = row.value(named: "Exercise_Id") as Int
                    rowExerciseHistory.Exercise_TotalDuration = row.value(named: "Exercise_TotalDuration") as Double
                    listHistoryExercise.append(rowExerciseHistory)
                } } catch {
                    print("get detail fail !!")
            }
        }
        
        return listHistoryExercise
    }
    //select * from (select * from  Exercise_History  where  History_Exercise_Date  LIKE  "27-06-2560 15:23") eh,  Exercise  e  where eh. Exercise_Id = e.Exercise_Id

    
    func insertExerciseHistory(dataRowExerciseHistoryTable: ExerciseHistoryTable) {
        try! dbQueue.inDatabase { db in
            do {
                try db.execute("INSERT INTO Exercise_History (History_Exercise_Date,Exercise_Id,Exercise_TotalDuration) VALUES (:History_Exercise_Date,:Exercise_Id,:Exercise_TotalDuration)",
                               arguments: ["History_Exercise_Date":dataRowExerciseHistoryTable.History_Exercise_Date,"Exercise_Id":dataRowExerciseHistoryTable.Exercise_Id,"Exercise_TotalDuration":dataRowExerciseHistoryTable.Exercise_TotalDuration])
                print("Insert Exercise_History value")
            } catch let error as DatabaseError {
                print("Insert Exercise_History Fail!!")
            }
        }
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
            catch  {
                print("Get All Exercise Fail!!")
            }
        }
        return getFoodTable 
    }
    
    func insertFoodTable(dataRowFoodTable: FoodTable) {
        try! dbQueue.inDatabase { db in
            do {
                try db.execute("INSERT INTO Food (Food_Name,Food_Calories,Food_Amount,Food_Unit,Food_Netweight,Food_NetUnit,Food_Protein,Food_Fat,Food_Carbohydrate,Food_Sugars,Food_Sodium,Food_Detail) VALUES (:Food_Name,:Food_Calories,:Food_Amount,:Food_Unit,:Food_Netweight,:Food_NetUnit,:Food_Protein,:Food_Fat,:Food_Carbohydrate,:Food_Sugars,:Food_Sodium,:Food_Detail)",
                               arguments: ["Food_Name":dataRowFoodTable.Food_Name,"Food_Calories":dataRowFoodTable.Food_Calories,"Food_Amount":dataRowFoodTable.Food_Amount,"Food_Unit":dataRowFoodTable.Food_Unit,"Food_Netweight":dataRowFoodTable.Food_Netweight,"Food_NetUnit":dataRowFoodTable.Food_NetUnit,"Food_Protein":dataRowFoodTable.Food_Protein,"Food_Fat":dataRowFoodTable.Food_Fat,"Food_Carbohydrate":dataRowFoodTable.Food_Carbohydrate,"Food_Sugars":dataRowFoodTable.Food_Sugars,"Food_Sodium":dataRowFoodTable.Food_Sodium,"Food_Detail":dataRowFoodTable.Food_Detail])
                print("Insert Food value")
            } catch let error as DatabaseError {
                
                print("Insert Food Fail!!")
                print(error)
            }
        }
        
        
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

    func insertFoodHistory(dataRowFoodHistoryTable: FoodHistoryTable) {
        try! dbQueue.inDatabase { db in
            do {
                try db.execute("INSERT INTO Food_History (History_Food_Date,Food_Id,Food_TotalAmount) VALUES (:History_Food_Date,:Food_Id,:Food_TotalAmount)",
                               arguments: ["History_Food_Date":dataRowFoodHistoryTable.History_Food_Date,"Food_Id":dataRowFoodHistoryTable.Food_Id,"Food_TotalAmount":dataRowFoodHistoryTable.Food_TotalAmount])
                
                print("Insert FoodHistory value")
            } catch let error as DatabaseError {
                
                print("Insert FoodHistory Fail!!")
            }
        }
    }
    //select * from (select * from  Food_History  where   History_Food_Date  LIKE  "27-06-2560 15:23" ) fh, Food  f  where fh. Food_Id  = f.Food_Id
    
    func getDiabetes() -> [DiabetesTable]{
        var getDiabetesTable = [DiabetesTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT * ,MAX (D_Id) FROM Diabetes"){
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
    
    func insertDiabetesTable(dataRowDiabetesTable: DiabetesTable) {
        try! dbQueue.inDatabase { db in
            do {
                try db.execute("INSERT INTO Diabetes (D_DateTime,D_CostSugar,D_Level,D_Status,D_People) VALUES (:D_DateTime,:D_CostSugar,:D_Level,:D_Status,:D_People)",
                               arguments: ["D_DateTime":dataRowDiabetesTable.D_DateTime,"D_CostSugar":dataRowDiabetesTable.D_CostSugar,"D_Level":dataRowDiabetesTable.D_Level,"D_Status":dataRowDiabetesTable.D_Status,"D_People":dataRowDiabetesTable.D_People])
                
                print("Insert Diabetes value")
            } catch {
                
                
                print("Insert Diabetes Fail!!")
            }
        }
    }
    
    func getHistoryDiabetes() -> [DiabetesTable]{
        var getHistoryDiabetesTable = [DiabetesTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT * FROM Diabetes"){
                    let rowDiabetesTable = DiabetesTable()
                    rowDiabetesTable.D_Id = row.value(named: "D_Id") as Int
                    rowDiabetesTable.D_DateTime = row.value(named: "D_DateTime") as String
                    rowDiabetesTable.D_CostSugar = row.value(named: "D_CostSugar") as Int
                    rowDiabetesTable.D_Level = row.value(named: "D_Level") as String
                    rowDiabetesTable.D_Status = row.value(named: "D_Status") as String
                    rowDiabetesTable.D_People = row.value(named: "D_People") as String
                    getHistoryDiabetesTable.append(rowDiabetesTable)
                }
            }
            catch {
                print("Get All Diabetes Fail!!")
            }
        }
        return getHistoryDiabetesTable
    }


    func getKidney() -> [KidneyTable]{
        var getKidneyTable = [KidneyTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT * ,MAX (K_Id) FROM Kidney"){
                    let rowKidneyTable = KidneyTable()
                    rowKidneyTable.K_Id = row.value(named: "K_Id") as Int
                    rowKidneyTable.K_DateTime = row.value(named: "K_DateTime") as String
                    rowKidneyTable.K_CostGFR = row.value(named: "K_CostGFR") as Int
                    rowKidneyTable.K_LevelCostGFR = row.value(named: "K_LevelCostGFR") as String
                    getKidneyTable.append(rowKidneyTable)
                }
            }
            catch {
                print("Get All Kidney Fail!!")
            }
        }
        return getKidneyTable
    }
    
    func insertKidneyTable(dataRowKidneyTable: KidneyTable) {
        try! dbQueue.inDatabase { db in
            do {
                try db.execute("INSERT INTO Kidney (K_DateTime,K_CostGFR,K_LevelCostGFR) VALUES (:K_DateTime,:K_CostGFR,:K_LevelCostGFR)",
                               arguments: ["K_DateTime":dataRowKidneyTable.K_DateTime,"K_CostGFR":dataRowKidneyTable.K_CostGFR,"K_LevelCostGFR":dataRowKidneyTable.K_LevelCostGFR])
                
                print("Insert Kidney value")
            } catch let error as DatabaseError {
                
                print("Insert Kidney Fail!!")
            }
        }
    }
    
    func getHistoryKidney() -> [KidneyTable]{
        var getHistoryKidneyTable = [KidneyTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT * FROM Kidney"){
                    let rowKidneyTable = KidneyTable()
                    rowKidneyTable.K_Id = row.value(named: "K_Id") as Int
                    rowKidneyTable.K_DateTime = row.value(named: "K_DateTime") as String
                    rowKidneyTable.K_CostGFR = row.value(named: "K_CostGFR") as Int
                    rowKidneyTable.K_LevelCostGFR = row.value(named: "K_LevelCostGFR") as String
                    getHistoryKidneyTable.append(rowKidneyTable)
                }
            }
            catch {
                print("Get All Kidney Fail!!")
            }
        }
        return getHistoryKidneyTable
    }

    //    select * from ((select MAX (D_Id),* from Diabetes where  D_DateTime  LIKE "27-06-2560 15:23" ),
    //    (select MAX(K_Id),* from Kidney where   K_DateTime  LIKE  "27-06-2560 15:23"),
    //    (select MAX(P_Id ),* from Pressure  where  P_DateTime   LIKE  "27-06-2560 15:23" ))
    //"select * from (select MAX (D_Id),* from Diabetes where  D_DateTime LIKE '27-06-2560 15:23')"
    func getReportDiabetes(datedisease:String) -> [DiabetesTable]{
        var  getReportDiabetes = [DiabetesTable]()
        try! dbQueue.inDatabase { db in
            do {
                
                let qry = String(format: "select * from (select MAX (D_Id),* from Diabetes where  D_DateTime LIKE '%@')", datedisease)
                for row in try Row.fetchAll(db, qry){
                    let rowDiabetesTable = DiabetesTable()
                    rowDiabetesTable.D_DateTime = row.value(named: "D_DateTime") as String
                    rowDiabetesTable.D_CostSugar = row.value(named: "D_CostSugar") as Int
                    rowDiabetesTable.D_Level = row.value(named: "D_Level") as String
                    rowDiabetesTable.D_Status = row.value(named: "D_Status") as String
                    rowDiabetesTable.D_People = row.value(named: "D_People") as String
                    getReportDiabetes.append(rowDiabetesTable)
                }
            }
            catch let error as DatabaseError{
                print("Get ReportDiabetes Fail!!")
                print(error)
            }
        }
        return  getReportDiabetes
    }

    func getCheckReportDiabetes(datedisease:String) -> [DiabetesTable]{
        var getCheckReportDiabetes = [DiabetesTable]()
        try! dbQueue.inDatabase { db in
            do {
                
                let qry = String(format: "select * from Diabetes where D_DateTime LIKE '%@'", datedisease)
                for row in try Row.fetchAll(db, qry){
                    let rowDiabetesTable = DiabetesTable()
                    rowDiabetesTable.D_DateTime = row.value(named: "D_DateTime") as String
                    rowDiabetesTable.D_CostSugar = row.value(named: "D_CostSugar") as Int
                    rowDiabetesTable.D_Level = row.value(named: "D_Level") as String
                    rowDiabetesTable.D_Status = row.value(named: "D_Status") as String
                    rowDiabetesTable.D_People = row.value(named: "D_People") as String
                    getCheckReportDiabetes.append(rowDiabetesTable)
                }
            }
            catch let error as DatabaseError{
                print("Get ReportCheckDiabetes Fail!!")
                print(error)
            }
        }
        return  getCheckReportDiabetes
    }

    
    func getReportKidney(datedisease:String) -> [KidneyTable]{
        var  getReportKidney = [KidneyTable]()
        try! dbQueue.inDatabase { db in
            do {
                
                let qry = String(format: "select * from (select MAX (K_Id),* from Kidney where  K_DateTime LIKE '%@')", datedisease)
                for row in try Row.fetchAll(db, qry){
                    let rowKidneyTable = KidneyTable()
                    rowKidneyTable.K_DateTime = row.value(named: "K_DateTime") as String
                    rowKidneyTable.K_CostGFR = row.value(named: "K_CostGFR")as Int
                    rowKidneyTable.K_LevelCostGFR = row.value(named: "K_LevelCostGFR") as String
                    getReportKidney.append(rowKidneyTable)
                }
            }
            catch let error as DatabaseError{
                print("Get ReportHealth Fail!!")
                print(error)
            }
        }
        return  getReportKidney
    }

    func getCheckReportKidney(datedisease:String) -> [KidneyTable]{
        var  getCheckReportKidney = [KidneyTable]()
        try! dbQueue.inDatabase { db in
            do {
                
                let qry = String(format: "select * from Kidney where K_DateTime LIKE '%@'", datedisease)
                for row in try Row.fetchAll(db, qry){
                    let rowKidneyTable = KidneyTable()
                    rowKidneyTable.K_DateTime = row.value(named: "K_DateTime") as String
                    rowKidneyTable.K_CostGFR = row.value(named: "K_CostGFR")as Int
                    rowKidneyTable.K_LevelCostGFR = row.value(named: "K_LevelCostGFR") as String
                    getCheckReportKidney.append(rowKidneyTable)
                }
            }
            catch let error as DatabaseError{
                print("Get CheckReportKidneyHealth Fail!!")
                print(error)
            }
        }
        return  getCheckReportKidney
    }

    func getReportPressure(datedisease:String) -> [PressureTable]{
        var  getReportPressure = [PressureTable]()
        try! dbQueue.inDatabase { db in
            do {
                
                let qry = String(format: "select * from (select MAX (P_Id),* from Pressure where  P_DateTime LIKE '%@')", datedisease)
                for row in try Row.fetchAll(db, qry){
                    let rowPressureTable = PressureTable()
                    rowPressureTable.P_DateTime = row.value(named: "P_DateTime") as String
                    rowPressureTable.P_CostPressureTop = row.value(named: "P_CostPressureTop")as Int
                    rowPressureTable.P_CostPressureDown = row.value(named: "P_CostPressureDown") as Int
                    rowPressureTable.P_Pressure_Level = row.value(named: "P_Pressure_Level")as String
                    rowPressureTable.P_HeartRate = row.value(named: "P_HeartRate")as Int
                    rowPressureTable.P_HeartRate_Level = row.value(named: "P_HeartRate_Level") as String 
                    getReportPressure.append(rowPressureTable)
                }
            }
            catch let error as DatabaseError{
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
                
                
                print("Get ReportHealth Fail!!")
                print(error)
            }
        }
        return  getReportPressure
    }
    func getCheckReportPressure(datedisease:String) -> [PressureTable]{
        var  getCheckReportPressure = [PressureTable]()
        try! dbQueue.inDatabase { db in
            do {
                
                let qry = String(format: "select * from Pressure where P_DateTime LIKE '%@'", datedisease)
                for row in try Row.fetchAll(db, qry){
                    let rowPressureTable = PressureTable()
                    rowPressureTable.P_DateTime = row.value(named: "P_DateTime") as String
                    rowPressureTable.P_CostPressureTop = row.value(named: "P_CostPressureTop")as Int
                    rowPressureTable.P_CostPressureDown = row.value(named: "P_CostPressureDown") as Int
                    rowPressureTable.P_Pressure_Level = row.value(named: "P_Pressure_Level")as String
                    rowPressureTable.P_HeartRate = row.value(named: "P_HeartRate")as Int
                    rowPressureTable.P_HeartRate_Level = row.value(named: "P_HeartRate_Level") as String
                    getCheckReportPressure.append(rowPressureTable)
                }
            }
            catch let error as DatabaseError{
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
                
                
                print("Get ReportHealth Fail!!")
                print(error)
            }
        }
        return  getCheckReportPressure
    }

    func getPressure() -> [PressureTable]{
        var getPressureTable = [PressureTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT * ,MAX (P_Id) FROM Pressure"){
                    let rowPressureTable = PressureTable()
                    rowPressureTable.P_Id = row.value(named:"P_Id") as Int
                    rowPressureTable.P_DateTime = row.value(named:"P_DateTime") as String
                    rowPressureTable.P_CostPressureTop = row.value(named:"P_CostPressureTop") as Int
                    rowPressureTable.P_CostPressureDown = row.value(named:"P_CostPressureDown") as Int
                    rowPressureTable.P_Pressure_Level = row.value(named: "P_Pressure_Level") as String
                    rowPressureTable.P_HeartRate = row.value(named: "P_HeartRate") as Int
                    rowPressureTable.P_HeartRate_Level = row.value(named: "P_HeartRate_Level") as String
                    getPressureTable.append(rowPressureTable)
                }
            }
            catch {
                print("Get All Pressure Fail!!")
            }
        }
        return getPressureTable
    }
    
    func getHistoryPressure() -> [PressureTable]{
        var getHistoryPressureTable = [PressureTable]()
        dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT *  FROM Pressure"){
                    let rowPressureTable = PressureTable()
                    rowPressureTable.P_Id = row.value(named:"P_Id") as Int
                    rowPressureTable.P_DateTime = row.value(named:"P_DateTime") as String
                    rowPressureTable.P_CostPressureTop = row.value(named:"P_CostPressureTop") as Int
                    rowPressureTable.P_CostPressureDown = row.value(named:"P_CostPressureDown") as Int
                    rowPressureTable.P_Pressure_Level = row.value(named: "P_Pressure_Level") as String
                    rowPressureTable.P_HeartRate = row.value(named: "P_HeartRate") as Int
                    rowPressureTable.P_HeartRate_Level = row.value(named: "P_HeartRate_Level") as String
                    getHistoryPressureTable.append(rowPressureTable)
                }
            }
            catch {
                print("Get All Pressure Fail!!")
            }
        }
        return getHistoryPressureTable
    }
    
    
    func insertPressureTable(dataRowPressureTable: PressureTable) {
        try! dbQueue.inDatabase { db in
            do {
                try db.execute("INSERT INTO Pressure (P_DateTime,P_CostPressureTop,P_CostPressureDown,P_Pressure_Level,P_HeartRate,P_HeartRate_Level) VALUES (:P_DateTime,:P_CostPressureTop,:P_CostPressureDown,:P_Pressure_Level,:P_HeartRate,:P_HeartRate_Level)",
                               arguments: ["P_DateTime":dataRowPressureTable.P_DateTime,"P_CostPressureTop":dataRowPressureTable.P_CostPressureTop,"P_CostPressureDown":dataRowPressureTable.P_CostPressureDown,"P_Pressure_Level":dataRowPressureTable.P_Pressure_Level,"P_HeartRate":dataRowPressureTable.P_HeartRate,"P_HeartRate_Level":dataRowPressureTable.P_HeartRate_Level])
                
                print("Insert Pressure value")
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
                //  VALUES (?, ?)` arguments [1, "Bobby"]: FOREIGN KEY constraint failed"
                
                print("Insert Pressure Fail!!")
                print(error)
            }
        }
    }

    func getUser() -> [UserTable]{
        var getUserTable = [UserTable]()
        try! dbQueue.inDatabase { db in
            do {
                for row in try Row.fetchAll(db, "SELECT * ,MAX (User_Id)  FROM User"){
                    let rowUserTable = UserTable()
                    rowUserTable.User_Id = row.value(named: "User_Id") as Int
                    rowUserTable.User_Name = row.value(named: "User_Name") as String
                    rowUserTable.User_Gender = row.value(named: "User_Gender" ) as String
                    rowUserTable.User_Age = row.value(named: "User_Age") as Int
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
                //  VALUES (?, ?)` arguments [1, "Bobby"]: FOREIGN KEY constraint failed"
                print(error)
                print("Get All User Fail!!")
                
            }
        }
        return getUserTable
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
