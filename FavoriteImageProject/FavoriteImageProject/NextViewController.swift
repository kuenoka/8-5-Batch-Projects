//
//  NextViewController.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate {
  func updateCategories(with value: Image, category: String, index: Int)
}

class NextViewController: UIViewController {
  
  var image: Image!
  var imageCategory: String!
  var imageIndex: Int!
  var delegate: NextViewControllerDelegate?
  var favoriteArray = ImageDataManager.shared.getAllImages()
  
  @IBOutlet weak var favoriteButtonOutlet: UIButton!
  @IBOutlet weak var nextImageView: UIImageView!
  @IBOutlet weak var nextLabel: UILabel!
  
  @IBAction func favoriteButton(_ sender: Any) {
    
    if !image.isFavorite {
      image.isFavorite = !image.isFavorite
      ImageDataManager.shared.addImage(image: image)
      delegate?.updateCategories(with: image, category: imageCategory, index:  imageIndex)
    } else {
//      image.isFavorite = !image.isFavorite
//      delegate?.updateCategories(with: image, category: imageCategory, index:  imageIndex)
      do {
        let copiedImage = try ImageDataManager.shared.copyImage(image: image)
        copiedImage.isFavorite = !copiedImage.isFavorite
        delegate?.updateCategories(with: copiedImage, category: imageCategory, index:  imageIndex)
      } catch {
        print(error.localizedDescription)
      }
      ImageDataManager.shared.removeImage(image: image)
    }
    navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let url = URL (string: self.image.largeImageURL!) else { return }
    downloadImage(from: url)
    if image.isFavorite == false {
      favoriteButtonOutlet.setTitle("Favorite", for: .normal)
    } else {
      favoriteButtonOutlet.setTitle("UnFavorite", for: .normal)
    }
    let imageInformation = "Downloads: \(self.image.downloads!)\n\nLikes: \(self.image.likes!)\n\nComments: \(self.image.comments!)\n\nViews: \(self.image.views!)"
    self.nextLabel.text = imageInformation
    // Do any additional setup after loading the view.
  }
  
  func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
  
  func downloadImage(from url: URL) {
    getData(from: url) { data, response, error in
      guard let data = data, error == nil else { return }
      
      DispatchQueue.main.async() {
        self.nextImageView.image = UIImage(data: data)
      }
    }
  }
}
