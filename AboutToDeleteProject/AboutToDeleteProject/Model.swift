//
//  Model.swift
//  AboutToDeleteProject
//
//  Created by MCS on 12/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct SearchProduct: Codable {
  let findItemsByKeywordsResponse: [FindItemsByKeywordsResponse]
}

struct FindItemsByKeywordsResponse: Codable {
  let searchResult: [SearchResult]
}

struct SearchResult: Codable {
  let item: [Item]
}

struct Item: Codable {
  let title: [String]
  let galleryURL: [String]
}
