//
//  StorageManager.swift
//  ToDoList
//
//  Created by Daniil Belyaev on 18.06.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ todo: Todo) {
        try! realm.write {
            realm.add(todo)
        }
    }
    static func deleteObject(_ todo: Todo) {
        try! realm.write {
            realm.delete(todo)
        }
    }
}
