//
//  ToDoList.swift
//  ToDoListRealmProject
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoItem: Object {
  @objc dynamic var name = ""
}
