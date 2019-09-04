//
//  ViewController.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var categoriesArray = ["yellow+flowers", "blue+flowers", "purple+flowers", "white+flowers"]//, "pink+flowers"]
    
    var anyArray: [Image] = []
    var firstCategory: [Image] = []
    var secondCategory: [Image] = []
    var thirdCategory: [Image] = []
    var fourthCategory: [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.register(UINib.init(nibName: "InsideCollectionViewCell", bundle: nil), forCellReuseIdentifier: "InsideCollectionViewCell")
        let group = DispatchGroup()
        for i in 0...categoriesArray.count-1 {
            group.enter()
             guard let url = URL (string: "https://pixabay.com/api/?key=13466097-dd8cc09427e40108d19a70079&q=\(categoriesArray[i])") else { return }
            fillArray{from: url, (images) in
                
            }
            defer { group.leave() }
            if i == 0 {
                firstCategory = anyArray
            }
            if i == 1 {
                secondCategory = anyArray
            }
            if i == 2 {
                thirdCategory = anyArray
            }
            if i == 3 {
                fourthCategory = anyArray
            }
            //anyArray = []
        }
        
        group.notify(queue: .main) {
            self.myTableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func fillArray(from url: URL, completion: @escaping (NewImages?) -> Void) {
        getData(from: url) { data, response, error in
            
            guard let data = data, error == nil else { return }
            guard let images = try? JSONDecoder().decode(NewImages.self, from: data) else {
                print("no images")
                return
            }
            
//            DispatchQueue.main.async() {
//                self.anyArray = images.hits
//            }
            completion(images)
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        
        return cell
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return firstCategory.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsideCollectionViewCell", for: indexPath) as! InsideCollectionViewCell
        let url = URL (string: self.firstCategory[indexPath.row].previewURL!)
        cell.downloadImage(from: url!)
        return cell
    }
}
