//
//  ViewController.swift
//  LocalizedProject
//
//  Created by MCS on 9/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var localizedLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    localizedLabel.text = LocalizableStrings.helloPerson(person: "Kingsley")
  }


}

