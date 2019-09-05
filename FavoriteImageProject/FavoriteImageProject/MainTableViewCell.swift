//
//  MainTableViewCell.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
  
  @IBOutlet weak var myLabel: UILabel!
  @IBOutlet weak var clCollectionView: UICollectionView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

extension MainTableViewCell {
  func setCollectionViewDataSourceDelegate <D: UICollectionViewDataSource & UICollectionViewDelegate>
    (_ dataSourceDelegate: D, forRow row: Int)
  {
    clCollectionView.delegate = dataSourceDelegate
    clCollectionView.dataSource = dataSourceDelegate
    
    clCollectionView.reloadData()
  }
}
