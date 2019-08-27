//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by MCS on 8/27/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    let myNumberOfCells = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let itemWidth = UIScreen.main.bounds.width/5
        let itemHeight = UIScreen.main.bounds.height/4
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        myCollectionView.collectionViewLayout = layout
        
        myCollectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myNumberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.myImageView.backgroundColor = .random
        return cell
    }
}

extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}
