//
//  NextViewController.swift
//  ToDoListRealmProject
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import RealmSwift

protocol NextViewControllerDelegate {
  func updateString(with value: String)
  func addNewString(with value: String)
  func updateArray(with value: Results<ToDoItem>)
}

class NextViewController: UIViewController {
  
  let listRealm = try! Realm()
  
  @IBOutlet weak var theTextField: UITextField!
  
  var editItemText: String?
  var myArrayIndex: Int?
  var delegate: NextViewControllerDelegate?
  var toDoList: Results<ToDoItem>!
  
  @IBAction func submit(_ sender: Any) {
    let myItem = ToDoItem()
    myItem.name = theTextField.text ?? ""
    
    try! listRealm.write {
      listRealm.add(myItem)
    }
    
    if editItemText!.isEmpty{
      delegate?.addNewString(with: theTextField.text ?? "")
    } else {
      delegate?.updateString(with: theTextField.text ?? "")
      toDoList = listRealm.objects(ToDoItem.self)
      try! listRealm.write {
        listRealm.delete(toDoList[myArrayIndex!])
      }
      let newToDoList = listRealm.objects(ToDoItem.self)
      delegate?.updateArray(with: newToDoList)
    }
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func completedItem(_ sender: UISegmentedControl) {
    
    if editItemText!.isEmpty {
      sender.setTitle("Add Item", forSegmentAt: 0)
    } else {
      sender.setTitle("Delete Item", forSegmentAt: 0)
    }
    
    switch sender.selectedSegmentIndex {
    case 0:
      navigationController?.popViewController(animated: true)
    case 1:
      toDoList = listRealm.objects(ToDoItem.self)
      if !editItemText!.isEmpty {
        try! listRealm.write {
          listRealm.delete(toDoList[myArrayIndex!])
        }
        let newToDoList = listRealm.objects(ToDoItem.self)
        delegate?.updateArray(with: newToDoList)
      }
      navigationController?.popViewController(animated: true)
    default:
      break
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    theTextField.text = editItemText
    toDoList = listRealm.objects(ToDoItem.self)
    // Do any additional setup after loading the view.
  }
  
}
