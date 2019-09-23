//
//  ViewModel.swift
//  Abercrombie_CodeTest
//
//  Created by MCS on 9/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

final class ViewModel {
  private let viewModelURL = "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json"
  var cards = [PromotionCard]()
  
  func getData(_ completion: (()-> Void)?) {
    guard let viewModelUrl = URL(string: self.viewModelURL) else { completion?()
      return }
    
    URLSession.shared.dataTask(with: viewModelUrl) { data, _, error in
      defer { completion?() }
      guard let data = data,
        error == nil,
        let newCards = try? JSONDecoder().decode([PromotionCard].self, from: data) else { return }
      self.cards = newCards
      }.resume()
  }
  
  func numberOfCards() -> Int{
    return cards.count
  }
  
  func card(at index: Int) -> PromotionCard {
    return cards[index]
  }
}
