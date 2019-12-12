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
  var name: String!
  var contactID: Int!
  var senderID: Int!
  var senderURL: String!
  var receiverID: Int!
  var receiverURL: String!
  var contact: People!
  var tableID = 0
  @IBOutlet weak var messageTableView: UITableView!
  @IBOutlet weak var theTextField: UITextField!
  var id: Int!
  
  @IBAction func addMessage(_ sender: Any) {
    let index = findID(person: messageArray.senderViewModel.person)
    messageArray.addNewMessage(newMessage: messageArray.senderViewModel.person + ": " + (theTextField.text ?? ""), contactindex: contactID-1)//, receiverIndex: index)
    receiverArray.addNewMessage(newMessage: messageArray.senderViewModel.person + ": " + (theTextField.text ?? ""), contactindex: index)
    messageTableView.reloadData()
//    messageArray.getData{
//      DispatchQueue.main.async {
//        self.messageTableView.reloadData()
//      }
//    }
    theTextField.text = ""
  }
  
  func findID(person: String) -> Int {
    var foundID = 12
    for i in 0..<receiverArray.getNumberOfContact() {
      if person == receiverArray.getMessageReceiverContact(contactIndex: i) {
        foundID = i
      }
    }
    return foundID
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    messageTableView.dataSource = self
    messageTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    messageArray.senderViewModelURL = senderURL
    receiverArray.receiverViewModelURL = receiverURL
    messageArray.getData{
      self.tableID = self.contactID-1
    }
    //print(receiverURL)
    receiverArray.getDataReceiver{
      DispatchQueue.main.async {
        self.messageTableView.reloadData()
      }
    }
  }
}

extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messageArray.getNumberOfMessageSender(contactIndex: tableID)//0)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//    cell.textLabel?.text = messageArray.getPerson(index: indexPath.row) + ": " + messageArray.getMessage(index: indexPath.row)
    cell.textLabel?.text = messageArray.getMessageSender(contactIndex: tableID, messageIndex: indexPath.row)
    
    return cell
  }
}
