//
//  MessageModel.swift
//  MessageProject
//
//  Created by MCS on 12/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct Message: Codable {
  let id: Int
  let message: String
  let person: String
}
