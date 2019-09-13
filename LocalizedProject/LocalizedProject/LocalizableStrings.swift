//
//  LocalizableStrings.swift
//  LocalizedProject
//
//  Created by MCS on 9/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

enum LocalizableStrings {
  static let helloWorldText = NSLocalizedString("helloWorldText", comment: "")
  static func helloPerson(person: String) -> String {
    return String.localizedStringWithFormat(NSLocalizedString("helloPerson", comment: ""), person)
  }
}
