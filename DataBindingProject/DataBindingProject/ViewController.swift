//
//  ViewController.swift
//  DataBindingProject
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var thetextField: UITextField!
  
  @IBAction func goToNextView(_ sender: Any) {
    //DataBindingViewModel.shared.update(updatedObject: thetextField.text)
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController")
    navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  var myString = "Lets go Warriors"
  //var myArray = ["Ayesha", "Monica", "Stephanie", "Veronica", "Lisa"]
  var myArray = [5, 3, 7, 8, 2]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DataBindingViewModel.shared.update(updatedObject: myString)
//    DataBindingViewModel.shared.addToArray(updatedArray: myArray, updatedObject: 7)
//    myArray = DataBindingViewModel.shared.array as! [Int]
//    DataBindingViewModel.shared.changeElementInArray(updatedArray: myArray, updatedObject: 0, index: 0)
//    myArray = DataBindingViewModel.shared.array as! [Int]
    DataBindingViewModel.shared.removeFromArray(updatedArray: myArray, index: 2)
  }
  
}

