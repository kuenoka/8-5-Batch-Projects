//
//  NextViewController.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate {
  func updateFavoriteArray(with value: Image)
}

class NextViewController: UIViewController {
  
  var image: Image!
  var delegate: NextViewControllerDelegate?
  var favoriteArray = ImageDataManager.shared.getAllImages()
  var myArrayIndex: Int?
  
  
  @IBOutlet weak var nextImageView: UIImageView!
  @IBOutlet weak var nextLabel: UILabel!
  
  @IBAction func favoriteButton(_ sender: Any) {
    
    do {
      let newImage = try ImageDataManager.shared.addImage(comments: image.comments!, downloads: image.downloads!, largeImageURL: image.largeImageURL!, likes: image.likes!, previewURL: image.previewURL!, views: image.views!)
      ImageDataManager.shared.save()
    } catch {
      print("There was an error! Error: \(error.localizedDescription)")
    }
    
    favoriteArray = ImageDataManager.shared.getAllImages()
    if !isItFavorited(myImage: image, myImageArray: favoriteArray){
      print("just favorited")
      delegate?.updateFavoriteArray(with: image)
    } else {
      favoriteArray = ImageDataManager.shared.getAllImages()
      ImageDataManager.shared.removeImage(image: image)
      delegate?.updateFavoriteArray(with: image)
      favoriteArray = ImageDataManager.shared.getAllImages()
    }
    navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let url = URL (string: self.image.largeImageURL!) else { return }
    downloadImage(from: url)
    
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
