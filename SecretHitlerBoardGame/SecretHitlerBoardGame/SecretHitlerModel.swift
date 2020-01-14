//
//  SecretHitlerModel.swift
//  SecretHitlerBoardGame
//
//  Created by MCS on 1/2/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import Foundation

struct SecretHitlerModel: Codable {
  var playerName: String
  var presidentBool: Bool
  var chancellorBool: Bool
  var vote: Bool
  var id: Int
}
