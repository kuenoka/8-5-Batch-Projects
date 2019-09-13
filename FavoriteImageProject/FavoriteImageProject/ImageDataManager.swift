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
  
  func getAllImages() -> [Image] {
    let fetchRequest: NSFetchRequest<Image> = Image.fetchRequest()
    let allImages = try? context.fetch(fetchRequest)
    return allImages ?? []
  }
  
  func save() {
    guard context.hasChanges else {return}
    try? context.save()
  }
  
  func favoriteImage( image: Image) {
    image.isFavorite = !image.isFavorite
    save()
  }
  
  func addImage( image: Image ) {
    context.insert(image)
    save()
  }
  
  func removeImage( image: Image) {
    context.delete(image)
    save()
  }
  
  func copyImage( image: Image) throws -> Image {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Image", in: context) else { throw CoreDataError.noSuchEntity }
    let newImage = Image(entity: entityDescription, insertInto: context)
    newImage.comments = image.comments
    newImage.likes = image.likes
    newImage.downloads = image.downloads
    newImage.isFavorite = image.isFavorite
    newImage.views = image.views
    newImage.previewURL = image.previewURL
    newImage.largeImageURL = image.largeImageURL
    return newImage
  }
}
