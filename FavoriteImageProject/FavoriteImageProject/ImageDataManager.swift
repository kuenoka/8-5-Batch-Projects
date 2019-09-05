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
  
  func addImage(comments: NSNumber, downloads: NSNumber, largeImageURL: String, likes: NSNumber, previewURL: String, views: NSNumber, isFavorite: Bool) throws -> Image {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Image", in: context) else { throw CoreDataError.noSuchEntity}
    let newImage = Image(entity: entityDescription, insertInto: context)
    newImage.comments = comments
    newImage.downloads = downloads
    newImage.largeImageURL = largeImageURL
    newImage.likes = likes
    newImage.previewURL = previewURL
    newImage.views = views
    newImage.isFavorite = isFavorite
    return newImage
  }
  
  func removeImage(image: Image){
    context.delete(image)
    save()
  }
  
  func copyTheTwoImages( originalImage: Image) throws -> Image {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Image", in: context) else { throw CoreDataError.noSuchEntity}
    let copy = Image(entity: entityDescription, insertInto: context)
    copy.comments = originalImage.comments
    copy.downloads = originalImage.downloads
    copy.largeImageURL = originalImage.largeImageURL
    copy.likes = originalImage.likes
    copy.previewURL = originalImage.previewURL
    copy.views = originalImage.views
    copy.isFavorite = originalImage.isFavorite
    
    return copy
  }
}
