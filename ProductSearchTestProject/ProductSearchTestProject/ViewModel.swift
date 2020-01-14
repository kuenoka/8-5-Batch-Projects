//
//  ViewModel.swift
//  ProductSearchTestProject
//
//  Created by MCS on 1/8/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import Foundation

class ProductViewModel {
  private var productViewModel = [SearchProduct]()
  var productURL: String!
  
  func getData(_ completion: (() -> Void)?) {
    guard let productUrl = URL(string: productURL) else { return }
    URLSession.shared.dataTask(with: productUrl) { (data,_,_) in
      guard let data = data
    }
  }
}
