//
//  ViewController.swift
//  MessageProject
//
//  Created by MCS on 12/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var messageArray = MessageViewModel()
  var name: String!
  @IBOutlet weak var messageTableView: UITableView!
  @IBOutlet weak var theTextField: UITextField!
  var id: Int!
  
  @IBAction func addMessage(_ sender: Any) {
    id = messageArray.getNumberOfMessage()+1
    //messageArray.addNewMessage(newMessage: theTextField.text!, person: name, id: id)
    messageArray.changeMessage(newMessage: theTextField.text!, person: name, id: id)
    messageArray.getData{
      DispatchQueue.main.async {
        self.messageTableView.reloadData()
      }
    }
    theTextField.text = ""
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    messageTableView.dataSource = self
    messageTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    messageArray.getData{
      DispatchQueue.main.async {
        self.messageTableView.reloadData()
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    messageArray.getNumberOfMessage()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = messageArray.getPerson(index: indexPath.row) + ": " + messageArray.getMessage(index: indexPath.row)
    return cell
  }
}
