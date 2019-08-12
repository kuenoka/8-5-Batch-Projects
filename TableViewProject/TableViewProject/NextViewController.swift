//
//  NextViewController.swift
//  TableViewProject
//
//  Created by MCS on 8/8/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate{
    func updateString(with value: String)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var ThetextField: UITextField!
    
    
    var editString: String?
    var delegate: NextViewControllerDelegate?
    
    @IBAction func submit(_ sender: Any) {
        delegate?.updateString(with: ThetextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ThetextField.text = editString
        // Do any additional setup after loading the view.
    }
}
