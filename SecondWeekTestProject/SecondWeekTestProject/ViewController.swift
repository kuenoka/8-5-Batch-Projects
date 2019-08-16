//
//  ViewController.swift
//  SecondWeekTestProject
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var episodeArray: [Episode] = []
    
    @IBOutlet weak var episodeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTable.dataSource = self
        episodeTable.delegate = self
        episodeTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        URLSession.shared.dataTask(with: URL(string: "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes")!) { (data, _, _) in
            guard let data = data else {return}

            guard let gameOfThrones = try? JSONDecoder().decode(GameOfThrones.self, from: data) else {
                print("Something went wrong")
                return
            }
            DispatchQueue.main.async{
                self.episodeArray = gameOfThrones.embedded.episodes
                self.episodeTable.reloadData()
            }
            }.resume()
        
    }
    
}

struct GameOfThrones: Codable{
    let embedded : Embedded
    
    enum CodingKeys: String, CodingKey{
        case embedded = "_embedded"
    }
}

struct Embedded: Codable{
    let episodes: [Episode]
}

struct Episode: Codable{
    let name: String
    let number: Int
    let season: Int
    let airdate: String
    let airtime: String
    let summary: String 
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return episodeArray.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "Season: " + "\(episodeArray[indexPath.row].season)" + " /episode: " + episodeArray[indexPath.row].name + " /episodenumber:" + "\(episodeArray[indexPath.row].number)"
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController

        nextViewController.updateEpisodeTitle = "Eposode Title: " + episodeArray[indexPath.row].name
        nextViewController.updatePremierDatde = "Premier Date: " + episodeArray[indexPath.row].airdate
        nextViewController.updateAirTime = "Air Date: " + episodeArray[indexPath.row].airtime
        nextViewController.updateSeason = "Season: " + "\(episodeArray[indexPath.row].season)"
        nextViewController.updateEpisodeNumber = "Episode Number: " + "\(episodeArray[indexPath.row].number)"
        nextViewController.updateSummary = episodeArray[indexPath.row].summary

        //to go back
        navigationController?
            .pushViewController(nextViewController, animated: true)
    }

}

