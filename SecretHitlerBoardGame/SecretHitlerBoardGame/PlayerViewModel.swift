//
//  PlayerViewModel.swift
//  SecretHitlerBoardGame
//
//  Created by MCS on 1/6/20.
//  Copyright © 2020 MCS. All rights reserved.
//

import Foundation

class PlayerViewModel {
  private var secretHitlerPlayer = SecretHitlerModel(playerName: "", presidentBool: false, chancellorBool: false, vote: false, id: 1000)
  var sURL: String!
  
  func getData(_ completion: (()->Void)?) {
    guard let sUrl = URL(string: sURL) else {return}
    URLSession.shared.dataTask(with: sUrl){ (data,_,_) in
      guard let data = data,
        let secretHitler = try? JSONDecoder().decode(SecretHitlerModel.self, from: data) else {return}
      self.secretHitlerPlayer = secretHitler
    }.resume()
  }
  
  func playerName() -> String {
    return secretHitlerPlayer.playerName
  }
  
  func playerPresidentBool() -> Bool {
    return secretHitlerPlayer.presidentBool
  }
  
  func playerChancellorBool() -> Bool {
    return secretHitlerPlayer.chancellorBool
  }
  
  func playerVoteBool() -> Bool {
    return secretHitlerPlayer.vote
  }
  
  func voteCandidates(myVote: Bool) {
    secretHitlerPlayer.vote = myVote
    guard let uploadData = try? JSONEncoder().encode(secretHitlerPlayer) else { return }
    guard let newURL = URL(string: sURL) else { return }
    var request = URLRequest(url: newURL)
    request.httpMethod = "PUT"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = uploadData
    URLSession.shared.dataTask(with: request) { _,_,_ in }.resume()
  }
}
