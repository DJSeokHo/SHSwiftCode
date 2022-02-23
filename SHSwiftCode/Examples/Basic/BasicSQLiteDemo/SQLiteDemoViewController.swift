//
//  SQLiteDemoViewController.swift
//  SHSwiftTool
//
//  Created by Seok Ho on 2020/04/25.
//  Copyright © 2020 SWein. All rights reserved.
//

import UIKit
import SQLite3

class SQLiteDemoViewController: UIViewController {
    
    @IBAction func onButtonInsertClick(_ sender: Any) {

        let dataModel = DataModel(
            uuid: UUIDUtility.getUUID(),
            name: "ㅋㅋ",
            content: "ㅎㅎ",
            dateTime: DateUtility.getCurrentDateTimeStringWithStandardSQLiteDateTimeFromatter()
        )
        
        ILog.debug(tag: SQLiteDemoViewController.TAG, content: dataModel.toString())
        
        insert(dataModel: dataModel)
    }
    
    @IBAction func onButtonInsertArrayClick(_ sender: UIButton) {
        var dataModelArray: [DataModel]!
        
        dataModelArray = [DataModel]()
        
        for index in 0..<10 {
         let dataModel = DataModel(
             uuid:UUIDUtility.getUUID(),
             name: "name \(index)",
             content: "content \(index)",
             dateTime: DateUtility.getCurrentDateTimeStringWithStandardSQLiteDateTimeFromatter()
         )
         
         ILog.debug(tag: SQLiteDemoViewController.TAG, content: dataModel.toString())
         dataModelArray.append(dataModel)
        }

        insertArray(dataModelArray: dataModelArray)
    }
    
    @IBAction func onButtonUpdateClick(_ sender: UIButton) {
        
    }
    
    @IBAction func onButtonSelectClick(_ sender: UIButton) {
//        getAllData()
    }
    
    @IBAction func onButtonDeleteClick(_ sender: Any) {
        
    }
    
    @IBAction func onButtonCloseClick(_ sender: UIButton) {
        finish()
    }
    
    private static let TAG = "SQLiteDemoViewController"
    
    private var db: OpaquePointer!
    private var dbPath: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dbPath = fetchLibraryPath()
        db = openDatabase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createTable()
        
    }
    
    private func fetchLibraryPath() -> String {
        if let libraryPathString = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first {
            let pathURL = URL(fileURLWithPath: libraryPathString).appendingPathComponent("Test.sqlite")
            return pathURL.path
        }
        
        return ""
    }

    private func openDatabase() -> OpaquePointer? {
        
        if dbPath == "" {
            return nil
        }
        
        var db: OpaquePointer?
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
          
            ILog.debug(tag: SQLiteDemoViewController.TAG, content: "成功打开数据库，路径：\(dbPath ?? "")")
            return db
        }
        else {
             ILog.debug(tag: SQLiteDemoViewController.TAG, content: "打开数据库失败")
            return nil
        }
    }

    private func createTable() {
        
        let sql = """
            CREATE TABLE IF NOT EXISTS TEST (
            UUID TEXT NOT NULL PRIMARY KEY,
            NAME TEXT,
            CONTENT TEXT,
            DATETIME TEXT);
            """
        
        ILog.debug(tag: SQLiteDemoViewController.TAG, content: sql)
        
        // 1
        var createTableStatement: OpaquePointer?
       
        // 2
        if sqlite3_prepare_v2(db, sql, -1, &createTableStatement, nil) == SQLITE_OK {
        
            // 3
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: "成功创建表")
            }
            else {
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: "未成功创建表")
            }
        }
        else {
            ILog.debug(tag: SQLiteDemoViewController.TAG, content: "未成功创建表")
        }
       
        // 4
        sqlite3_finalize(createTableStatement)
    }

    // insert 字符串时，需要把字符串包装成NSString然后转utf-8字符串
    private func insert(dataModel: DataModel) {
        let sql = """
            INSERT INTO TEST (UUID, NAME, CONTENT, DATETIME) VALUES (?, ?, ?, ?);
            """
        
        var insertStatement: OpaquePointer?
            // 1
            if sqlite3_prepare_v2(db, sql, -1, &insertStatement, nil) == SQLITE_OK {
              
                // 2
                sqlite3_bind_text(insertStatement, 1, NSString(string: dataModel.uuid).utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 2, NSString(string: dataModel.name).utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 3, NSString(string: dataModel.content).utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 4, NSString(string: dataModel.dateTime).utf8String, -1, nil)
                
                // 3
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    ILog.debug(tag: SQLiteDemoViewController.TAG, content: "插入数据成功")
                }
                else {
                    ILog.debug(tag: SQLiteDemoViewController.TAG, content: "插入数据失败")
                }
            }
            else {
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: "插入数据失败")
            }
        
            // 4
            sqlite3_finalize(insertStatement)
    }
    
    private func insertArray(dataModelArray: [DataModel]) {
        
        let sql = """
        INSERT INTO TEST (UUID, NAME, CONTENT, DATETIME) VALUES (?, ?, ?, ?);
        """

        var insertStatement: OpaquePointer?
        // 1
        if sqlite3_prepare_v2(db, sql, -1, &insertStatement, nil) == SQLITE_OK {
            
           for dataModel in dataModelArray {
              
                // 2
                sqlite3_bind_text(insertStatement, 1, NSString(string: dataModel.uuid).utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 2, NSString(string: dataModel.name).utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 3, NSString(string: dataModel.content).utf8String, -1, nil)
                
                sqlite3_bind_text(insertStatement, 4, NSString(string: dataModel.dateTime).utf8String, -1, nil)
            
                // 3
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                     ILog.debug(tag: SQLiteDemoViewController.TAG, content: "插入数据成功")
                }
                else {
                    ILog.debug(tag: SQLiteDemoViewController.TAG, content: "插入数据失败")
                }
            
                // 4
                sqlite3_reset(insertStatement)
            }
        }
        else {
             ILog.debug(tag: SQLiteDemoViewController.TAG, content: "插入数据失败")
        }
        
        // 5
        sqlite3_finalize(insertStatement)

    }
    
    private func updateData() {
        let sql = """
            UPDATE TEST SET NAME = '???' WHERE UUID = ???;
            """
        var updateStatement: OpaquePointer?
        
        // 1
        if sqlite3_prepare_v2(db, sql, -1, &updateStatement, nil) == SQLITE_OK {
            
            // 2
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: "更新成功")
            }
            else {
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: "更新失败")
            }
        }
        else {
            ILog.debug(tag: SQLiteDemoViewController.TAG, content: "更新失败")
        }
        
        // 3
        sqlite3_finalize(updateStatement)
    }

    private func deleteData() {
        let sql = """
                   DELETE FROM Computer WHERE UUID = ????;
                   """

        var deleteStatement: OpaquePointer?
        
        // 1
        if sqlite3_prepare_v2(db, sql, -1, &deleteStatement, nil) == SQLITE_OK {
            
            // 2
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: "删除成功")
            
            }
            else {
               ILog.debug(tag: SQLiteDemoViewController.TAG, content: "删除失败")
           }
        }
        else {
            ILog.debug(tag: SQLiteDemoViewController.TAG, content: "删除失败")
        }
        
        // 3
        sqlite3_finalize(deleteStatement)
    }

    private func getAllData() -> [DataModel]! {
        
        var dataModelArray: [DataModel]
        dataModelArray = [DataModel]()
        
        let sql = """
            SELECT * FROM TEST;
            """
        
        var queryStatement: OpaquePointer?
        
        // 1
        if sqlite3_prepare_v2(db, sql, -1, &queryStatement, nil) == SQLITE_OK {
            
            // 2
            while(sqlite3_step(queryStatement) == SQLITE_ROW) {
                
                // 3
                let uuidCol = sqlite3_column_text(queryStatement, 0)
                let nameCol = sqlite3_column_text(queryStatement, 1)
                let contentCol = sqlite3_column_text(queryStatement, 2)
                let dateTimeCol = sqlite3_column_text(queryStatement, 3)
                
                let uuid = String(cString: uuidCol!)
                let name = String(cString: nameCol!)
                let content = String(cString: contentCol!)
                let dateTime = String(cString: dateTimeCol!)
                
                let dateModel = DataModel(uuid: uuid, name: name, content: content, dateTime: dateTime)
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: dateModel.toString())

                dataModelArray.append(dateModel)
            
            }
        }
        
        // 4
        sqlite3_finalize(queryStatement)
        
        return dataModelArray
    }

    func getData()  -> DataModel! {
        let sql = """
        SELECT * FROM TEST WHERE UUID == ????;
        """
       
        var queryStatement: OpaquePointer?
        
        // 1
        if sqlite3_prepare_v2(db, sql, -1, &queryStatement, nil) == SQLITE_OK {
            
            // 2
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                
                // 3
                let uuidCol = sqlite3_column_text(queryStatement, 0)
                let nameCol = sqlite3_column_text(queryStatement, 1)
                let contentCol = sqlite3_column_text(queryStatement, 2)
                let dateTimeCol = sqlite3_column_text(queryStatement, 3)
                
                let uuid = String(cString: uuidCol!)
                let name = String(cString: nameCol!)
                let content = String(cString: contentCol!)
                let dateTime = String(cString: dateTimeCol!)
                
                let dataModel = DataModel(uuid: uuid, name: name, content: content, dateTime: dateTime)
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: dataModel.toString())
                
                return dataModel
            }
            else {
                ILog.debug(tag: SQLiteDemoViewController.TAG, content: "查询失败")
            }
        }
        
        //第四步
        sqlite3_finalize(queryStatement)
        
        return nil
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
