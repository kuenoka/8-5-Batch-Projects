//
//  ViewController.swift
//  MemoryManagementProject
//
//  Created by MCS on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hasPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Ryan")
        let dwelling = Abode(address: "NoSuchPlace")
        person.dwelling = dwelling
        dwelling.occupant = person
        print("end of view did load")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !hasPresented else { return }
        hasPresented = true
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true, completion: nil)
    }
}

class SecondViewController: UIViewController {
    
    deinit {
        print("second view controller has been deinitialized")
    }
    
    var count = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dismiss(animated: true) { [weak self] in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2, execute: {
                for number in 0...1000000{
                    self?.count += number
                    print(self?.count)
                }
            })
        }
    }
}

class Person {
    var name: String
    var dwelling: Abode?
    
    deinit {
        print("the person was murdered")
    }
    init(name: String) {
        self.name = name
    }
}

class Abode {
    var address: String
    weak var occupant: Person?
    
    deinit {
        print("the abode has been buldozed")
    }
    
    init(address: String) {
        self.address = address
    }
    
}
