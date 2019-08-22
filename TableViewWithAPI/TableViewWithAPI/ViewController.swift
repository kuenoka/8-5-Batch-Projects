//
//  ViewController.swift
//  TableViewWithAPI
//
//  Created by MCS on 8/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate{
    func updateClue(with value: String)
    func updateAnswer(with value: String)
    func updateCategory(with value: String)
    func updateValue(with value: String)
    func updateAirdate(with value: String)
    func updateCreationdate(with value: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var jeopardyTable: UITableView!
    
    var clueArray: [Jeopardy] = []
    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jeopardyTable.dataSource = self
        jeopardyTable.delegate = self
        jeopardyTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        URLSession.shared.dataTask(with: URL(string: "http://jservice.io/api/clues")!) { (data, _, _) in
            guard let data = data else {return}
            guard let clue = try? JSONDecoder().decode([Jeopardy].self, from: data) else {
                print("Something went wrong")
                return
            }
            
            DispatchQueue.main.async{
                self.clueArray = clue
                self.jeopardyTable.reloadData()
            }
            }.resume()
    }
}

struct Jeopardy: Codable {
    let answer: String
    let question: String
    let value: Int?
    let airdate: String
    let createdAt: String
    let category: Category
    
    enum CodingKeys: String, CodingKey{
        case answer
        case question
        case value
        case airdate
        case createdAt = "created_at"
        case category
    }
}

struct Category: Codable{
    let title: String
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return clueArray.count
    }

    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = clueArray[indexPath.row].answer + "/" + clueArray[indexPath.row].question + "/" + "\(clueArray[indexPath.row].value ?? 0)" + "/" + clueArray[indexPath.row].category.title
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        
        nextViewController.updateClue = clueArray[indexPath.row].question
        nextViewController.updateAirdate = clueArray[indexPath.row].airdate
        nextViewController.updateValue = "\(clueArray[indexPath.row].value ?? 0)"
        nextViewController.updateAnswer = clueArray[indexPath.row].answer
        nextViewController.updateCategory = clueArray[indexPath.row].category.title
        nextViewController.updateCreationdate = clueArray[indexPath.row].createdAt
        
       // nextViewController.delegate = self
        //to go back
        navigationController?
            .pushViewController(nextViewController, animated: true)
    }
    
}

