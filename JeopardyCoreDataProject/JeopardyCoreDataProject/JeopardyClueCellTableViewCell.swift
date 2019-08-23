//
//  JeopardyClueCellTableViewCell.swift
//  JeopardyCoreDataProject
//
//  Created by MCS on 8/22/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class JeopardyClueCellTableViewCell: UITableViewCell {

    @IBOutlet weak var myCustomCell: UILabel!
    
    var cellAnswer: String?
    var cellQuestion: String?
    var cellValue: NSNumber?
    var cellAirDate: String?
    var cellTitle: String?
    var cellCreationAt: String?
    var wifiOn: Bool?
    var favoriteIndex = 0
    var favoriteIndexArray: [Int] = []
    var clue: Clue?
    var favoriteArray: [Clue] = []
    
    @IBAction func favoriteButton(_ sender: Any) {
        do {
            favoriteArray = ClueDataManager.shared.getAllClues()
            if wifiOn == true && !favoriteIndexArray.contains(favoriteIndex) {
                let newClue = try ClueDataManager.shared.addClue(answer: cellAnswer ?? "", question: cellQuestion ?? "", airdate: cellAirDate ?? "", createdAt: cellCreationAt ?? "", value: cellValue ?? 0, title: cellTitle ?? "")
                favoriteIndexArray.append(Int(favoriteIndex))
                ClueDataManager.shared.save()
            }
        } catch {
            print("There was an error! Error: \(error.localizedDescription)")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteArray = ClueDataManager.shared.getAllClues()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
