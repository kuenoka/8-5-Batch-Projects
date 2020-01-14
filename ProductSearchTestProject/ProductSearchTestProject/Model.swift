//
//  Model.swift
//  ProductSearchTestProject
//
//  Created by MCS on 1/8/20.
//  Copyright © 2020 MCS. All rights reserved.
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
