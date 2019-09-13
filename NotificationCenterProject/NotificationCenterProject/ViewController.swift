//
//  ViewController.swift
//  NotificationCenterProject
//
//  Created by MCS on 9/6/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  static let customNotification = NSNotification.Name("custom notification")
  
  var myUUID: UUID!
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    NotificationCenter.default.addObserver(self,
//                                           selector: #selector(wasNotified),
//                                           //name: UIApplication.didBecomeActiveNotification,
//                                           name: ViewController.customNotification,
//                                           object: nil)
    myUUID = NewNotificationCenter.shared.addObserver(for: "custom notification", eventNotifyClosure: wasNotified(with:))
    //NewNotificationCenter.shared.removeObserver(for: myUUID)
  }

//  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//    guard  motion == .motionShake else { return }
//    NotificationCenter.default.post(name: ViewController.customNotification, object: nil, userInfo: ["username": "Paul"])
//  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    guard motion == .motionShake else { return }
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  @objc func wasNotified(_ notification: NSNotification) {
    print("I was notified of an event")
    print("New username is \(notification.userInfo?["username"])")
  }

  func wasNotified(with info: [String: Any]?) {
    print("I was notified of an event")
    print("New username is \(info?["username"])")
  }
}

