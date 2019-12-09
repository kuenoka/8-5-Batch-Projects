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
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        viewController.name = nameTextField.text
        peopleArray.addNewPerson(newPerson: nameTextField.text ?? "", id: peopleArray.getNumberOfPeople()+1, password: passwordTextField.text ?? "")
        nameTextField.text = ""
        passwordTextField.text = ""
          navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
  
  @IBAction func loadProfile(_ sender: Any) {
    if nameTextField.text != "" && passwordTextField.text != "" {
      var loadBool = false
      
      if peopleArray.getNumberOfPeople() == 1 {
        if peopleArray.getPeople(index: 0) == nameTextField.text && peopleArray.getPassword(index: 0) == passwordTextField.text {
          loadBool = true
        }
      }
      
      if peopleArray.getNumberOfPeople() > 1 {
        for i in 0..<peopleArray.getNumberOfPeople() {
          if peopleArray.getPeople(index: i) == nameTextField.text && peopleArray.getPassword(index: i) == passwordTextField.text {
            loadBool = true
          }
        }
      }
      
      if loadBool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
        viewController.name = nameTextField.text
        nameTextField.text = ""
        passwordTextField.text = ""
          navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    peopleArray.getData{
      
    }
  }
  
}
