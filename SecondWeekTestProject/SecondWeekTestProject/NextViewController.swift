//
//  NextViewController.swift
//  SecondWeekTestProject
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var premierDateLabel: UILabel!
    @IBOutlet weak var airTimeLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    
    var updateEpisodeTitle: String?
    var updatePremierDatde: String?
    var updateAirTime: String?
    var updateSeason: String?
    var updateEpisodeNumber: String?
    var updateSummary: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        episodeTitleLabel.text = updateEpisodeTitle
        premierDateLabel.text = updatePremierDatde
        airTimeLabel.text = updateAirTime
        seasonLabel.text = updateSeason
        episodeNumberLabel.text = updateEpisodeNumber
        summaryLabel.text = updateSummary
        // Do any additional setup after loading the view.
    }
    
}
