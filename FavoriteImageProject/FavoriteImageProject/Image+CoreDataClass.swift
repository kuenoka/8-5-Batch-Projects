//
//  Image+CoreDataClass.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Image)
public class Image: NSManagedObject, Decodable {
  
  enum ImageCodingKeys: String, CodingKey {
    case views
    case downloads
    case likes
    case comments
    case largeImageURL
    case previewURL
  }
  
  public convenience required init(from decoder: Decoder) throws {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Image", in: ImageDataManager.shared.context) else { throw CoreDataError.noSuchEntity }
    self.init(entity: entityDescription, insertInto: ImageDataManager.shared.context)
    let imageContainer = try decoder.container(keyedBy: ImageCodingKeys.self)
    
    if let viewsValue = try imageContainer.decodeIfPresent(Int.self, forKey: .views) {
      views = NSNumber(integerLiteral: viewsValue)
    }
    if let downloadsValue = try imageContainer.decodeIfPresent(Int.self, forKey: .downloads) {
      downloads = NSNumber(integerLiteral: downloadsValue)
    }
    if let commentsValue = try imageContainer.decodeIfPresent(Int.self, forKey: .comments) {
      comments = NSNumber(integerLiteral: commentsValue)
    }
    if let likesValue = try imageContainer.decodeIfPresent(Int.self, forKey: .likes) {
      likes = NSNumber(integerLiteral: likesValue)
    }
    largeImageURL = try imageContainer.decode(String.self, forKey: .largeImageURL)
    previewURL = try imageContainer.decode(String.self, forKey: .previewURL)
    isFavorite = false
  }
}

enum CoreDataError: Error {
  case noSuchEntity
}
