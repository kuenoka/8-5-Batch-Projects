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
  var receiverArray = ReceiverViewModel()
  var contactID: Int!
  var senderURL: String!
  var receiverURL: String!
  var tableID = 0
  @IBOutlet weak var messageTableView: UITableView!
  @IBOutlet weak var theTextField: UITextField!
  
  @IBAction func addMessage(_ sender: Any) {
    let index = findID(person: messageArray.senderViewModel.person)
    if index != 100000000 {
      let id = messageArray.getNumberOfMessageSender(contactIndex: tableID)+1
      let message = Message(id: id, message: theTextField.text ?? "", person: messageArray.senderViewModel.person)
      messageArray.addNewMessage(newMessage: message, contactindex: tableID)
      receiverArray.addNewMessage(newMessage: message, contactindex: index)
      messageTableView.reloadData()
      theTextField.text = ""
    } else {
      theTextField.text = "You are not on his contact"
    }
  }
  
  func findID(person: String) -> Int {
    var foundID = 100000000
    for i in 0..<receiverArray.getNumberOfContact() {
      if person == receiverArray.getMessageReceiverContact(contactIndex: i) {
        foundID = i
      }
    }
    return foundID
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    theTextField.text = ""
    messageTableView.dataSource = self
    messageTableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    messageTableView.backgroundColor = .white
    messageArray.senderViewModelURL = senderURL
    receiverArray.receiverViewModelURL = receiverURL
    messageArray.getData{
      self.tableID = self.contactID-1
    }
    receiverArray.getDataReceiver{
      DispatchQueue.main.async {
        self.messageTableView.reloadData()
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messageArray.getNumberOfMessageSender(contactIndex: tableID)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    cell.messageLabel.layer.cornerRadius = 10
    cell.messageLabel.text =  messageArray.getMessageSender(contactIndex: tableID, messageIndex: indexPath.row)
    cell.personLabel.text = messageArray.getMessageSenderContact(contactIndex: tableID, messageIndex: indexPath.row)
    if messageArray.getMessageSenderContact(contactIndex: tableID, messageIndex: indexPath.row) == messageArray.senderViewModel.person {
       cell.messageLabel.textAlignment = .right
      cell.personLabel.textAlignment = .right
      cell.messageLabel.backgroundColor = .blue
      cell.personLabel.backgroundColor = .blue
      cell.view.backgroundColor = .blue
    } else {
     
      cell.messageLabel.textAlignment = .left
      cell.personLabel.textAlignment = .left
      cell.messageLabel.backgroundColor = .gray
      cell.personLabel.backgroundColor = .gray
      cell.view.backgroundColor = .gray
    }
    cell.setConstraints()
    return cell
  }
}
