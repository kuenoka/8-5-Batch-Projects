//
//  ClueDataManager.swift
//  JeopardyCoreDataProject
//
//  Created by MCS on 8/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class ClueDataManager {
    static let shared = ClueDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ClueDataModel")
        container.loadPersistentStores { (_, _) in }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() { }
    
    func getAllClues() -> [Clue] {
        let fetchRequest: NSFetchRequest<Clue> = Clue.fetchRequest()
        let allClues = try? context.fetch(fetchRequest)
        return allClues ?? []
    }
    
    func save() {
        guard context.hasChanges else {return}
        try? context.save()
    }
    
    func addClue(answer: String, question: String, airdate: String, createdAt: String, value: NSNumber, title: String) throws -> Clue {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Clue", in: context) else { throw CoreDataError.noSuchEntity}
        let newClue = Clue(entity: entityDescription, insertInto: context)
        newClue.airdate = airdate
        newClue.answer = answer
        newClue.createdAt = createdAt
        newClue.title = title
        newClue.value = value
        newClue.question = question
        return newClue
    }
    
    /*func addFavorite(answer: String, question: String, airdate: String, createdAt: String, value: NSNumber, title: String) throws -> Favorite {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Clue", in: context) else { throw CoreDataError.noSuchEntity}
        let newClue = Clue(entity: entityDescription, insertInto: context)
        newClue.airdate = airdate
        newClue.answer = answer
        newClue.createdAt = createdAt
        newClue.title = title
        newClue.value = value
        newClue.question = question
        return newClue
    }*/
    
    
    
    /*
    func addObject<T: NSManagedObject>(ofType: T) throws -> T {
        guard let entityDescription = NSEntityDescription.entity(
            forEntityName: String(describing: T.self),
            in: context)
            else { throw CoreDataError.noSuchEntity }
        let newObject = T(entity: entityDescription, insertInto: context)
        return newObject
    }*/

}
