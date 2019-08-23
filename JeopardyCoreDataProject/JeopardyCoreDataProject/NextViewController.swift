//
//  NextViewController.swift
//  JeopardyCoreDataProject
//
//  Created by MCS on 8/22/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var answerlabel: UILabel!    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var airtimeLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    
    var updateClue: String?
    var updateAnswer: String?
    var updateCategory: String?
    var updateValue: String?
    var updateAirdate: String?
    var updateCreationdate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM-dd-yyyy"
        
        guard let airDateEnable = dateFormatterGet.date(from: updateAirdate ?? "") else {return}
        let newAirDate = dateFormatterPrint.string(from: airDateEnable)

        guard let creationDateEnable = dateFormatterGet.date(from: updateCreationdate ?? "") else {return}
        let newCreationDate = dateFormatterPrint.string(from: creationDateEnable)
        
        questionLabel.text = updateClue
        answerlabel.text = updateAnswer
        categoryLabel.text = updateCategory
        valueLabel.text = updateValue
        airtimeLabel.text = newAirDate
        creationDateLabel.text = newCreationDate
        // Do any additional setup after loading the view.
    }
    
}
