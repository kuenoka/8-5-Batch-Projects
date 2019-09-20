//
//  CardTableViewCell.swift
//  Abercrombie_CodeTest
//
//  Created by MCS on 9/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol CardTableViewCellDelegate {
  func openWeb(with value: String, available: Bool)
}

class CardTableViewCell: UITableViewCell {
  
  var card: PromotionCard!
  var delegate: CardTableViewCellDelegate?
  
  @IBOutlet weak var cellImageView: UIImageView!
  @IBOutlet weak var topDescriptionLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var promoMessageLabel: UILabel!
  @IBOutlet weak var buttonDescriptionLabel: UILabel!
  
  @IBOutlet weak var menButtonOutlet: UIButton!
  @IBAction func menButton(_ sender: Any) {
    var thereIsData = false
    if card.content != nil {
      thereIsData = true
      delegate?.openWeb(with: card.content?[0].target ?? "", available: thereIsData)
    }
  }
  
  @IBOutlet weak var womenButtonOutlet: UIButton!
  @IBAction func womenButton(_ sender: Any) {
    var thereIsData = false
    if card.content?.count == 2 {
      thereIsData = true
      delegate?.openWeb(with: card.content?[1].target ?? "", available: thereIsData)
    }
  }
  
  func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
  
  func downloadImage(from url: URL) {
    getData(from: url) { data, response, error in
      guard let data = data, error == nil else { return }
      DispatchQueue.main.async() {
        self.cellImageView.image = UIImage(data: data)
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    menButtonOutlet.setTitle("", for: .normal)
    womenButtonOutlet.setTitle("", for: .normal)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}
