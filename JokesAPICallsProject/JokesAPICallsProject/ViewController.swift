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
    var displayArray: [Joke] = []
    var myCase = 0
    
    @IBOutlet weak var jokeTableView: UITableView!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    @IBAction func getNewJoke(_ sender: Any) {
        
        URLSession.shared.dataTask(with: URL(string: "https://sv443.net/jokeapi/category/Any")!) { (data, _, _) in
            guard let data = data else { return }
            guard let joke = try? JSONDecoder().decode(Joke.self, from: data) else {
                return
            }
            self.jokeArray.append(joke)
            print(joke.category)
            self.displayArray = self.jokeArray
            }.resume()
        DispatchQueue.main.async{
            self.jokeTableView.reloadData()
        }
    }
    
    func makeProgrammingJokes( defaultJoke: [Joke]) -> [Joke] {
        var programmingArray: [Joke] = []
        for elements in defaultJoke {
            if elements.category == "Programming" {
                programmingArray.append(elements)
            }
        }
        return programmingArray
    }
    
    func makeDarkJokes( defaultJoke: [Joke] ) -> [Joke] {
        var darkArray: [Joke] = []
        for elements in defaultJoke {
            if elements.category == "Dark" {
                darkArray.append(elements)
            }
        }
        return darkArray
    }
    
    func makeMiscellaneosJokes( defaultJoke: [Joke]) -> [Joke] {
        var miscellaneousArray: [Joke] = []
        for elements in defaultJoke {
            if elements.category == "Miscellaneous" {
                miscellaneousArray.append(elements)
            }
        }
        return miscellaneousArray
    }
    
    @IBAction func categorySegmentedControl(_ sender: Any) {
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            displayArray = jokeArray
            jokeTableView.reloadData()
        case 1:
            displayArray = makeProgrammingJokes(defaultJoke: jokeArray)
            jokeTableView.reloadData()
        case 2:
            displayArray = makeMiscellaneosJokes(defaultJoke: jokeArray)
            jokeTableView.reloadData()
        case 3:
            displayArray = makeDarkJokes(defaultJoke: jokeArray)
            jokeTableView.reloadData()
        case 4:
            displayArray = []
            jokeTableView.reloadData()
        default:
            break
        }
        self.jokeTableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeTableView.dataSource = self
        jokeTableView.delegate = self
        //jokeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "jokecell")
        jokeTableView.register(UINib.init(nibName: "JokesTableViewCell", bundle: nil), forCellReuseIdentifier: "jokecell")
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            displayArray = jokeArray
        case 1:
            displayArray = makeProgrammingJokes(defaultJoke: jokeArray)
        case 2:
            displayArray = makeMiscellaneosJokes(defaultJoke: jokeArray)
        case 3:
            displayArray = makeDarkJokes(defaultJoke: jokeArray)
        case 4:
            displayArray = []
        default:
            break
        }
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "jokecell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokecell", for: indexPath) as! JokesTableViewCell
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.text = "Single: \(displayArray[indexPath.row].joke ?? "Its a two part")" +
            "/Twopart Setup: \(displayArray[indexPath.row].setup ?? "Its a single joke")" +
            "/Delivery: \(displayArray[indexPath.row].delivery ?? "None")"
        
        return cell
    }
}

