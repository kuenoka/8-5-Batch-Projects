//
//  Clue+CoreDataClass.swift
//  JeopardyCoreDataProject
//
//  Created by MCS on 8/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Clue)
public class Clue: NSManagedObject , Codable {
    
    enum CodingKeys: String, CodingKey {
        case answer
        case question
        case airdate
        case createdAt = "created_at"
        case value
        case category
    }
    
    enum CategoryCodingKeys: String, CodingKey {
        case title
    }
    
    public convenience required init(from decoder: Decoder) throws {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Clue", in: ClueDataManager.shared.context) else { throw CoreDataError.noSuchEntity }
        self.init(entity: entityDescription, insertInto: nil)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let categoryContainer = try container.nestedContainer(keyedBy: CategoryCodingKeys.self, forKey: .category)
        answer = try container.decode(String.self, forKey: .answer)
        question = try container.decode(String.self, forKey: .question)
        airdate = try container.decode(String.self, forKey: .airdate)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        if let intValue = try container.decodeIfPresent(Int.self, forKey: .value) {
            value = NSNumber(integerLiteral: intValue)
        } else {
            value = nil
        }
        title = try categoryContainer.decode(String.self, forKey: .title)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var categoryContainer = container.nestedContainer(keyedBy: CategoryCodingKeys.self, forKey: .category)
        try container.encode(answer, forKey: .answer)
        try container.encode(question, forKey: .question)
        try container.encode(airdate, forKey: .airdate)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(value?.intValue, forKey: .value)
        try categoryContainer.encode(title, forKey: .title)
    }
}

enum CoreDataError: Error {
    case noSuchEntity
}
