//
//  ViewController.swift
//  JeopardyCoreDataProject
//
//  Created by MCS on 8/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jeopardyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jeopardyTableView.dataSource = self
        jeopardyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "jeopardycell")
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "jeopardycell")
        //cell.textLabel?.text =
        return cell
    }
}
