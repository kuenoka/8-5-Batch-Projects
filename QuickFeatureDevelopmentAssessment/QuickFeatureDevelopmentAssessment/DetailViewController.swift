//
//  DetailViewController.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    var episode: Episode!
  
    @IBOutlet weak var episodeInformationLabel: UILabel!
  
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        guard let url = URL (string: self.episode.image.original) else { return }
        downloadImage(from: url)
        
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM d, yyyy"

        guard let updateAirDate = dateFormatterGet.date(from: self.episode.airDate) else {return}
        let newAirDate = dateFormatterPrint.string(from: updateAirDate)

        let secondDateFormatterGet = DateFormatter()
        secondDateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let secondDateFormatterPrint = DateFormatter()
        secondDateFormatterPrint.dateFormat = "EEEE, MMM d, yyyy, h:mm a, z"

        guard let updateAirStamp = secondDateFormatterGet.date(from: self.episode.airStamp) else {return}
        let newAirStamp = secondDateFormatterPrint.string(from: updateAirStamp)
    
        let episodeInformation = "Name: \(self.episode.name)\n\nAir Date: \(newAirDate)\n\nAir Stamp: \(newAirStamp)\n\nRuntime: \(self.episode.runtime) minutes\n\nSummary: \n\n\(self.episode.summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil))"
        self.episodeInformationLabel.text = episodeInformation
  }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() {
                self.myImageView.image = UIImage(data: data)
            }
        }
    }
    
}

