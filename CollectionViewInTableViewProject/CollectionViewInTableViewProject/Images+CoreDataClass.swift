//
//  Images+CoreDataClass.swift
//  CollectionViewInTableViewProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Images)
public class Images: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case hits
    }
    
    enum ImageCodingKeys: String, CodingKey {
        case views
        case downloads
        case favorites
        case likes
        case comments
        case imageURL
    }
    
    public convenience required init (from decoder: Decoder) throws {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Images", in: ImageDataManager.shared.context) else { throw CoreDataError.noSuchEntity }
        self.init(entity: entityDescription, insertInto: nil)
            
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let imageContainer = try container.nestedContainer(keyedBy: ImageCodingKeys.self, forKey: .hits)
        if let viewsValue = try imageContainer.decodeIfPresent(Int.self, forKey: .views) {
            views = NSNumber(integerLiteral: viewsValue)
        }
        if let downloadsValue = try imageContainer.decodeIfPresent(Int.self, forKey: .downloads) {
            downloads = NSNumber(integerLiteral: downloadsValue)
        }
        if let favoritesValue = try imageContainer.decodeIfPresent(Int.self, forKey: .favorites) {
            favorites = NSNumber(integerLiteral: favoritesValue)
        }
        if let likesValue = try imageContainer.decodeIfPresent(Int.self, forKey: .likes) {
            likes = NSNumber(integerLiteral: likesValue)
        }
        if let commentsValue = try imageContainer.decodeIfPresent(Int.self, forKey: .comments) {
            comments = NSNumber(integerLiteral: commentsValue)
        }
        imageURL = try imageContainer.decode(String.self, forKey: .imageURL)
    }
}

enum CoreDataError: Error {
    case noSuchEntity
}
