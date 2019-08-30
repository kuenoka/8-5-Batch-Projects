//
//  ViewController.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  private let viewModel = FriendsViewModel()

  @IBOutlet weak var episodeTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.episodeTableView.dataSource = self
    self.episodeTableView.delegate = self
    self.episodeTableView.register(UITableViewCell.self,
                                   forCellReuseIdentifier: "cell")
    self.viewModel.getData {
      DispatchQueue.main.async {
        self.episodeTableView.reloadData()
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel.numberOfEpisodes()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    let episode = self.viewModel.episode(for: indexPath.row)
    cell.textLabel?.text = episode.name 
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMMM d, yyyy"
    
    let updateAirDate = dateFormatterGet.date(from: episode.airDate)
    let newAirDate = dateFormatterPrint.string(from: updateAirDate!)
    
    cell.detailTextLabel?.text = newAirDate
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let episode = self.viewModel.episode(for: indexPath.row)
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    detailVC.episode = episode
    self.navigationController?.pushViewController(detailVC, animated: true)
    self.episodeTableView.deselectRow(at: indexPath, animated: true)
  }
    
}


