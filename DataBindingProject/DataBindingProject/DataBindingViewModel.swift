//
//  DataBindingViewModel.swift
//  DataBindingProject
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

class DataBindingViewModel {
  
  static let shared = DataBindingViewModel()
  
  private init () { }
  
  var object: Any!
  var array: [Any] = []
  
  func update<T>( updatedObject: T ) {
    object = updatedObject
  }
  
  func addToArray<T>(updatedArray: [T], updatedObject: T ) {
    array = updatedArray
    array.append( updatedObject )
  }
  
  func removeFromArray<T>(updatedArray: [T], index: Int ) {
    array = updatedArray
    array.remove(at: index)
  }
  
  func changeElementInArray<T>(updatedArray: [T], updatedObject: T, index: Int ) {
    array = updatedArray
    array[index] = updatedObject
  }
}

