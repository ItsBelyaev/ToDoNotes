//
//  TodoModel.swift
//  ToDoNotes
//
//  Created by Daniil Belyaev on 18.06.2021.
//

import Foundation

//
//  TodoModel.swift
//  ToDoList
//
//  Created by Daniil Belyaev on 18.06.2021.
//
import RealmSwift

class Todo: Object {
    
    @objc dynamic var todo: String = ""
    
    let todoList = ["Buy milk", "Buy cheese", "Go to cinema"]
    
    func saveTodos() {
                
        for todo in todoList {
            let newTodo = Todo()
            newTodo.todo = todo
            
            StorageManager.saveObject(newTodo)
        }
    }
}
