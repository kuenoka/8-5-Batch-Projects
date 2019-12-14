//
//  ContactsViewController.swift
//  MessageProject
//
//  Created by MCS on 12/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
  
  var contactArray = ContactViewModel()
  var personID: Int!
  var namesArray: [String]!
  var idArray: [Int]!
  @IBOutlet weak var contactTableView: UITableView!
  @IBOutlet weak var contactTextField: UITextField!
  
  @IBAction func addContact(_ sender: Any) {
    if contactTextField.text != "" && namesArray.contains(contactTextField.text ?? ""){
      
      var createBool = true
      
      if contactArray.getNumberOfContacts() == 1 {
        if contactArray.getContact(index: 0) == contactTextField.text {
          createBool = false
        }
      }
      
      if contactArray.getNumberOfContacts() > 1 {
        for i in 0..<contactArray.getNumberOfContacts() {
          if contactArray.getContact(index: i) == contactTextField.text {
            createBool = false
          }
        }
      }
      
      if createBool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        let newID = contactArray.getNumberOfContacts()+1
        viewController.contactID = newID
        viewController.senderURL = "http://localhost:3000/Message/\(personID ?? 1)"
        if let contactName = contactTextField.text {
          let theID = findID(person: contactName)
          viewController.receiverURL = "http://localhost:3000/Message/\(theID)"
        }
        contactArray.addNewContact(newMessages: [], person: contactTextField.text ?? "", id: newID)
        contactTextField.text = ""
        contactTableView.reloadData()
        
        navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
  
  @IBAction func loadContact(_ sender: Any) {
    if contactTextField.text != "" && namesArray.contains(contactTextField.text ?? ""){
      
      var loadBool = false
      var newID = 0
      
      if contactArray.getNumberOfContacts() == 1 {
        if contactArray.getContact(index: 0) == contactTextField.text {
          loadBool = true
          newID = 1
        }
      }
      
      if contactArray.getNumberOfContacts() > 1 {
        for i in 0..<contactArray.getNumberOfContacts() {
          if contactArray.getContact(index: i) == contactTextField.text {
            loadBool = true
            newID = i + 1
          }
        }
      }
      
      if loadBool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        viewController.contactID = newID
        viewController.senderURL = "http://localhost:3000/Message/\(personID ?? 1)"
        if let contactName = contactTextField.text {
          let theID = findID(person: contactName)
          viewController.receiverURL = "http://localhost:3000/Message/\(theID)"
        }
        contactTextField.text = ""
        contactTableView.reloadData()
        
        navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
  
  func findID(person: String) -> Int {
    var foundID = 0
    for i in 0..<idArray.count {
      if person == namesArray[i] {
        foundID = idArray[i]
      }
    }
    return foundID
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    contactTableView.dataSource = self
    contactTableView.delegate = self
    contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    contactArray.viewModelURL = "http://localhost:3000/Message/\(personID ?? 1)"
    contactArray.getData{
      DispatchQueue.main.async {
        self.contactTableView.reloadData()
      }
    }
  }
  
}


extension ContactsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    contactArray.getNumberOfContacts()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = contactArray.getContact(index: indexPath.row)
    return cell
  }
  
}

extension ContactsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if namesArray.contains(contactArray.getContact(index: indexPath.row)){
      contactTextField.text = contactArray.getContact(index: indexPath.row)
      var loadBool = false
      var newID = 0
      
      if contactArray.getNumberOfContacts() == 1 {
        if contactArray.getContact(index: 0) == contactTextField.text {
          loadBool = true
          newID = 1
        }
      }
      
      if contactArray.getNumberOfContacts() > 1 {
        for i in 0..<contactArray.getNumberOfContacts() {
          if contactArray.getContact(index: i) == contactTextField.text {
            loadBool = true
            newID = i + 1
          }
        }
      }
      
      if loadBool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        viewController.contactID = newID
        viewController.senderURL = "http://localhost:3000/Message/\(personID ?? 1)"
        if let contactName = contactTextField.text {
          let theID = findID(person: contactName)
          viewController.receiverURL = "http://localhost:3000/Message/\(theID)"
        }
        contactTextField.text = ""
        contactTableView.reloadData()
        navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
}
