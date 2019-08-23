//
//  JokeDataManager.swift
//  JokesAPICallsProject
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class JokeDataManager {
    static let shared = JokeDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JokeModel")
        container.loadPersistentStores { (_, _) in }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() { }
    
    func getAllJokes() -> [Joke] {
        let fetchRequest: NSFetchRequest<Joke> = Joke.fetchRequest()
        let allJokes = try? context.fetch(fetchRequest)
        return allJokes ?? []
    }
    
    func save() {
        guard context.hasChanges else {return}
        try? context.save()
    }
    
}
