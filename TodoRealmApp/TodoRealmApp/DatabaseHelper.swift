//
//  DatabaseHelper.swift
//  TodoRealmApp
//
//  Created by Mobarak on 3/31/22.
//

import Foundation
import RealmSwift

class DatabaseHelper{
    
    static let shared = DatabaseHelper()
    
    let realm = try! Realm()
    
    func getDatabaseUrl() -> URL? {
        
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    func saveTodo(_ todo : Todo) {
        
        try! realm.write{
            realm.add(todo)
        }
        
    }
    
    func updateTodo(_ oldTodo: Todo,_ newTodo : Todo) {
        
        try! realm.write{
            oldTodo.title = newTodo.title
            oldTodo.desc = newTodo.desc
        }
        
    }
    
    func deleteTodo(_ todo : Todo) {
        
        try! realm.write{
            realm.delete(todo)
        }
        
    }
    
    func getAllTodos() -> [Todo] {
        
        return Array(realm.objects(Todo.self))
        
    }
}
