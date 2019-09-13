//
//  NewNotificationCenter.swift
//  NotificationCenterProject
//
//  Created by MCS on 9/12/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

final class NewNotificationCenter {
  static let shared = NewNotificationCenter()
  
  private init() { }
  
  var observerDictionary: [String: [Observers]] = [:]
  
  func addObserver(for event: String, eventNotifyClosure: @escaping ([String: Any]?) -> Void) -> UUID {
    //observerDictionary[event, default: []] += [eventNotifyClosure]
    let myID = UUID()
    if var observers = observerDictionary[event] {
      observers.append(Observers(notifyClosure: eventNotifyClosure, id: myID))
      observerDictionary[event] = observers
    } else {
      observerDictionary[event] = [Observers(notifyClosure: eventNotifyClosure, id: myID)]
    }
    return myID
  }
  
  func postEvent(named event: String, userInfo: [String: Any]? = nil) {
    guard let observers = observerDictionary[event] else { return }
    for observer in observers {
      observer.notifyClosure(userInfo)
    }
  }
  
  func removeObserver(for observer: UUID) {
    for observers in observerDictionary {
      var mutableObservers = observers.value
      mutableObservers.removeAll(where: { $0.id == observer})
      observerDictionary[observers.key] = mutableObservers
    }
  }
}

struct Observers {
  let notifyClosure: ([String: Any]?) -> Void
  let id: UUID
}
