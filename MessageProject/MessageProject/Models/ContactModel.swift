//
//  ContactModel.swift
//  MessageProject
//
//  Created by MCS on 12/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct Contact: Codable {
  let id: Int
  let person: String
  var message: [String]
}
