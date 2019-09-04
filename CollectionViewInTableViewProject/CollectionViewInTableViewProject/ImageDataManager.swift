//
//  ImageDataManager.swift
//  CollectionViewInTableViewProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class ImageDataManager {
    static let shared = ImageDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyModel")
        container.loadPersistentStores { (_, _) in }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    private init() { }
    
//    func getAllPokemon() -> [Pokemon] {
//        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
//        let allPokemon = try? context.fetch(fetchRequest)
//        return allPokemon ?? []
//    }
}
