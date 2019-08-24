//
//  JokesTableViewCell.swift
//  JokesAPICallsProject
//
//  Created by MCS on 8/24/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class JokesTableViewCell: UITableViewCell {

    @IBOutlet weak var jokeCell: UILabel!
    @IBAction func favoriteJoke(_ sender: Any) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
