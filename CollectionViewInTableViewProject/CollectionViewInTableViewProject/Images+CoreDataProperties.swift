//
//  Images+CoreDataProperties.swift
//  CollectionViewInTableViewProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData


extension Images {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Images> {
        return NSFetchRequest<Images>(entityName: "Images")
    }

    @NSManaged public var views: NSNumber
    @NSManaged public var downloads: NSNumber
    @NSManaged public var favorites: NSNumber
    @NSManaged public var imageURL: String?
    @NSManaged public var likes: NSNumber
    @NSManaged public var comments: NSNumber

}
