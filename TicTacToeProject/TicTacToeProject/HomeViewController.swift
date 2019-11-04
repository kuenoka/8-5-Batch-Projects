//
//  HomeViewController.swift
//  TicTacToeProject
//
//  Created by MCS on 11/1/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  let gameName = UILabel()
  let humanVSHuman = UIButton()
  let humanVSDumbAI = UIButton()
  let humanVSSmartAI = UIButton()
  let theView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    createGameName()
    createTheView()
  }
  
  func createGameName() {
    gameName.text = "TicTacToe"
    gameName.font = .systemFont(ofSize: 100)
    gameName.textAlignment = .center
    view.addSubview(gameName)
    gameName.backgroundColor = .gray
    gameName.translatesAutoresizingMaskIntoConstraints = false
    gameName.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    gameName.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    gameName.topAnchor.constraint(equalTo: view.topAnchor, constant: 88).isActive = true
    gameName.heightAnchor.constraint(equalToConstant: 104).isActive = true
  }
  
  func createTheView() {
    view.addSubview(theView)
    theView.backgroundColor = .gray
    theView.translatesAutoresizingMaskIntoConstraints = false
    theView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    theView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    theView.topAnchor.constraint(equalTo: view.topAnchor, constant: 224).isActive = true
    theView.heightAnchor.constraint(equalToConstant: 414).isActive = true
    createButtons()
  }
  
  func createButtons() {
    humanVSHuman.setTitle("Human vs Human", for: .normal)
    humanVSHuman.backgroundColor = .darkGray
    humanVSHuman.titleLabel?.font = .systemFont(ofSize: 40)
    humanVSHuman.addTarget(self, action: #selector(humanVSHumanAction), for: .touchUpInside)
    theView.addSubview(humanVSHuman)
    humanVSHuman.translatesAutoresizingMaskIntoConstraints = false
    humanVSHuman.leadingAnchor.constraint(equalTo: theView.leadingAnchor, constant: 20).isActive = true
    humanVSHuman.trailingAnchor.constraint(equalTo: theView.trailingAnchor, constant: -20).isActive = true
    humanVSHuman.topAnchor.constraint(equalTo: theView.topAnchor, constant: 20).isActive = true
    humanVSHuman.heightAnchor.constraint(equalToConstant: 98).isActive = true
    
    humanVSDumbAI.setTitle("Human vs Dumb AI", for: .normal)
    humanVSDumbAI.backgroundColor = .darkGray
    humanVSDumbAI.titleLabel?.font = .systemFont(ofSize: 40)
    humanVSDumbAI.addTarget(self, action: #selector(humanVSDumbAIAction), for: .touchUpInside)
    theView.addSubview(humanVSDumbAI)
    humanVSDumbAI.translatesAutoresizingMaskIntoConstraints = false
    humanVSDumbAI.leadingAnchor.constraint(equalTo: theView.leadingAnchor, constant: 20).isActive = true
    humanVSDumbAI.trailingAnchor.constraint(equalTo: theView.trailingAnchor, constant: -20).isActive = true
    humanVSDumbAI.topAnchor.constraint(equalTo: theView.topAnchor, constant: 158).isActive = true
    humanVSDumbAI.heightAnchor.constraint(equalToConstant: 98).isActive = true
    
    humanVSSmartAI.setTitle("Human vs Smart AI", for: .normal)
    humanVSSmartAI.backgroundColor = .darkGray
    humanVSSmartAI.titleLabel?.font = .systemFont(ofSize: 40)
    humanVSSmartAI.addTarget(self, action: #selector(humanVSSmartAIAction), for: .touchUpInside)
    theView.addSubview(humanVSSmartAI)
    humanVSSmartAI.translatesAutoresizingMaskIntoConstraints = false
    humanVSSmartAI.leadingAnchor.constraint(equalTo: theView.leadingAnchor, constant: 20).isActive = true
    humanVSSmartAI.trailingAnchor.constraint(equalTo: theView.trailingAnchor, constant: -20).isActive = true
    humanVSSmartAI.topAnchor.constraint(equalTo: theView.topAnchor, constant: 296).isActive = true
    humanVSSmartAI.heightAnchor.constraint(equalToConstant: 98).isActive = true
  }
  
  @objc func humanVSHumanAction() {
    let viewController = ViewController()
    viewController.typeOfGame = 1
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
  @objc func humanVSDumbAIAction() {
    let viewController = ViewController()
    viewController.typeOfGame = 2
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
  @objc func humanVSSmartAIAction() {
    let viewController = ViewController()
    viewController.typeOfGame = 3
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
}
