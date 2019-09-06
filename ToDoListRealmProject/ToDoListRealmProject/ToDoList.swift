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
  //  @objc dynamic var name = ""
  //  @objc dynamic var age = 0
  @objc dynamic var name = ""
  //@objc dynamic var toDoStatus = false
}

//class Dog: Object {
//  @objc dynamic var name = ""
//  @objc dynamic var age = 0
//}
//
//class Person: Object {
//  @objc dynamic var name = ""
//  @objc dynamic var picture: Data? = nil // optionals supported
//  let dogs = List<Dog>()
//}
