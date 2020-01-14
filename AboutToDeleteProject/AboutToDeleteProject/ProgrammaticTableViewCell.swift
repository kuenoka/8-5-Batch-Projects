//
//  ProgrammaticTableViewCell.swift
//  AboutToDeleteProject
//
//  Created by MCS on 12/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ProgrammaticTableViewCell: UITableViewCell {
  
  let titleLabel = UILabel()
  let myImage = UIImageView()
  
  func downloadImage(title: String, imageURL: String) {
    URLSession.shared.dataTask(with: URL(string: imageURL)!){ (data,_,_) in
      guard let data = data else {return}
      guard let theImage = UIImage(data: data) else {return}
      let imageHeight = theImage.size.height
      let imageWidth = theImage.size.width
      let newWidth = UIScreen.main.bounds.width
      let newHeight = imageHeight*(newWidth/imageWidth)
      
      DispatchQueue.main.async {
        print(newHeight)
        self.myImage.image = theImage
        self.setupImage(title: title, height: newHeight)
      }
    }.resume()
  }
  
  func setupImage(title: String, height: CGFloat) {
    self.setNeedsLayout()
    contentView.addSubview(myImage)
    
    myImage.translatesAutoresizingMaskIntoConstraints = false
    myImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    myImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    myImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    //myImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
    myImage.heightAnchor.constraint(equalToConstant: height).isActive = true

    titleLabel.text = title
    contentView.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: myImage.bottomAnchor).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    //titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
}
