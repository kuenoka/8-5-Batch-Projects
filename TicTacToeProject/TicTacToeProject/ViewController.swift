//
//  ViewController.swift
//  TicTacToeProject
//
//  Created by MCS on 10/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let gameLayer = CAShapeLayer()
  let gameView = UIView()
  let restartGameView = UIView()
  let gameName = UILabel()
  let playerOneLabel = UILabel()
  let playerTwolabel = UILabel()
  let winnerLabel = UILabel()
  let firstLine = CAShapeLayer()
  let secondLine = CAShapeLayer()
  let thirdLine = CAShapeLayer()
  let fourthLine = CAShapeLayer()
  let firstButton = UIButton()
  let secondButton = UIButton()
  let thirdButton = UIButton()
  let fourthButton = UIButton()
  let fifthButton = UIButton()
  let sixthButton = UIButton()
  let seventhButton = UIButton()
  let eighthButton = UIButton()
  let ninethButton = UIButton()
  let restartButton = UIButton()
  var playerOne = "X"
  var playerTwo = "O"
  var playerBool = false
  var playerOneWin = false
  var playerTwoWin = false
  var array = [[0,0,0],[0,0,0],[0,0,0]]
  var typeOfGame: Int!
  var playedSpots: [Int]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .black
    playerOneLabel.text = "Player One: Play"
    playerOneLabel.text = "Player Two: "
    createGameName()
    createPlaylabel()
    createWinner()
    createGameView()
    createRestartGameView()
  }
  
  func createRestartGameView() {
    view.addSubview(restartGameView)
    restartGameView.backgroundColor = .gray
    restartGameView.translatesAutoresizingMaskIntoConstraints = false
    restartGameView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 738).isActive = true
    restartGameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    restartGameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    restartGameView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    createRestartButton()
  }
  
  func createRestartButton() {
    restartButton.setTitle("Restart Game", for: .normal)
    restartButton.titleLabel?.font = .systemFont(ofSize: 30)
    restartButton.addTarget(self, action: #selector(restartButtonAction), for: .touchUpInside)
    restartGameView.addSubview(restartButton)
    restartButton.backgroundColor = .darkGray
    restartButton.translatesAutoresizingMaskIntoConstraints = false
    restartButton.topAnchor.constraint(equalTo: restartGameView.topAnchor, constant: 20).isActive = true
    restartButton.bottomAnchor.constraint(equalTo: restartGameView.bottomAnchor, constant: -20).isActive = true
    restartButton.leadingAnchor.constraint(equalTo: restartGameView.leadingAnchor, constant: 20).isActive = true
    restartButton.trailingAnchor.constraint(equalTo: restartGameView.trailingAnchor, constant: -20).isActive = true
  }
  
  @objc func restartButtonAction() {
    for i in 0..<array.count {
      array[i][0] = 0
      array[i][1] = 0
      array[i][2] = 0
    }
    
    firstButton.setTitle("", for: .normal)
    secondButton.setTitle("", for: .normal)
    thirdButton.setTitle("", for: .normal)
    fourthButton.setTitle("", for: .normal)
    fifthButton.setTitle("", for: .normal)
    sixthButton.setTitle("", for: .normal)
    seventhButton.setTitle("", for: .normal)
    eighthButton.setTitle("", for: .normal)
    ninethButton.setTitle("", for: .normal)
    
    playerOneLabel.text = "Player One: Play"
    playerTwolabel.text = "Player Two: "
    
    winnerLabel.text = "Game On"
    
    playerBool = false
    playerOneWin = false
    playerTwoWin = false
  }
  
  func createGameName() {
    gameName.text = "TicTacToe"
    gameName.font = .systemFont(ofSize: 100)
    gameName.textAlignment = .center
    gameName.backgroundColor = .gray
    view.addSubview(gameName)
    gameName.translatesAutoresizingMaskIntoConstraints = false
    gameName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 88).isActive = true
    gameName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    gameName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    gameName.heightAnchor.constraint(equalToConstant: 96).isActive = true
  }
  
  func createPlaylabel() {
    playerOneLabel.text = "player One: Play"
    playerOneLabel.backgroundColor = .blue
    playerOneLabel.font = .systemFont(ofSize: 29)
    view.addSubview(playerOneLabel)
    playerOneLabel.translatesAutoresizingMaskIntoConstraints = false
    playerOneLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    playerOneLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    playerOneLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
    playerOneLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 184).isActive = true
    
    playerTwolabel.text = "player Two: "
    playerTwolabel.backgroundColor = .red
    playerTwolabel.font = .systemFont(ofSize: 29)
    view.addSubview(playerTwolabel)
    playerTwolabel.translatesAutoresizingMaskIntoConstraints = false
    playerTwolabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    playerTwolabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
    playerTwolabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    playerTwolabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 184).isActive = true
  }
  
  func createWinner() {
    winnerLabel.text = "Game On"
    winnerLabel.textAlignment = .center
    winnerLabel.backgroundColor = .purple
    winnerLabel.font = winnerLabel.font.withSize(55)
    view.addSubview(winnerLabel)
    winnerLabel.translatesAutoresizingMaskIntoConstraints = false
    winnerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    winnerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    winnerLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 638).isActive = true
    winnerLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  func createGameView() {
    view.addSubview(gameView)
    
    gameView.translatesAutoresizingMaskIntoConstraints = false
    gameView.backgroundColor = .gray
    gameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    gameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    gameView.heightAnchor.constraint(equalToConstant: 414.0).isActive = true
    gameView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 224).isActive = true
    
    let verticalBenzier = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: 15, height: 414))
    firstLine.path = verticalBenzier.cgPath
    firstLine.fillColor = UIColor.black.cgColor
    firstLine.position = CGPoint(x: 128.0, y: 0)
    self.gameView.layer.addSublayer(firstLine)
    
    secondLine.path = verticalBenzier.cgPath
    secondLine.fillColor = UIColor.black.cgColor
    secondLine.position = CGPoint(x: 271.0, y: 0)
    self.gameView.layer.addSublayer(secondLine)
    
    let horizontalBenzier = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: 414, height: 15))
    thirdLine.path = horizontalBenzier.cgPath
    thirdLine.fillColor = UIColor.black.cgColor
    thirdLine.position = CGPoint(x: 0.0, y: 128)
    self.gameView.layer.addSublayer(thirdLine)
    
    fourthLine.path = horizontalBenzier.cgPath
    fourthLine.fillColor = UIColor.black.cgColor
    fourthLine.position = CGPoint(x: 0.0, y: 271)
    self.gameView.layer.addSublayer(fourthLine)
    
    addButtons()
  }
  
  func addButtons() {
    firstButton.frame = CGRect(x: 15, y: 15, width: 100, height: 100)
    firstButton.backgroundColor = .gray
    if typeOfGame == 1 {
      firstButton.addTarget(self, action: #selector(firstButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      firstButton.addTarget(self, action: #selector(dAIFirstButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      firstButton.addTarget(self, action: #selector(sAIFirstButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.firstButton)
    
    secondButton.frame = CGRect(x: 158, y: 15, width: 100, height: 100)
    secondButton.backgroundColor = .gray
    if typeOfGame == 1 {
      secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      secondButton.addTarget(self, action: #selector(dAISecondButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      secondButton.addTarget(self, action: #selector(sAISecondButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.secondButton)
    
    thirdButton.frame = CGRect(x: 301, y: 15, width: 100, height: 100)
    thirdButton.backgroundColor = .gray
    if typeOfGame == 1 {
      thirdButton.addTarget(self, action: #selector(thirdButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      thirdButton.addTarget(self, action: #selector(dAIThirdButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      thirdButton.addTarget(self, action: #selector(sAIThirdButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.thirdButton)
    
    fourthButton.frame = CGRect(x: 15, y: 158, width: 100, height: 100)
    fourthButton.backgroundColor = .gray
    if typeOfGame == 1 {
      fourthButton.addTarget(self, action: #selector(fourthButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      fourthButton.addTarget(self, action: #selector(dAIFourthButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      fourthButton.addTarget(self, action: #selector(sAIFourthButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.fourthButton)
    
    fifthButton.frame = CGRect(x: 158, y: 158, width: 100, height: 100)
    fifthButton.backgroundColor = .gray
    if typeOfGame == 1 {
      fifthButton.addTarget(self, action: #selector(fifthButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      fifthButton.addTarget(self, action: #selector(dAIFifthButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      fifthButton.addTarget(self, action: #selector(sAIFifthButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.fifthButton)
    
    sixthButton.frame = CGRect(x: 301, y: 158, width: 100, height: 100)
    sixthButton.backgroundColor = .gray
    if typeOfGame == 1 {
      sixthButton.addTarget(self, action: #selector(sixthButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      sixthButton.addTarget(self, action: #selector(dAISixthButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      sixthButton.addTarget(self, action: #selector(sAISixthButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.sixthButton)
    
    seventhButton.frame = CGRect(x: 15, y: 301, width: 100, height: 100)
    seventhButton.backgroundColor = .gray
    if typeOfGame == 1 {
      seventhButton.addTarget(self, action: #selector(seventhButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      seventhButton.addTarget(self, action: #selector(dAISeventhButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      seventhButton.addTarget(self, action: #selector(sAISeventhButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.seventhButton)
    
    eighthButton.frame = CGRect(x: 158, y: 301, width: 100, height: 100)
    eighthButton.backgroundColor = .gray
    if typeOfGame == 1 {
      eighthButton.addTarget(self, action: #selector(eighthButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      eighthButton.addTarget(self, action: #selector(dAIEightButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      eighthButton.addTarget(self, action: #selector(sAIEightButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.eighthButton)
    
    ninethButton.frame = CGRect(x: 301, y: 301, width: 100, height: 100)
    ninethButton.backgroundColor = .gray
    if typeOfGame == 1 {
      ninethButton.addTarget(self, action: #selector(ninethButtonAction), for: .touchUpInside)
    } else if typeOfGame == 2 {
      ninethButton.addTarget(self, action: #selector(dAINinethButtonAction), for: .touchUpInside)
    } else if typeOfGame == 3 {
      ninethButton.addTarget(self, action: #selector(sAINinethButtonAction), for: .touchUpInside)
    }
    gameView.addSubview(self.ninethButton)
  }
  
  
  /////////////////////////////////////////*Console for Human vs Human*////////////////////////////////////////////////////////
  @objc func firstButtonAction(){
    if !playerOneWin && !playerTwoWin && array[0][0] == 0 {
      if !playerBool {
        firstButton.setTitle(playerOne, for: .normal)
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        array[0][0] = 1
      } else {
        firstButton.setTitle(playerTwo, for: .normal)
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
        array[0][0] = 2
      }
      firstButton.titleLabel?.font = .systemFont(ofSize: 70)
      firstButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  @objc func secondButtonAction() {
    if !playerOneWin && !playerTwoWin && array[0][1] == 0 {
      if !playerBool {
        secondButton.setTitle(playerOne, for: .normal)
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        array[0][1] = 1
      } else {
        secondButton.setTitle(playerTwo, for: .normal)
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
        array[0][1] = 2
      }
      secondButton.titleLabel?.font = .systemFont(ofSize: 70)
      secondButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  @objc func thirdButtonAction() {
    if !playerOneWin && !playerTwoWin && array[0][2] == 0 {
      if !playerBool {
        thirdButton.setTitle(playerOne, for: .normal)
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        array[0][2] = 1
      } else {
        thirdButton.setTitle(playerTwo, for: .normal)
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
        array[0][2] = 2
      }
      thirdButton.titleLabel?.font = .systemFont(ofSize: 70)
      thirdButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  @objc func fourthButtonAction() {
    if !playerOneWin && !playerTwoWin && array[1][0] == 0 {
      if !playerBool {
        array[1][0] = 1
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        fourthButton.setTitle(playerOne, for: .normal)
      } else {
        fourthButton.setTitle(playerTwo, for: .normal)
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
        array[1][0] = 2
      }
      fourthButton.titleLabel?.font = .systemFont(ofSize: 70)
      fourthButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  @objc func fifthButtonAction() {
    if !playerOneWin && !playerTwoWin && array[1][1] == 0 {
      if !playerBool {
        fifthButton.setTitle(playerOne, for: .normal)
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        array[1][1] = 1
      } else {
        fifthButton.setTitle(playerTwo, for: .normal)
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
        array[1][1] = 2
      }
      fifthButton.titleLabel?.font = .systemFont(ofSize: 70)
      fifthButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  @objc func sixthButtonAction() {
    if !playerOneWin && !playerTwoWin && array[1][2] == 0 {
      if !playerBool {
        sixthButton.setTitle(playerOne, for: .normal)
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        array[1][2] = 1
      } else {
        sixthButton.setTitle(playerTwo, for: .normal)
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
        array[1][2] = 2
      }
      sixthButton.titleLabel?.font = .systemFont(ofSize: 70)
      sixthButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  @objc func seventhButtonAction() {
    if !playerOneWin && !playerTwoWin && array[2][0] == 0 {
      if !playerBool {
        seventhButton.setTitle(playerOne, for: .normal)
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        array[2][0] = 1
      } else {
        seventhButton.setTitle(playerTwo, for: .normal)
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
        array[2][0] = 2
      }
      seventhButton.titleLabel?.font = .systemFont(ofSize: 70)
      seventhButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  @objc func eighthButtonAction() {
    if !playerOneWin && !playerTwoWin && array[2][1] == 0 {
      if !playerBool {
        eighthButton.setTitle(playerOne, for: .normal)
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        array[2][1] = 1
      } else {
        eighthButton.setTitle(playerTwo, for: .normal)
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
        array[2][1] = 2
      }
      eighthButton.titleLabel?.font = .systemFont(ofSize: 70)
      eighthButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  @objc func ninethButtonAction() {
    if !playerOneWin && !playerTwoWin && array[2][2] == 0 {
      if !playerBool {
        ninethButton.setTitle(playerOne, for: .normal)
        playerOneLabel.text = "player One: "
        playerTwolabel.text = "player Two: Play"
        array[2][2] = 1
      } else {
        ninethButton.setTitle(playerTwo, for: .normal)
        array[2][2] = 2
        playerOneLabel.text = "player One: Play"
        playerTwolabel.text = "player Two: "
      }
      ninethButton.titleLabel?.font = .systemFont(ofSize: 70)
      ninethButton.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  
  
  /////////////////////////////////////////*Console for Human vs DumbAI*////////////////////////////////////////////////////////
  @objc func dAIFirstButtonAction(){
    if !playerOneWin && !playerTwoWin && array[0][0] == 0 {
      firstButton.setTitle(playerOne, for: .normal)
      firstButton.titleLabel?.font = .systemFont(ofSize: 70)
      firstButton.setTitleColor(.black, for: .normal)
      array[0][0] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  @objc func dAISecondButtonAction(){
    if !playerOneWin && !playerTwoWin && array[0][1] == 0 {
      secondButton.setTitle(playerOne, for: .normal)
      secondButton.titleLabel?.font = .systemFont(ofSize: 70)
      secondButton.setTitleColor(.black, for: .normal)
      array[0][1] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  @objc func dAIThirdButtonAction(){
    if !playerOneWin && !playerTwoWin && array[0][2] == 0 {
      thirdButton.setTitle(playerOne, for: .normal)
      thirdButton.titleLabel?.font = .systemFont(ofSize: 70)
      thirdButton.setTitleColor(.black, for: .normal)
      array[0][2] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  @objc func dAIFourthButtonAction(){
    if !playerOneWin && !playerTwoWin && array[1][0] == 0 {
      fourthButton.setTitle(playerOne, for: .normal)
      fourthButton.titleLabel?.font = .systemFont(ofSize: 70)
      fourthButton.setTitleColor(.black, for: .normal)
      array[1][0] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  @objc func dAIFifthButtonAction(){
    if !playerOneWin && !playerTwoWin && array[1][1] == 0 {
      fifthButton.setTitle(playerOne, for: .normal)
      fifthButton.titleLabel?.font = .systemFont(ofSize: 70)
      fifthButton.setTitleColor(.black, for: .normal)
      array[1][1] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  @objc func dAISixthButtonAction(){
    if !playerOneWin && !playerTwoWin && array[1][2] == 0 {
      sixthButton.setTitle(playerOne, for: .normal)
      sixthButton.titleLabel?.font = .systemFont(ofSize: 70)
      sixthButton.setTitleColor(.black, for: .normal)
      array[1][2] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  @objc func dAISeventhButtonAction(){
    if !playerOneWin && !playerTwoWin && array[2][0] == 0 {
      seventhButton.setTitle(playerOne, for: .normal)
      seventhButton.titleLabel?.font = .systemFont(ofSize: 70)
      seventhButton.setTitleColor(.black, for: .normal)
      array[2][0] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  @objc func dAIEightButtonAction(){
    if !playerOneWin && !playerTwoWin && array[2][1] == 0 {
      eighthButton.setTitle(playerOne, for: .normal)
      eighthButton.titleLabel?.font = .systemFont(ofSize: 70)
      eighthButton.setTitleColor(.black, for: .normal)
      array[2][1] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  @objc func dAINinethButtonAction(){
    if !playerOneWin && !playerTwoWin && array[2][2] == 0 {
      ninethButton.setTitle(playerOne, for: .normal)
      ninethButton.titleLabel?.font = .systemFont(ofSize: 70)
      ninethButton.setTitleColor(.black, for: .normal)
      array[2][2] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  
  
  /////////////////////////////////////////*Console for Human vs SmartAI*////////////////////////////////////////////////////////
  @objc func sAIFirstButtonAction(){
    if !playerOneWin && !playerTwoWin && array[0][0] == 0 {
      firstButton.setTitle(playerOne, for: .normal)
      firstButton.titleLabel?.font = .systemFont(ofSize: 70)
      firstButton.setTitleColor(.black, for: .normal)
      array[0][0] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  @objc func sAISecondButtonAction(){
    if !playerOneWin && !playerTwoWin && array[0][1] == 0 {
      secondButton.setTitle(playerOne, for: .normal)
      secondButton.titleLabel?.font = .systemFont(ofSize: 70)
      secondButton.setTitleColor(.black, for: .normal)
      array[0][1] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  @objc func sAIThirdButtonAction(){
    if !playerOneWin && !playerTwoWin && array[0][2] == 0 {
      thirdButton.setTitle(playerOne, for: .normal)
      thirdButton.titleLabel?.font = .systemFont(ofSize: 70)
      thirdButton.setTitleColor(.black, for: .normal)
      array[0][2] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  @objc func sAIFourthButtonAction(){
    if !playerOneWin && !playerTwoWin && array[1][0] == 0 {
      fourthButton.setTitle(playerOne, for: .normal)
      fourthButton.titleLabel?.font = .systemFont(ofSize: 70)
      fourthButton.setTitleColor(.black, for: .normal)
      array[1][0] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  @objc func sAIFifthButtonAction(){
    if !playerOneWin && !playerTwoWin && array[1][1] == 0 {
      fifthButton.setTitle(playerOne, for: .normal)
      fifthButton.titleLabel?.font = .systemFont(ofSize: 70)
      fifthButton.setTitleColor(.black, for: .normal)
      array[1][1] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  @objc func sAISixthButtonAction(){
    if !playerOneWin && !playerTwoWin && array[1][2] == 0 {
      sixthButton.setTitle(playerOne, for: .normal)
      sixthButton.titleLabel?.font = .systemFont(ofSize: 70)
      sixthButton.setTitleColor(.black, for: .normal)
      array[1][2] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  @objc func sAISeventhButtonAction(){
    if !playerOneWin && !playerTwoWin && array[2][0] == 0 {
      seventhButton.setTitle(playerOne, for: .normal)
      seventhButton.titleLabel?.font = .systemFont(ofSize: 70)
      seventhButton.setTitleColor(.black, for: .normal)
      array[2][0] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  @objc func sAIEightButtonAction(){
    if !playerOneWin && !playerTwoWin && array[2][1] == 0 {
      eighthButton.setTitle(playerOne, for: .normal)
      eighthButton.titleLabel?.font = .systemFont(ofSize: 70)
      eighthButton.setTitleColor(.black, for: .normal)
      array[2][1] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  @objc func sAINinethButtonAction(){
    if !playerOneWin && !playerTwoWin && array[2][2] == 0 {
      ninethButton.setTitle(playerOne, for: .normal)
      ninethButton.titleLabel?.font = .systemFont(ofSize: 70)
      ninethButton.setTitleColor(.black, for: .normal)
      array[2][2] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  func isGameOver() {
    
    var drawIndex = 0
    
    for i in 0..<array.count {
      if array[i][0] == 1 && array[i][1] == 1 && array[i][2] == 1{
        playerOneWin = true
        winnerLabel.text = "Player One Wins"
      } else if array[i][0] == 2 && array[i][1] == 2 && array[i][2] == 2{
        playerTwoWin = true
        winnerLabel.text = "Player Two Wins"
      }
      
      if array[0][i] == 1 && array[1][i] == 1 && array[2][i] == 1{
        playerOneWin = true
        winnerLabel.text = "Player One Wins"
      } else if array[0][i] == 2 && array[1][i] == 2 && array[2][i] == 2{
        playerTwoWin = true
        winnerLabel.text = "Player Two Wins"
      }
      if array[i][0] != 0 && array[i][1] != 0 && array[i][2] != 0 {
        drawIndex+=1
      }
    }
    
    if drawIndex == 3 {
      winnerLabel.text = "Draw"
    }
    
    if array[0][0] == 1 && array[1][1] == 1 && array[2][2] == 1 {
      playerOneWin = true
      winnerLabel.text = "Player One Wins"
    } else if array[0][0] == 2 && array[1][1] == 2 && array[2][2] == 2 {
      playerTwoWin = true
      winnerLabel.text = "Player Two Wins"
    }
    if array[0][2] == 1 && array[1][1] == 1 && array[2][0] == 1 {
      playerOneWin = true
      winnerLabel.text = "Player One Wins"
    } else if array[0][2] == 2 && array[1][1] == 2 && array[2][0] == 2 {
      playerTwoWin = true
      winnerLabel.text = "Player Two Wins"
    }
  }
  
  func dumbAI() {
    playedSpots = availableToPlay()
    if playedSpots.count > 0 && !playerOneWin {
      let randomNumber = Int.random(in: 0..<playedSpots.count)
      let numberInArray = playedSpots[randomNumber]

      if numberInArray == 0 {
        array[0][numberInArray] = 2
        firstButton.setTitle(playerTwo, for: .normal)
        firstButton.titleLabel?.font = .systemFont(ofSize: 70)
        firstButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 1 {
        array[0][numberInArray] = 2
        secondButton.setTitle(playerTwo, for: .normal)
        secondButton.titleLabel?.font = .systemFont(ofSize: 70)
        secondButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 2 {
        array[0][numberInArray] = 2
        thirdButton.setTitle(playerTwo, for: .normal)
        thirdButton.titleLabel?.font = .systemFont(ofSize: 70)
        thirdButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 3 {
        array[1][numberInArray-3] = 2
        fourthButton.setTitle(playerTwo, for: .normal)
        fourthButton.titleLabel?.font = .systemFont(ofSize: 70)
        fourthButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 4 {
        array[1][numberInArray-3] = 2
        fifthButton.setTitle(playerTwo, for: .normal)
        fifthButton.titleLabel?.font = .systemFont(ofSize: 70)
        fifthButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 5 {
        array[1][numberInArray-3] = 2
        sixthButton.setTitle(playerTwo, for: .normal)
        sixthButton.titleLabel?.font = .systemFont(ofSize: 70)
        sixthButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 6 {
        array[2][numberInArray-6] = 2
        seventhButton.setTitle(playerTwo, for: .normal)
        seventhButton.titleLabel?.font = .systemFont(ofSize: 70)
        seventhButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 7 {
        array[2][numberInArray-6] = 2
        eighthButton.setTitle(playerTwo, for: .normal)
        eighthButton.titleLabel?.font = .systemFont(ofSize: 70)
        eighthButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 8 {
        array[2][numberInArray-6] = 2
        ninethButton.setTitle(playerTwo, for: .normal)
        ninethButton.titleLabel?.font = .systemFont(ofSize: 70)
        ninethButton.setTitleColor(.black, for: .normal)
      }
    }
  }
  
  
  
  func smartAI() {
    playedSpots = availableToPlay()
    if playedSpots.count > 0 && !playerOneWin {
      
      
      var randomNumber = Int.random(in: 0..<playedSpots.count)
      var numberInArray = playedSpots[randomNumber]
      let mustPlay = theOptions(usedArray: playedSpots, good: false)
      
      if mustPlay.count > 0 {
        numberInArray = mustPlay[0]
      }
      
      let options = theOptions(usedArray: playedSpots, good: true)
      
      if options.count > 0 {
        randomNumber = Int.random(in: 0..<options.count)
        numberInArray = options[randomNumber]
        
        let betterOption = theOptions(usedArray: options, good: false)

        if betterOption.count > 0 {
          randomNumber = Int.random(in: 0..<betterOption.count)
          numberInArray = betterOption[randomNumber]
        }
      }
    
      

      if numberInArray == 0 {
        array[0][numberInArray] = 2
        firstButton.setTitle(playerTwo, for: .normal)
        firstButton.titleLabel?.font = .systemFont(ofSize: 70)
        firstButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 1 {
        array[0][numberInArray] = 2
        secondButton.setTitle(playerTwo, for: .normal)
        secondButton.titleLabel?.font = .systemFont(ofSize: 70)
        secondButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 2 {
        array[0][numberInArray] = 2
        thirdButton.setTitle(playerTwo, for: .normal)
        thirdButton.titleLabel?.font = .systemFont(ofSize: 70)
        thirdButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 3 {
        array[1][numberInArray-3] = 2
        fourthButton.setTitle(playerTwo, for: .normal)
        fourthButton.titleLabel?.font = .systemFont(ofSize: 70)
        fourthButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 4 {
        array[1][numberInArray-3] = 2
        fifthButton.setTitle(playerTwo, for: .normal)
        fifthButton.titleLabel?.font = .systemFont(ofSize: 70)
        fifthButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 5 {
        array[1][numberInArray-3] = 2
        sixthButton.setTitle(playerTwo, for: .normal)
        sixthButton.titleLabel?.font = .systemFont(ofSize: 70)
        sixthButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 6 {
        array[2][numberInArray-6] = 2
        seventhButton.setTitle(playerTwo, for: .normal)
        seventhButton.titleLabel?.font = .systemFont(ofSize: 70)
        seventhButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 7 {
        array[2][numberInArray-6] = 2
        eighthButton.setTitle(playerTwo, for: .normal)
        eighthButton.titleLabel?.font = .systemFont(ofSize: 70)
        eighthButton.setTitleColor(.black, for: .normal)
      }

      if numberInArray == 8 {
        array[2][numberInArray-6] = 2
        ninethButton.setTitle(playerTwo, for: .normal)
        ninethButton.titleLabel?.font = .systemFont(ofSize: 70)
        ninethButton.setTitleColor(.black, for: .normal)
      }
    }
  }
  
  func availableToPlay() -> [Int] {
    var output: [Int] = []
    for i in 0..<array.count {
      if array[0][i] == 0 {
        output.append(i)
      }
      if array[1][i] == 0 {
        output.append(i+3)
      }
      if array[2][i] == 0 {
        output.append(i+6)
      }
    }
    return output
  }
  
  func theOptions(usedArray: [Int], good: Bool) -> [Int] {
    
    var outPut: [Int] = []
    var num = 2
    if !good {
      num = 1
    }
    
    for element in usedArray {
      
      var index = 0
      var demoArray = array
      var demoPlayerWin = false
      
      if element == 0 {
        demoArray[0][element] = num
      }
      if element == 1 {
        demoArray[0][element] = num
      }
      if element == 2 {
        demoArray[0][element] = num
      }
      if element == 3 {
        demoArray[1][element-3] = num
      }
      if element == 4 {
        demoArray[1][element-3] = num
      }
      if element == 5 {
        demoArray[1][element-3] = num
      }
      if element == 6 {
        demoArray[2][element-6] = num
      }
      if element == 7 {
        demoArray[2][element-6] = num
      }
      if element == 8 {
        demoArray[2][element-6] = num
      }
      
      for i in 0..<demoArray.count {
        if demoArray[i][0] == num && demoArray[i][1] == num && demoArray[i][2] == num {
          demoPlayerWin = true
        }
        
        if demoArray[0][i] == num && demoArray[1][i] == num && demoArray[2][i] == num {
          demoPlayerWin = true
        }
      }
      
      if demoArray[0][0] == num && demoArray[1][1] == num && demoArray[2][2] == num {
        demoPlayerWin = true
      }
      if demoArray[0][2] == num && demoArray[1][1] == num && demoArray[2][0] == num {
        demoPlayerWin = true
      }
      
      if demoPlayerWin {
        if num == 1 {
          outPut = [element]
        }
        if num == 2 {
          outPut.append(element)
        }
      }
      
      index+=1
    }
    
    return outPut
  }
  
}

