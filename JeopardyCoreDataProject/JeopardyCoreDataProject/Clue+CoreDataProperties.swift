//
//  Clue+CoreDataProperties.swift
//  JeopardyCoreDataProject
//
//  Created by MCS on 8/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData


extension Clue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clue> {
        return NSFetchRequest<Clue>(entityName: "Clue")
    }

    @NSManaged public var answer: String
    @NSManaged public var question: String
    @NSManaged public var airdate: String
    @NSManaged public var createdAt: String
    @NSManaged public var value: NSNumber?
    @NSManaged public var title: String
    
}

//struct category: Category {
//    @NSManaged public var title: String
//}
