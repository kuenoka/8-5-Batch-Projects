//
//  ProgrammaticCardTableViewCell.swift
//  Abercrombie_CodeTest
//
//  Created by MCS on 9/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ProgrammaticCardTableViewCell: UITableViewCell {
  
  var card: PromotionCard!
  var delegate: CardTableViewCellDelegate?
  
  let myImageView = UIImageView()
  let topDescriptionLabel = UILabel()
  let titleLabel = UILabel()
  let promoMessageLabel = UILabel()
  let bottomDescriptionLabel = UILabel()
  let firstButton = UIButton()
  let secondButton = UIButton()
  var newHeight: CGFloat!
  
  func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
  
  func downloadImage(from url: URL) {
    getData(from: url) { data, response, error in
      guard let data = data, error == nil else { return }
      DispatchQueue.main.async() {
        guard let image = UIImage(data: data) else { return }
        self.myImageView.image = image
        let imageHeight = image.size.height
        let imageWidth = image.size.width
        let newWidth = UIScreen.main.bounds.size.width
        self.newHeight = (imageHeight / imageWidth ) * newWidth
      }
    }
  }
  
  func addTopDescription( description: String) {
    topDescriptionLabel.text = description
  }
  
  func addTitle ( title: String) {
    titleLabel.text = title
  }
  
  func addPromoMessage( promoMessage: String) {
    promoMessageLabel.text = promoMessage
  }
  
  func addBottomDescription( bottomDescription: String) {
    bottomDescriptionLabel.text = bottomDescription
  }
  
  func addFirstButtonTitle( buttonTitle: String) {
    firstButton.setTitle(buttonTitle, for: .normal)
    firstButton.setTitleColor(.black, for: .normal)
    firstButton.addTarget(self, action: #selector(firstButtonAction), for: .touchUpInside)
  }
  
  @objc func firstButtonAction(){
    var thereIsData = false
    if card.content != nil {
      thereIsData = true
      delegate?.openWeb(with: card.content?[0].target ?? "", available: thereIsData)
    }
  }
  
  func addSecondButtonTitle( buttonTitle: String) {
    secondButton.setTitle(buttonTitle, for: .normal)
    secondButton.setTitleColor(.black, for: .normal)
    secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
  }
  
  @objc func secondButtonAction(){
    var thereIsData = false
    if card.content?.count == 2 {
      thereIsData = true
      delegate?.openWeb(with: card.content?[1].target ?? "", available: thereIsData)
    }
  }
  
  func setConstraint() {
    self.contentView.addSubview(self.myImageView)
    self.contentView.addSubview(self.topDescriptionLabel)
    self.contentView.addSubview(self.titleLabel)
    self.contentView.addSubview(self.promoMessageLabel)
    self.contentView.addSubview(self.bottomDescriptionLabel)
    self.contentView.addSubview(self.firstButton)
    self.contentView.addSubview(self.secondButton)
    
    
    self.myImageView.translatesAutoresizingMaskIntoConstraints = false
    self.myImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    self.myImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    self.myImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
   // self.myImageView.bottomAnchor.constraint(equalTo: self.topDescriptionLabel.topAnchor).isActive = true
    if let myHeight = newHeight {
      //print(newHeight)
      self.myImageView.heightAnchor.constraint(equalToConstant: newHeight).isActive = true
    }
    
    topDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    topDescriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    topDescriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    topDescriptionLabel.topAnchor.constraint(equalTo: self.myImageView.bottomAnchor).isActive = true
    
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: self.topDescriptionLabel.bottomAnchor).isActive = true
    
    
    promoMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    promoMessageLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    promoMessageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    promoMessageLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
    
    
    bottomDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    bottomDescriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    bottomDescriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    bottomDescriptionLabel.topAnchor.constraint(equalTo: self.promoMessageLabel.bottomAnchor).isActive = true
    //bottomDescriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    
    firstButton.translatesAutoresizingMaskIntoConstraints = false
    firstButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    firstButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    firstButton.topAnchor.constraint(equalTo: self.bottomDescriptionLabel.bottomAnchor).isActive = true
    
    secondButton.translatesAutoresizingMaskIntoConstraints = false
    secondButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    secondButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
    secondButton.topAnchor.constraint(equalTo: self.firstButton.bottomAnchor).isActive = true
    secondButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
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

