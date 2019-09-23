//
//  NextViewController.swift
//  Abercrombie_CodeTest
//
//  Created by MCS on 9/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
  
  var urlString: String!
  
  @IBOutlet weak var myWebView: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let request = URLRequest(url: URL(string: urlString)!)
    myWebView.loadRequest(request)
  }
  
}
