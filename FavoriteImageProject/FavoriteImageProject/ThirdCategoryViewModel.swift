//
//  ThirdCategoryViewModel.swift
//  FavoriteImageProject
//
//  Created by MCS on 9/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

final class ThirdCategoryViewModel {
  private let thirdCategoryURL = "https://pixabay.com/api/?key=13466097-dd8cc09427e40108d19a70079&q=purple+flowers"
  var images = [Image]()
  
  func getData(_ completion: (() -> Void)?) {
    guard let thirdCategoryUrl = URL(string: self.thirdCategoryURL) else {
      completion?()
      return
    }
    URLSession.shared.dataTask(with: thirdCategoryUrl) { data, _,  error in
      defer { completion?() }
      guard let data = data,
        error == nil,
        let newImages = try? JSONDecoder().decode(NewImages.self, from: data) else { return }
      self.images = newImages.hits
      }.resume()
  }
  
  func numberOfImages() -> Int {
    return self.images.count
  }
  
  func image(for index: Int) -> Image {
    return self.images[index]
  }
}
