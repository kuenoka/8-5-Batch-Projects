//
//  PeopleModel.swift
//  MessageProject
//
//  Created by MCS on 12/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct People: Codable {
  let id: Int
  let person: String
  let password: String
  var contact: [Contact]
  var userURL: String
}
