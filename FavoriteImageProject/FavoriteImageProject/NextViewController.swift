//
//  NextViewController.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate {
  func updateCategories(with value: Image, categoryIndex: Int, index: Int)
}

class NextViewController: UIViewController {
  
  var image: Image!
  var delegate: NextViewControllerDelegate?
  var favoriteArray = ImageDataManager.shared.getAllImages()
  var categoryIndex: Int!
  var myArrayIndex: Int!
  
  
  @IBOutlet weak var favoriteButtonOutlet: UIButton!
  @IBOutlet weak var nextImageView: UIImageView!
  @IBOutlet weak var nextLabel: UILabel!
  
  @IBAction func favoriteButton(_ sender: Any) {
    print("\(image.isFavorite)")
    if image.isFavorite == false {
      do {
        let newImage = try ImageDataManager.shared.addImage(comments: image.comments!, downloads: image.downloads!, largeImageURL: image.largeImageURL!, likes: image.likes!, previewURL: image.previewURL!, views: image.views!, isFavorite: image.isFavorite)
        ImageDataManager.shared.save()
      } catch {
        print("There was an error! Error: \(error.localizedDescription)")
      }
      image.isFavorite = !image.isFavorite
      delegate?.updateCategories(with: image, categoryIndex: categoryIndex, index: myArrayIndex)
      
    } else if image.isFavorite == true {
      do {
        let myCopy = try ImageDataManager.shared.copyTheTwoImages(originalImage: image)
      } catch {
        print("There was an error! Error: \(error.localizedDescription)")
      }
      image.isFavorite = !image.isFavorite
      delegate?.updateCategories(with: image, categoryIndex: categoryIndex, index: myArrayIndex)
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
  
  func isItFavorited( myImage: Image, myImageArray: [Image]) -> Bool {
    
    var isFavorite = false
    
    for elements in myImageArray{
      if ( myImage.views == elements.views) {
        isFavorite = true
      }
    }
    
    return isFavorite
  }
}
