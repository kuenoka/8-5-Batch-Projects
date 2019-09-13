//
//  ViewController.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NextViewControllerDelegate {
  
  private var firstCategory = FirstCategoryViewModel()
  private var secondCategory = SecondCategoryViewModel()
  private var thirdCategory = ThirdCategoryViewModel()
  private var fourthCategory = FourthCategoryViewModel()
  var favoriteCategory: [Image] = []
  
  @IBOutlet weak var myTableView: UITableView!
  
  var array = ["Yellow Flowers", "Blue Flowers", "Purple Flowers", "White Flowers", "Favorite Images"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myTableView.dataSource = self
    myTableView.register(UINib.init(nibName: "InsideCollectionViewCell", bundle: nil), forCellReuseIdentifier: "InsideCollectionViewCell")
    self.firstCategory.getData {
      DispatchQueue.main.async{
        self.myTableView.reloadData()
      }
    }
    self.secondCategory.getData {
      DispatchQueue.main.async{
        self.myTableView.reloadData()
      }
    }
    self.thirdCategory.getData {
      DispatchQueue.main.async{
        self.myTableView.reloadData()
      }
    }
    self.fourthCategory.getData {
      DispatchQueue.main.async{
        self.myTableView.reloadData()
      }
    }
    favoriteCategory = ImageDataManager.shared.getAllImages()//fillFavorite()
    
    DispatchQueue.main.async {
      self.myTableView.reloadData()
    }
    // Do any additional setup after loading the view.
  }
  
//  func fillFavorite() -> [Image] {
//    var favoriteArray: [Image] = []
//    for elements in ImageDataManager.shared.getAllImages() {
//      if elements.isFavorite == true {
//        favoriteArray.append(elements)
//      }
//    }
//    return favoriteArray
//  }
  
  func updateCategories(with value: Image, category: String, index: Int) {
    favoriteCategory = ImageDataManager.shared.getAllImages()//fillFavorite()
    if category == "firstCategory" {
      firstCategory.image(for: index).isFavorite = value.isFavorite
      firstCategory.image(for: index).comments = value.comments
      firstCategory.image(for: index).views = value.views
      firstCategory.image(for: index).downloads = value.downloads
      firstCategory.image(for: index).largeImageURL = value.largeImageURL
      firstCategory.image(for: index).previewURL = value.previewURL
      firstCategory.image(for: index).likes = value.likes
    } else if category == "secondCategory" {
      secondCategory.image(for: index).isFavorite = value.isFavorite
      secondCategory.image(for: index).comments = value.comments
      secondCategory.image(for: index).views = value.views
      secondCategory.image(for: index).downloads = value.downloads
      secondCategory.image(for: index).largeImageURL = value.largeImageURL
      secondCategory.image(for: index).previewURL = value.previewURL
      secondCategory.image(for: index).likes = value.likes
    } else if category == "thirdCategory" {
      thirdCategory.image(for: index).isFavorite = value.isFavorite
      thirdCategory.image(for: index).comments = value.comments
      thirdCategory.image(for: index).views = value.views
      thirdCategory.image(for: index).downloads = value.downloads
      thirdCategory.image(for: index).largeImageURL = value.largeImageURL
      thirdCategory.image(for: index).previewURL = value.previewURL
      thirdCategory.image(for: index).likes = value.likes
    } else if category == "fourthCategory" {
      fourthCategory.image(for: index).isFavorite = value.isFavorite
      fourthCategory.image(for: index).comments = value.comments
      fourthCategory.image(for: index).views = value.views
      fourthCategory.image(for: index).downloads = value.downloads
      fourthCategory.image(for: index).largeImageURL = value.largeImageURL
      fourthCategory.image(for: index).previewURL = value.previewURL
      fourthCategory.image(for: index).likes = value.likes
    }
    DispatchQueue.main.async {
      self.myTableView.reloadData()
    }
  }
  
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
    cell.clCollectionView.dataSource = self
    cell.clCollectionView.delegate = self
    cell.clCollectionView.tag = indexPath.row
    cell.myLabel.text = array[indexPath.row]
    cell.clCollectionView.reloadData()
    return cell
  }
}

extension ViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    var number = 0
    if collectionView.tag == 0 {
      number = firstCategory.numberOfImages()
    } else if collectionView.tag == 1 {
      number = secondCategory.numberOfImages()
    }else if collectionView.tag == 2 {
      number = thirdCategory.numberOfImages()
    } else if collectionView.tag == 3 {
      number = fourthCategory.numberOfImages()
    } else {
      number = favoriteCategory.count
    }
    return number
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsideCollectionViewCell", for: indexPath) as! InsideCollectionViewCell
    if collectionView.tag == 0 {
      let url = URL (string: self.firstCategory.image(for: indexPath.row).previewURL!)
      cell.downloadImage(from: url!)
    }
    if collectionView.tag == 1 {
      let url = URL (string: self.secondCategory.image(for: indexPath.row).previewURL!)
      cell.downloadImage(from: url!)
    }
    if collectionView.tag == 2 {
      let url = URL (string: self.thirdCategory.image(for: indexPath.row).previewURL!)
      cell.downloadImage(from: url!)
    }
    if collectionView.tag == 3 {
      let url = URL (string: self.fourthCategory.image(for: indexPath.row).previewURL!)
      cell.downloadImage(from: url!)
    }
    if collectionView.tag == 4 {
      let url = URL (string: self.favoriteCategory[indexPath.row].previewURL!)
      cell.downloadImage(from: url!)
    }
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width/2 , height: collectionView.frame.height)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
}


extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    if collectionView.tag == 0 {
      nextViewController.image = self.firstCategory.image(for: indexPath.row)
      nextViewController.imageCategory = "firstCategory"
      nextViewController.imageIndex = indexPath.row
    } else if collectionView.tag == 1 {
      nextViewController.image = self.secondCategory.image(for: indexPath.row)
      nextViewController.imageCategory = "secondCategory"
      nextViewController.imageIndex = indexPath.row
    } else if collectionView.tag == 2 {
      nextViewController.image = self.thirdCategory.image(for: indexPath.row)
      nextViewController.imageCategory = "thirdCategory"
      nextViewController.imageIndex = indexPath.row
    } else if collectionView.tag == 3{
      nextViewController.image = self.fourthCategory.image(for: indexPath.row)
      nextViewController.imageCategory = "fourthCategory"
      nextViewController.imageIndex = indexPath.row
    } else {
      nextViewController.image = self.favoriteCategory[indexPath.row]
      nextViewController.imageCategory = "favoriteCategory"
      nextViewController.imageIndex = indexPath.row
    }
    nextViewController.delegate = self
    self.navigationController?.pushViewController(nextViewController, animated: true)
  }
}
