//
//  ViewController.swift
//  JokesAPICallsProject
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    var jokeArray: [Joke] = []
    var programmingArray: [Joke] = []
    var miscellaneousArray: [Joke] = []
    var dark: [Joke] = []
    var displayArray: [Joke] = []
    
    @IBOutlet weak var jokeTableView: UITableView!
    
    @IBAction func categorySegmentedControl(_ sender: Any) {
        
    }
    
    @IBAction func getNewJoke(_ sender: Any) {

        URLSession.shared.dataTask(with: URL(string: "https://sv443.net/jokeapi/category/Any")!) { (data, _, _) in
            guard let data = data,
                let joke = try? JSONDecoder().decode(Joke.self, from: data) else {
                    return
            }
            self.jokeArray.append(joke)
            
            }.resume()
        
        jokeTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeTableView.dataSource = self
        jokeTableView.delegate = self
        jokeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "jokecell")
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "jokecell")
        
        cell.textLabel?.text = jokeArray[indexPath.row].joke ?? ""
        
        return cell
    }
}

