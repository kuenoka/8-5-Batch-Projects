//
//  PromotionsCards.swift
//  Abercrombie_CodeTest
//
//  Created by MCS on 9/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct PromotionCard: Decodable {
  let title: String
  let backgroundImage: String
  let promoMessage: String?
  let content: [Content]?
  let topDescription: String?
  let bottomDescription: String?
}

struct Content: Decodable {
  let target: String
  let title: String
}
