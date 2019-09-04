//
//  ImageDataManager.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class ImageDataManager {
    static let shared = ImageDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ImageModel")
        container.loadPersistentStores { (_, _) in }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() { }
    
    
}
