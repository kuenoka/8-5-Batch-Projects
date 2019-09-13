//
//  NextViewController.swift
//  DataBindingProject
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
  
  @IBOutlet weak var theTextLabel: UILabel!
  
  var myArray: [Int]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    theTextLabel.text = DataBindingViewModel.shared.object as? String
    myArray = DataBindingViewModel.shared.array as? [Int]
    //print(myArray ?? [])
  }
  
}
