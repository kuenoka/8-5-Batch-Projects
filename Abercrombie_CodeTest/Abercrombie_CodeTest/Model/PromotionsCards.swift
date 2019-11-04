//
//  PromotionsCards.swift
//  Abercrombie_CodeTest
//
//  Created by MCS on 9/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct PromotionCard: Codable, Equatable {
  static func == (lhs: PromotionCard, rhs: PromotionCard) -> Bool {
    return lhs.backgroundImage == rhs.backgroundImage &&
      lhs.bottomDescription == rhs.bottomDescription &&
      lhs.content == rhs.content &&
      lhs.promoMessage == rhs.promoMessage &&
      lhs.title == rhs.title &&
      lhs.topDescription == rhs.topDescription
  }
  
  let title: String
  let backgroundImage: String
  let promoMessage: String?
  let content: [Content]?
  let topDescription: String?
  let bottomDescription: String?
}

struct Content: Codable, Equatable {
  let target: String
  let title: String
}
