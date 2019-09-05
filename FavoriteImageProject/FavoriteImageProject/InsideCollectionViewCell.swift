//
//  InsideCollectionViewCell.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class InsideCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var myImageView: UIImageView!
  // var myImage = UIImageView()
  
  func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
  
  func downloadImage(from url: URL) {
    getData(from: url) { data, response, error in
      guard let data = data, error == nil else { return }
      //self.myImage.image = UIImage(data: data)!
      DispatchQueue.main.async() {
        self.myImageView.image = UIImage(data: data)
      }
    }
    //return myImage
  }
}
