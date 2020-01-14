//
//  ViewController.swift
//  AboutToDeleteProject
//
//  Created by MCS on 12/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var theTextField: UITextField!
  
  @IBAction func find(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailViewController = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
    detailViewController.searchedItem = theTextField.text
    navigationController?.pushViewController(detailViewController, animated: true)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
}



