//
//  HomeViewController.swift
//  MessageProject
//
//  Created by MCS on 12/7/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var peopleArray = PeopleViewModel()
  var namesArray:[String] = []
  var idArray:[Int] = []
  
  @IBAction func createProfile(_ sender: Any) {
    if nameTextField.text != "" && passwordTextField.text != "" {
      
      var createBool = true
      
      if peopleArray.getNumberOfPeople() == 1 {
        if peopleArray.getPeople(index: 0) == nameTextField.text {
          createBool = false
        }
      }
      
      if peopleArray.getNumberOfPeople() > 1 {
        for i in 0..<peopleArray.getNumberOfPeople() {
          if peopleArray.getPeople(index: i) == nameTextField.text {
            createBool = false
          }
        }
      }
      
      if createBool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactViewController = storyboard.instantiateViewController(identifier: "ContactsViewController") as! ContactsViewController
        let newID = peopleArray.getNumberOfPeople()+1
        contactViewController.personID = newID
        peopleArray.addNewPerson(newPerson: nameTextField.text ?? "", id: newID, password: passwordTextField.text ?? "", contact: [], userURL: "http://localhost:3000/Message/\(newID)")
        if let name = nameTextField.text {
          namesArray.append(name)
          idArray.append(newID)
        }
        contactViewController.namesArray = namesArray
        contactViewController.idArray = idArray
        nameTextField.text = ""
        passwordTextField.text = ""
        navigationController?.pushViewController(contactViewController, animated: true)
      }
    }
  }
  
  @IBAction func loadProfile(_ sender: Any) {
    if nameTextField.text != "" && passwordTextField.text != "" {
      var loadBool = false
      var newID = 0
      
      if peopleArray.getNumberOfPeople() == 1 {
        if peopleArray.getPeople(index: 0) == nameTextField.text && peopleArray.getPassword(index: 0) == passwordTextField.text {
          loadBool = true
          newID = 1
        }
      }
      
      if peopleArray.getNumberOfPeople() > 1 {
        for i in 0..<peopleArray.getNumberOfPeople() {
          if peopleArray.getPeople(index: i) == nameTextField.text && peopleArray.getPassword(index: i) == passwordTextField.text {
            loadBool = true
            newID = i + 1
          }
        }
      }
      
      if loadBool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactsViewController = storyboard.instantiateViewController(identifier: "ContactsViewController") as! ContactsViewController
        contactsViewController.personID = newID
        contactsViewController.namesArray = namesArray
        contactsViewController.idArray = idArray
        nameTextField.text = ""
        passwordTextField.text = ""
        navigationController?.pushViewController(contactsViewController, animated: true)
      }
    }
  }
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    peopleArray.getData{
      DispatchQueue.main.async {
        for i in 0..<self.peopleArray.getNumberOfPeople() {
          self.namesArray.append(self.peopleArray.getPeople(index: i))
          self.idArray.append(self.peopleArray.getID(index: i))
        }
      }
    }
  }
  
}
