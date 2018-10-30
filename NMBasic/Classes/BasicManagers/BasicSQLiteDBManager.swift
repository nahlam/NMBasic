//
//  BasicSQLiteDBManager.swift
//  BasicFramework
//
//  Created by Nahla Mortada on 7/5/17.
//  Copyright © 2017 Nahla Mortada. All rights reserved.
//

import Foundation
import FMDB

open class BasicSQLiteDBManager: BasicManager {
    
    
    // MARK: - DB File Methods
    
    public class func copyDatabaseIntoDocumentsDirectory(databseFileName: String) {
        
        let paths: [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory: String = paths[0]
        let destinationPath: String = "\(documentsDirectory)/\(databseFileName)"
        DispatchQueue.global(qos: .background).async {
            
            if FileManager.default.fileExists(atPath: destinationPath) == false {
                let fileNameComponents = databseFileName.components(separatedBy: ".")
                if let sourcePath = Bundle.main.path(forResource: fileNameComponents[0], ofType: fileNameComponents[1]){
                    do {
                        (try FileManager.default.copyItem(atPath: sourcePath, toPath: destinationPath))
                        print("[DB]", "Move From: \(sourcePath)")
                        print("[DB]", "Move To: \(destinationPath)")
                    }
                    catch {
                        print("[DB]", "[BF] :   \(error.localizedDescription)")
                    }
                }else   {
                    print("[DB]", "sourcePath nil")
                }
            }
        }
        
    }
    
    public class func removeFile(databseFileName: String) {
        let paths: [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory: String = paths[0]
        let destinationPath: String = "\(documentsDirectory)/\(databseFileName)"
        DispatchQueue.global(qos: .background).async {
            
            if FileManager.default.fileExists(atPath: destinationPath) == false {
                do {
                    try FileManager.default.removeItem(atPath: destinationPath)
                }catch {
                    print("[DB]", "Could not clear temp folder: \(error)")
                }
            }
        }
    }
    
    public class func getDBHelber(dbName: String) -> FMDatabase {
        //TODOO
        var paths: [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory: String = paths[0]
        let databasePath: String = URL(fileURLWithPath: documentsDirectory).appendingPathComponent(dbName).absoluteString
        let helper: FMDatabase = FMDatabase(path: databasePath)
        if !helper.open() {
            print("[DB]", "[BF] :   CAAAAAN not opned")
        }
        return helper
    }
    
    fileprivate class func copyDatabaseIntoDocumentsDirectory(dbName: String) {
        copyDatabaseIntoDocumentsDirectory(databseFileName: dbName)
    }
    
    
    public class func selectAll(tableName: String)  -> String  {
        return "select * from \(tableName)"
    }
    
    
    // MARK: - Select Methods
    
    public class func getQueryObject(Id: Int, InTable tableName: String, primaryKey: String) -> String {
        return "select * from \(tableName) where \(primaryKey) = \(Id)"
    }
    
    public class func getQueryObjects(tableName: String) -> String {
        return "select * from \(tableName)"
    }
    
    
    // MARK: - Delete Methods
    
    public class func deleteQuery(tableName: String, Id itemId: Int, primaryKey: String) -> String {
        let query: String = "DELETE FROM \(tableName) WHERE \(primaryKey) = \(itemId)"
        return query
    }
    
    public class func deleteAllQuery(tableName: String) -> String {
        let query: String = "DELETE FROM \(tableName)"
        return query
    }
    
}
