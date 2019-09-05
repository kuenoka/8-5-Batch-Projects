//
//  ViewController.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NextViewControllerDelegate {
  
  private let firstCategory = FirstCategoryViewModel()
  private let secondCategory = SecondCategoryViewModel()
  private let thirdCategory = ThirdCategoryViewModel()
  private let fourthCategory = FourthCategoryViewModel()
  var favoriteCategory = ImageDataManager.shared.getAllImages()
  
  @IBOutlet weak var myTableView: UITableView!
  
  var categoriesArray = ["yellow+flowers", "blue+flowers", "purple+flowers", "white+flowers"]
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
    favoriteCategory = ImageDataManager.shared.getAllImages()
    DispatchQueue.main.async {
      self.myTableView.reloadData()
    }
    // Do any additional setup after loading the view.
  }
  
  func updateFavoriteArray(with value: Image) {
    favoriteCategory = ImageDataManager.shared.getAllImages()
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

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    
    if collectionView.tag == 0 {
      nextViewController.image = self.firstCategory.image(for: indexPath.row)
    } else if collectionView.tag == 1 {
      nextViewController.image = self.secondCategory.image(for: indexPath.row)
    } else if collectionView.tag == 2 {
      nextViewController.image = self.thirdCategory.image(for: indexPath.row)
    } else if collectionView.tag == 3{
      nextViewController.image = self.fourthCategory.image(for: indexPath.row)
    } else {
      nextViewController.image = self.favoriteCategory[indexPath.row]
    }
    nextViewController.myArrayIndex = indexPath.row
    nextViewController.delegate = self
    self.navigationController?.pushViewController(nextViewController, animated: true)
  }
}
