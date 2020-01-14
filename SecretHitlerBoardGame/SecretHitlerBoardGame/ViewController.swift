//
//  ViewController.swift
//  SecretHitlerBoardGame
//
//  Created by MCS on 12/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var playButton = UIButton()
  var newPlayerLabel = UILabel()
  var newPlayerTextField = UITextField()
  var array = ViewModel()
  var namesArray = ["", "", "", "", ""]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    nextView()
    array.getData{}
  }
  
  func nextView() {
    playButton.setTitle("Play", for: .normal)
    playButton.setTitleColor(.black, for: .normal)
    playButton.backgroundColor = .blue
    playButton.layer.cornerRadius = 5
    playButton.addTarget(self, action: #selector(moveToNextView), for: .touchUpInside)
    view.addSubview(playButton)
    playButton.translatesAutoresizingMaskIntoConstraints = false
    playButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
    playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150).isActive = true
    playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    newPlayerLabel.text = "Player Name"
    view.addSubview(newPlayerLabel)
    newPlayerLabel.translatesAutoresizingMaskIntoConstraints = false
    newPlayerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    newPlayerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    newPlayerLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    newPlayerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    newPlayerTextField.backgroundColor = .red
    view.addSubview(newPlayerTextField)
    newPlayerTextField.translatesAutoresizingMaskIntoConstraints = false
    newPlayerTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    newPlayerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    newPlayerTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
    newPlayerTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
  @objc func moveToNextView() {
    let id = array.numberOfPlayers() + 1
    if id < 6 {
      for i in 0..<self.array.numberOfPlayers() {
        self.namesArray[i] = self.array.player(at: i).playerName
      }
      namesArray[id-1] = newPlayerTextField.text ?? "P"
      print(namesArray)
      var presidentBool = false
      if id == 1 {
        presidentBool = true
      }
      guard let playerName = newPlayerTextField.text else {return}
      let test = SecretHitlerModel(playerName: playerName, presidentBool: presidentBool, chancellorBool: false, vote: false, id: id)
      array.addNewPlayer(newPlayer: test)
      let detailViewController = DetailViewController()
      detailViewController.playerIndex = id - 1
      detailViewController.namesArray = namesArray
      self.navigationController?.pushViewController(detailViewController, animated: true)
    }
  }
}

