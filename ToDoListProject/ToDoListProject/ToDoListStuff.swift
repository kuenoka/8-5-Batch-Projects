//
//  ToDoListStuff.swift
//  ToDoListProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class ToDoListStuff {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoListModel")
        container.loadPersistentStores(completionHandler: {(description, error) in
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func addToDoItem( name: String) throws -> ToDoItem {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "ToDoItem", in: context) else { throw CoreDataError.noSuchEntity}
        let newToDoItem = ToDoItem(entity: entityDescription, insertInto: context)
        newToDoItem.name = name
        return newToDoItem
    }
    
    func getToDoList() -> [ToDoItem] {
        let fetchRequest = NSFetchRequest<ToDoItem>(entityName: "ToDoItem")
        let toDoItem = try? context.fetch(fetchRequest)
        return toDoItem ?? []
    }
    
    func save() {
        guard context.hasChanges else {return}
        try? context.save()
    }
    
    func removeItem(item: ToDoItem){
        context.delete(item)
        save()
    }
}

enum CoreDataError: Error {
    case noSuchEntity
}
