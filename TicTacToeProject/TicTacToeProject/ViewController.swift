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
  let playerLabel = [UILabel(), UILabel()]
  let winnerLabel = UILabel()
  let line = [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()]
  let buttons = [[UIButton(), UIButton(), UIButton()], [UIButton(), UIButton(), UIButton()], [UIButton(), UIButton(), UIButton()]]
  let restartButton = UIButton()
  var player = ["X", "O"]
  var playerBool = false
  var playerWin = [false, false]
  var array = [[0,0,0],[0,0,0],[0,0,0]]
  var typeOfGame: Int!
  var playedSpots: [Int]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .black
    playerLabel[0].text = "Player One: Play"
    playerLabel[1].text = "Player Two: "
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
    
    for i in 0..<buttons.count {
      for j in 0..<buttons.count {
        buttons[i][j].setTitle("", for: .normal)
      }
    }
    
    playerLabel[0].text = "Player One: Play"
    playerLabel[1].text = "Player Two: "
    
    
    winnerLabel.text = "Game On"
    
    playerBool = false
    playerWin[0] = false
    playerWin[1] = false
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
    playerLabel[0].text = "player One: Play"
    playerLabel[0].backgroundColor = .blue
    playerLabel[0].font = .systemFont(ofSize: 29)
    view.addSubview(playerLabel[0])
    playerLabel[0].translatesAutoresizingMaskIntoConstraints = false
    playerLabel[0].leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    playerLabel[0].heightAnchor.constraint(equalToConstant: 40).isActive = true
    playerLabel[0].widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
    playerLabel[0].topAnchor.constraint(equalTo: self.view.topAnchor, constant: 184).isActive = true
    
    playerLabel[1].text = "player Two: "
    playerLabel[1].backgroundColor = .red
    playerLabel[1].font = .systemFont(ofSize: 29)
    view.addSubview(playerLabel[1])
    playerLabel[1].translatesAutoresizingMaskIntoConstraints = false
    playerLabel[1].trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    playerLabel[1].widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
    playerLabel[1].heightAnchor.constraint(equalToConstant: 40).isActive = true
    playerLabel[1].topAnchor.constraint(equalTo: self.view.topAnchor, constant: 184).isActive = true
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
    useToCreateGameView(setLine: line[0], benzierPath: verticalBenzier, position: [128,0])
    useToCreateGameView(setLine: line[1], benzierPath: verticalBenzier, position: [271,0])
    
    let horizontalBenzier = UIBezierPath(rect: CGRect(x: 0.0, y: 0.0, width: 414, height: 15))
    useToCreateGameView(setLine: line[2], benzierPath: horizontalBenzier, position: [0,128])
    useToCreateGameView(setLine: line[3], benzierPath: horizontalBenzier, position: [0,271])
    
    addButtons()
  }
  
  func useToCreateGameView(setLine: CAShapeLayer, benzierPath: UIBezierPath, position:[Int]) {
    setLine.path = benzierPath.cgPath
    setLine.fillColor = UIColor.black.cgColor
    setLine.position = CGPoint(x: position[0], y: position[1])
    self.gameView.layer.addSublayer(setLine)
  }
  
  func addButtons() {
    useToCreateAddButton(button: buttons[0][0], position: [15,15], typeOneAction: #selector(firstButtonAction), typeTwoAction: #selector(dAIFirstButtonAction), typeThreeAction: #selector(sAIFirstButtonAction))
    
    useToCreateAddButton(button: buttons[0][1], position: [158,15], typeOneAction: #selector(secondButtonAction), typeTwoAction: #selector(dAISecondButtonAction), typeThreeAction: #selector(sAISecondButtonAction))
    
    useToCreateAddButton(button: buttons[0][2], position: [301,15], typeOneAction: #selector(thirdButtonAction), typeTwoAction: #selector(dAIThirdButtonAction), typeThreeAction: #selector(sAIThirdButtonAction))
    
    useToCreateAddButton(button: buttons[1][0], position: [15,158], typeOneAction: #selector(fourthButtonAction), typeTwoAction: #selector(dAIFourthButtonAction), typeThreeAction: #selector(sAIFourthButtonAction))
    
    useToCreateAddButton(button: buttons[1][1], position: [158,158], typeOneAction: #selector(fifthButtonAction), typeTwoAction: #selector(dAIFifthButtonAction), typeThreeAction: #selector(sAIFifthButtonAction))
    
    useToCreateAddButton(button: buttons[1][2], position: [301,158], typeOneAction: #selector(sixthButtonAction), typeTwoAction: #selector(dAISixthButtonAction), typeThreeAction: #selector(sAISixthButtonAction))
    
    useToCreateAddButton(button: buttons[2][0], position: [15,301], typeOneAction: #selector(seventhButtonAction), typeTwoAction: #selector(dAISeventhButtonAction), typeThreeAction: #selector(sAISeventhButtonAction))
    
    useToCreateAddButton(button: buttons[2][1], position: [158,301], typeOneAction: #selector(eighthButtonAction), typeTwoAction: #selector(dAIEightButtonAction), typeThreeAction: #selector(sAIEightButtonAction))
    
    useToCreateAddButton(button: buttons[2][2], position: [301,301], typeOneAction: #selector(ninethButtonAction), typeTwoAction: #selector(dAINinethButtonAction), typeThreeAction: #selector(sAINinethButtonAction))
  }
  
  func useToCreateAddButton(button: UIButton, position: [Int], typeOneAction: Selector, typeTwoAction: Selector, typeThreeAction: Selector) {
    button.frame = CGRect(x: position[0], y: position[1], width: 100, height: 100)
    button.backgroundColor = .gray
    if typeOfGame == 1 {
      button.addTarget(self, action: typeOneAction, for: .touchUpInside)
    } else if typeOfGame == 2 {
      button.addTarget(self, action: typeTwoAction, for: .touchUpInside)
    } else if typeOfGame == 3 {
      button.addTarget(self, action: typeThreeAction, for: .touchUpInside)
    }
    gameView.addSubview(button)
  }
  
  /////////////////////////////////////////*Console for Human vs Human*////////////////////////////////////////////////////////
  @objc func firstButtonAction(){
    useToCreateHumanVsHuman(button: buttons[0][0], myIndex: [0,0])
  }
  
  @objc func secondButtonAction() {
    useToCreateHumanVsHuman(button: buttons[0][1], myIndex: [0,1])
  }
  
  @objc func thirdButtonAction() {
    useToCreateHumanVsHuman(button: buttons[0][2], myIndex: [0,2])
  }
  
  @objc func fourthButtonAction() {
    useToCreateHumanVsHuman(button: buttons[1][0], myIndex: [1,0])
  }
  
  @objc func fifthButtonAction() {
    useToCreateHumanVsHuman(button: buttons[1][1], myIndex: [1,1])
  }
  
  @objc func sixthButtonAction() {
    useToCreateHumanVsHuman(button: buttons[1][2], myIndex: [1,2])
  }
  
  @objc func seventhButtonAction() {
    useToCreateHumanVsHuman(button: buttons[2][0], myIndex: [2,0])
  }
  
  @objc func eighthButtonAction() {
    useToCreateHumanVsHuman(button: buttons[2][1], myIndex: [2,1])
  }
  
  @objc func ninethButtonAction() {
    useToCreateHumanVsHuman(button: buttons[2][2], myIndex: [2,2])
  }
  
  func useToCreateHumanVsHuman(button: UIButton, myIndex: [Int]) {
    if !playerWin[0] && !playerWin[1] && array[myIndex[0]][myIndex[1]] == 0 {
      if !playerBool {
        button.setTitle(player[0], for: .normal)
        playerLabel[0].text = "player One: "
        playerLabel[1].text = "player Two: Play"
        array[myIndex[0]][myIndex[1]] = 1
      } else {
        button.setTitle(player[1], for: .normal)
        playerLabel[0].text = "player One: Play"
        playerLabel[1].text = "player Two: "
        array[myIndex[0]][myIndex[1]] = 2
      }
      button.titleLabel?.font = .systemFont(ofSize: 70)
      button.setTitleColor(.black, for: .normal)
      playerBool = !playerBool
      isGameOver()
    }
  }
  
  /////////////////////////////////////////*Console for Human vs DumbAI*////////////////////////////////////////////////////////
  @objc func dAIFirstButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[0][0], myIndex: [0,0])
  }
  
  @objc func dAISecondButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[0][1], myIndex: [0,1])
  }
  
  @objc func dAIThirdButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[0][2], myIndex: [0,2])
  }
  
  @objc func dAIFourthButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[1][0], myIndex: [1,0])
  }
  
  @objc func dAIFifthButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[1][1], myIndex: [1,1])
  }
  
  @objc func dAISixthButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[1][2], myIndex: [1,2])
  }
  
  @objc func dAISeventhButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[2][0], myIndex: [2,0])
  }
  
  @objc func dAIEightButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[2][1], myIndex: [2,1])
  }
  
  @objc func dAINinethButtonAction(){
    useToCreateHumanVsDumbAI(button: buttons[2][2], myIndex: [2,2])
  }
  
  func useToCreateHumanVsDumbAI(button: UIButton, myIndex: [Int]) {
    if !playerWin[0] && !playerWin[1] && array[myIndex[0]][myIndex[1]] == 0 {
      button.setTitle(player[0], for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 70)
      button.setTitleColor(.black, for: .normal)
      array[myIndex[0]][myIndex[1]] = 1
      isGameOver()
      dumbAI()
      isGameOver()
    }
  }
  
  /////////////////////////////////////////*Console for Human vs SmartAI*////////////////////////////////////////////////////////
  @objc func sAIFirstButtonAction(){
    useToCreatSmartAI(button: buttons[0][0], myIndex: [0,0])
  }
  
  @objc func sAISecondButtonAction(){
    useToCreatSmartAI(button: buttons[0][1], myIndex: [0,1])
  }
  
  @objc func sAIThirdButtonAction(){
    useToCreatSmartAI(button: buttons[0][2], myIndex: [0,2])
  }
  
  @objc func sAIFourthButtonAction(){
    useToCreatSmartAI(button: buttons[1][0], myIndex: [1,0])
  }
  
  @objc func sAIFifthButtonAction(){
    useToCreatSmartAI(button: buttons[1][1], myIndex: [1,1])
  }
  
  @objc func sAISixthButtonAction(){
    useToCreatSmartAI(button: buttons[1][2], myIndex: [1,2])
  }
  
  @objc func sAISeventhButtonAction(){
    useToCreatSmartAI(button: buttons[2][0], myIndex: [2,0])
  }
  
  @objc func sAIEightButtonAction(){
    useToCreatSmartAI(button: buttons[2][1], myIndex: [2,1])
  }
  
  @objc func sAINinethButtonAction(){
    useToCreatSmartAI(button: buttons[2][2], myIndex: [2,2])
  }
  
  func useToCreatSmartAI(button: UIButton, myIndex: [Int]) {
    if !playerWin[0] && !playerWin[1] && array[myIndex[0]][myIndex[1]] == 0 {
      button.setTitle(player[0], for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 70)
      button.setTitleColor(.black, for: .normal)
      array[myIndex[0]][myIndex[1]] = 1
      isGameOver()
      smartAI()
      isGameOver()
    }
  }
  
  func isGameOver() {
    
    var drawIndex = 0
    
    for i in 0..<array.count {
      if array[i][0] == 1 && array[i][1] == 1 && array[i][2] == 1{
        playerWin[0] = true
        winnerLabel.text = "Player One Wins"
      } else if array[i][0] == 2 && array[i][1] == 2 && array[i][2] == 2{
        playerWin[1] = true
        winnerLabel.text = "Player Two Wins"
      }
      
      if array[0][i] == 1 && array[1][i] == 1 && array[2][i] == 1{
        playerWin[0] = true
        winnerLabel.text = "Player One Wins"
      } else if array[0][i] == 2 && array[1][i] == 2 && array[2][i] == 2{
        playerWin[1] = true
        winnerLabel.text = "Player Two Wins"
      }
      if array[i][0] != 0 && array[i][1] != 0 && array[i][2] != 0 {
        drawIndex+=1
      }
    }
    
    if drawIndex == 3 && playerWin[0] == false && playerWin[1] == false {
      winnerLabel.text = "Draw"
    }
    
    if array[0][0] == 1 && array[1][1] == 1 && array[2][2] == 1 {
      playerWin[0] = true
      winnerLabel.text = "Player One Wins"
    } else if array[0][0] == 2 && array[1][1] == 2 && array[2][2] == 2 {
      playerWin[1] = true
      winnerLabel.text = "Player Two Wins"
    }
    if array[0][2] == 1 && array[1][1] == 1 && array[2][0] == 1 {
      playerWin[0] = true
      winnerLabel.text = "Player One Wins"
    } else if array[0][2] == 2 && array[1][1] == 2 && array[2][0] == 2 {
      playerWin[1] = true
      winnerLabel.text = "Player Two Wins"
    }
  }
  
  func dumbAI() {
    playedSpots = availableToPlay(whichArray: array)
    if playedSpots.count > 0 && !playerWin[0] {
      let randomNumber = Int.random(in: 0..<playedSpots.count)
      let numberInArray = playedSpots[randomNumber]
      
      var sub = 0
      var row = 0
      
      if numberInArray > 2 {
        sub = 3
        row = 1
      }
      if numberInArray > 5 {
        sub = 6
        row = 2
      }
      
      array[row][numberInArray-sub] = 2
      buttons[row][numberInArray-sub].setTitle(player[1], for: .normal)
      buttons[row][numberInArray-sub].titleLabel?.font = .systemFont(ofSize: 70)
      buttons[row][numberInArray-sub].setTitleColor(.black, for: .normal)
    }
  }
  
  
  func smartAI() {
    playedSpots = availableToPlay(whichArray: array)
    if playedSpots.count > 0 && !playerWin[0] {
      
      var randomNumber = Int.random(in: 0..<playedSpots.count)
      var numberInArray = playedSpots[randomNumber]
      
      let mustPlay = theOptions(usedArray: playedSpots, good: false, justAddedArray: array)
      
      if mustPlay.count == 1 {
        numberInArray = mustPlay[0]
      }
      
      let options = theOptions(usedArray: playedSpots, good: true, justAddedArray: array)
      
      if options.count > 0 {
        randomNumber = Int.random(in: 0..<options.count)
        numberInArray = options[randomNumber]
        
        let betterOption = theOptions(usedArray: options, good: false, justAddedArray: array)
        
        if betterOption.count > 0 {
          randomNumber = Int.random(in: 0..<betterOption.count)
          numberInArray = betterOption[randomNumber]
        }
      }
      
      var sub = 0
      var row = 0
      
      if numberInArray > 2 {
        sub = 3
        row = 1
      }
      if numberInArray > 5 {
        sub = 6
        row = 2
      }
      
      array[row][numberInArray-sub] = 2
      buttons[row][numberInArray-sub].setTitle(player[1], for: .normal)
      buttons[row][numberInArray-sub].titleLabel?.font = .systemFont(ofSize: 70)
      buttons[row][numberInArray-sub].setTitleColor(.black, for: .normal)
    }
  }
  
  func availableToPlay(whichArray: [[Int]]) -> [Int] {
    var output: [Int] = []
    for i in 0..<whichArray.count {
      if whichArray[0][i] == 0 {
        output.append(i)
      }
      if whichArray[1][i] == 0 {
        output.append(i+3)
      }
      if whichArray[2][i] == 0 {
        output.append(i+6)
      }
    }
    return output
  }
  
  func theOptions(usedArray: [Int], good: Bool, justAddedArray: [[Int]]) -> [Int] {
    
    var outPut: [Int] = []
    var num = 2
    if !good {
      num = 1
    }
    
    for element in usedArray {
      
      var index = 0
      var demoArray = justAddedArray
      var demoPlayerWin = false
      
      var sub = 0
      var row = 0
      
      if element > 2 {
        sub = 3
        row = 1
      }
      if element > 5 {
        sub = 6
        row = 2
      }
      
      demoArray[row][element-sub] = num
      
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


