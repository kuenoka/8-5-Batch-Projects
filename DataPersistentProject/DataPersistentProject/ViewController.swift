//
//  ViewController.swift
//  DataPersistentProject
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    var isDarkModeEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isDarkModeEnabled")
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeSwitch.isOn = isDarkModeEnabled
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    private func updateUI() {
        if isDarkModeEnabled {
            darkModeLabel.textColor = .white
            view.backgroundColor = .black
        } else {
            darkModeLabel.textColor = .black
            view.backgroundColor = .white
        }
    }

    @IBAction func didTapDarkMode(_ sender: Any) {
        isDarkModeEnabled = !isDarkModeEnabled
    }
    
}

