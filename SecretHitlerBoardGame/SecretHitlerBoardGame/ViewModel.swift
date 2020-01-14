//
//  ViewModel.swift
//  SecretHitlerBoardGame
//
//  Created by MCS on 1/2/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import Foundation

class ViewModel {
  private var secretHitlerArray = [SecretHitlerModel]()
  var sURL = "http://localhost:8000/SecretHitler"
  
  func getData(_ completion: (()->Void)?) {
    guard let sUrl = URL(string: sURL) else {return}
    URLSession.shared.dataTask(with: sUrl){ (data,_,_) in
      guard let data = data,
        let secretHitler = try? JSONDecoder().decode([SecretHitlerModel].self, from: data) else {return}
      self.secretHitlerArray = secretHitler
    }.resume()
  }
  
  func numberOfPlayers() -> Int {
    return secretHitlerArray.count
  }
  
  func player(at: Int) -> SecretHitlerModel {
    return secretHitlerArray[at]
  }
  
  func addNewPlayer(newPlayer: SecretHitlerModel) {
    secretHitlerArray.append(newPlayer)
    guard let uploadData = try? JSONEncoder().encode(newPlayer) else { return }
    guard let newURL = URL(string: sURL) else { return }
    var request = URLRequest(url: newURL)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = uploadData
    URLSession.shared.dataTask(with: request) { _,_,_ in }.resume()
  }
}
