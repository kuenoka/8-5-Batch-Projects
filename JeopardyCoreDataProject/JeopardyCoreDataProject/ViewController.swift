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
    var clueArray: [Clue] = []
    var favoriteArray = ClueDataManager.shared.getAllClues()
    var wifiConnection = false
    
    func isItFavorited( myClue: Clue, myClueArray: [Clue]) -> Bool {
        
        var isFavorite = false
        
        for elements in myClueArray{
            if ( myClue.answer == elements.answer) {
                isFavorite = true
            }
        }
        
        return isFavorite
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        jeopardyTableView.dataSource = self
        jeopardyTableView.delegate = self
        jeopardyTableView.register(UINib.init(nibName: "JeopardyClueCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cluecell")
        self.clueArray = ClueDataManager.shared.getAllClues()
        guard let clueURL = URL(string: "http://jservice.io/api/clues") else { return }
        URLSession.shared.dataTask(with: clueURL) { (data, response, error) in
            if error == nil {
                self.wifiConnection = true
            }
            guard let data = data,
                let clue = try? JSONDecoder().decode([Clue].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.clueArray = clue
                self.jeopardyTableView.reloadData()
            }
        }.resume()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cluecell", for: indexPath) as! JeopardyClueCellTableViewCell
        cell.myCustomCell?.numberOfLines = 0
        cell.myCustomCell.text = clueArray[indexPath.row].answer + "/" + clueArray[indexPath.row].question
        
        cell.cellAnswer = clueArray[indexPath.row].answer
        cell.cellQuestion = clueArray[indexPath.row].question
        cell.cellValue = clueArray[indexPath.row].value
        cell.cellAirDate = clueArray[indexPath.row].airdate
        cell.cellTitle = clueArray[indexPath.row].title
        cell.cellCreationAt = clueArray[indexPath.row].createdAt

        cell.isFavorite = isItFavorited(myClue: clueArray[indexPath.row], myClueArray: favoriteArray)
        cell.wifiOn = wifiConnection
        cell.favoriteIndex = indexPath.row
        cell.clue = clueArray[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        
        nextViewController.updateClue = clueArray[indexPath.row].question
        nextViewController.updateAirdate = clueArray[indexPath.row].airdate
        if let value = clueArray[indexPath.row].value {
            nextViewController.updateValue = "\(value)"
        } else {
            nextViewController.updateValue = "No value"
        }
        
        nextViewController.updateAnswer = clueArray[indexPath.row].answer
        nextViewController.updateCategory = clueArray[indexPath.row].title
        nextViewController.updateCreationdate = clueArray[indexPath.row].createdAt
        
        navigationController?
            .pushViewController(nextViewController, animated: true)
    }
    
}

