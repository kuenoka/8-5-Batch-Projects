//
//  ViewController.swift
//  TableViewProject
//
//  Created by MCS on 8/8/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NextViewControllerDelegate {

    @IBOutlet weak var TheTableView: UITableView!
    var array = ["hi", "hello", "goodbye"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TheTableView.dataSource = self
        TheTableView.delegate = self
        TheTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func updateString(with value: String){
        guard let selectedRow = TheTableView.indexPathForSelectedRow?.row else{return}
        array[selectedRow] = value
        TheTableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return array.count
    }
    
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = array [indexPath.row]
        
    return cell
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        let tappedString = array[indexPath.row]
        nextViewController.editString = tappedString
        nextViewController.delegate = self
//        present(nextViewController, animated: true, completion: nil)
        
        //to go back
        navigationController?
        .pushViewController(nextViewController, animated: true)
    }
    
}
