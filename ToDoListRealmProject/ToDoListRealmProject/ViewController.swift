//
//  ViewController.swift
//  ToDoListRealmProject
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, NextViewControllerDelegate {
  
  let listRealm = try! Realm()
  var array: [String] = []
  
  @IBOutlet weak var toDoListTableView: UITableView!
  
  @IBAction func addItemToList(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    nextViewController.editItemText = ""
    nextViewController.delegate = self
    navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  func updateString(with value: String) {
    guard let selectedRow = toDoListTableView.indexPathForSelectedRow?.row else{ return }
    array[selectedRow] = value
    toDoListTableView.reloadData()
  }
  
  func addNewString(with value: String) {
    array.append(value)
    toDoListTableView.reloadData()
  }
  
  func updateArray(with value: Results<ToDoItem>) {
    array = []
    let arrayOfToDoList = value
    for items in arrayOfToDoList {
      let name = items.name
      array.append(name)
    }
    toDoListTableView.reloadData()
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    toDoListTableView.dataSource = self
    toDoListTableView.delegate = self
    toDoListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    let arrayOfToDoList = listRealm.objects(ToDoItem.self)
    for items in arrayOfToDoList {
      let name = items.name
      array.append(name)
    }
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = array[indexPath.row]
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    nextViewController.editItemText = array[indexPath.row]
    nextViewController.myArrayIndex = indexPath.row
    nextViewController.delegate = self
    navigationController?.pushViewController(nextViewController, animated: true)
  }
}

