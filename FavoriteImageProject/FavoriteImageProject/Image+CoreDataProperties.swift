//
//  Image+CoreDataProperties.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
    return NSFetchRequest<Image>(entityName: "Image")
  }
  
  @NSManaged public var views: NSNumber?
  @NSManaged public var downloads: NSNumber?
  @NSManaged public var likes: NSNumber?
  @NSManaged public var comments: NSNumber?
  @NSManaged public var largeImageURL: String?
  @NSManaged public var previewURL: String?
  @NSManaged public var isFavorite: Bool
}
