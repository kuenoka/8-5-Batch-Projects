//
//  ViewController.swift
//  CheckersProject
//
//  Created by MCS on 11/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let board = UIView()
  let builderPlotArray = [UIView(),UIView(),UIView(),UIView(),UIView()]
  var plots = [[Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0)], [Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1)], [Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 1), Plot(plotView: UIView(), state: 0)],    [Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3)], [Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0)], [Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3)],  [Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 3), Plot(plotView: UIView(), state: 0)]   , [Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2)], [Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0)],    [Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2), Plot(plotView: UIView(), state: 0), Plot(plotView: UIView(), state: 2)]]
  var plotColorBool = true
  var pOnePieces = [Piece(button: UIButton(type: .custom), location: [0,0]), Piece(button: UIButton(type: .custom), location: [0,2]), Piece(button: UIButton(type: .custom), location: [0,4]), Piece(button: UIButton(type: .custom), location: [0,6]), Piece(button: UIButton(type: .custom), location: [0,8]), Piece(button: UIButton(type: .custom), location: [1,1]), Piece(button: UIButton(type: .custom), location: [1,3]), Piece(button: UIButton(type: .custom), location: [1,5]), Piece(button: UIButton(type: .custom), location: [1,7]), Piece(button: UIButton(type: .custom), location: [1,9]), Piece(button: UIButton(type: .custom), location: [2,0]), Piece(button: UIButton(type: .custom), location: [2,2]), Piece(button: UIButton(type: .custom), location: [2,4]), Piece(button: UIButton(type: .custom), location: [2,6]), Piece(button: UIButton(type: .custom), location: [2,8])]
  var pTwoPieces = [Piece(button: UIButton(type: .custom), location: [7,1]), Piece(button: UIButton(type: .custom), location: [7,3]), Piece(button: UIButton(type: .custom), location: [7,5]), Piece(button: UIButton(type: .custom), location: [7,7]), Piece(button: UIButton(type: .custom), location: [7,9]), Piece(button: UIButton(type: .custom), location: [8,0]), Piece(button: UIButton(type: .custom), location: [8,2]), Piece(button: UIButton(type: .custom), location: [8,4]), Piece(button: UIButton(type: .custom), location: [8,6]), Piece(button: UIButton(type: .custom), location: [8,8]), Piece(button: UIButton(type: .custom), location: [9,1]), Piece(button: UIButton(type: .custom), location: [9,3]), Piece(button: UIButton(type: .custom), location: [9,5]), Piece(button: UIButton(type: .custom), location: [9,7]), Piece(button: UIButton(type: .custom), location: [9,9])]
  var newGame = UIButton()
  var gameWinner = UILabel()
  var gameName = UILabel()
  var backGroundView = UIView()
  var backGroundDesign = [[CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()], [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()], [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()], [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()], [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()], [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()], [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()], [CAShapeLayer(), CAShapeLayer(), CAShapeLayer(), CAShapeLayer()]]
  var backGroundDesignColorBool = true
  var pOneLives = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  var pTwoLives = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  let firstTappedGestureRecogniser = UITapGestureRecognizer()
  let secondTappedGestureRecogniser = UITapGestureRecognizer()
  let thirdTappedGestureRecogniser = UITapGestureRecognizer()
  let fourthTappedGestureRecogniser = UITapGestureRecognizer()
  let sFirstTappedGestureRecogniser = UITapGestureRecognizer()
  let sSecondTappedGestureRecogniser = UITapGestureRecognizer()
  let sThirdTappedGestureRecogniser = UITapGestureRecognizer()
  let sFourthTappedGestureRecogniser = UITapGestureRecognizer()
  var currentLocation = [0,0]
  var nextLocation = [[10,10], [10,10], [10,10], [10,10]]
  var nextLocationBool = [false, false, false, false]
  var lastLocation = [[0,0], [0,0], [0,0], [0,0]]
  var piece = 0
  var playerTurn = true
  var playerOneKill = [false, false, false, false]
  var playerTwoKill = [false, false, false, false]
  var kingMeBool = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
  var sKingMeBool = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
  var moreKillBool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .darkGray
    createBackGroundView()
    createBoard()
    createGameName()
    createGameWinner()
    createNewGame()
  }
  
  func createBackGroundView() {
    view.addSubview(backGroundView)
    backGroundView.translatesAutoresizingMaskIntoConstraints = false
    backGroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    backGroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    backGroundView.heightAnchor.constraint(equalToConstant: 800).isActive = true
    backGroundView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    createBackGroundViewDesign()
  }
  
  func createBackGroundViewDesign() {
    var position = [0,0]
    for i in 0..<backGroundDesign.count {
      for j in 0..<backGroundDesign[0].count {
        useToCreateBackGroundViewDesign(index: [i, j], position: position)
        position[1] += 100
        backGroundDesignColorBool = !backGroundDesignColorBool
      }
      backGroundDesignColorBool = !backGroundDesignColorBool
      position[1] = 0
      position[0] += 100
    }
  }
  
  func useToCreateBackGroundViewDesign(index: [Int], position: [Int]) {
    let square = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
    if backGroundDesignColorBool {
      backGroundDesign[index[0]][index[1]].fillColor = UIColor.gray.cgColor
    } else if backGroundDesignColorBool {
      backGroundDesign[index[0]][index[1]].fillColor = UIColor.black.cgColor
    }
    backGroundDesign[index[0]][index[1]].path = square.cgPath
    backGroundDesign[index[0]][index[1]].position = CGPoint(x: position[1], y: position[0])
    backGroundView.layer.addSublayer(backGroundDesign[index[0]][index[1]])
  }
  
  func createBoard() {
    view.addSubview(board)
    board.translatesAutoresizingMaskIntoConstraints = false
    board.topAnchor.constraint(equalTo: view.topAnchor, constant: 224).isActive = true
    board.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
    board.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
    board.heightAnchor.constraint(equalToConstant: 410).isActive = true
    createBuilderPlot()
    createPieces()
  }
  
  func createBuilderPlot() {
    
    setupBuilderPlotConstraint(builderPlot: builderPlotArray[0], index: [0,1])
    builderPlotArray[0].topAnchor.constraint(equalTo: board.topAnchor).isActive = true
    
    var newOffset = 82
    
    for i in 1...4 {
      let myIndex = [i*2,(i*2)+1]
      setupBuilderPlotConstraint(builderPlot: builderPlotArray[i], index: myIndex)
      builderPlotArray[i].topAnchor.constraint(equalTo: board.topAnchor, constant: CGFloat(newOffset)).isActive = true
      newOffset+=82
    }
    
  }
  
  func setupBuilderPlotConstraint(builderPlot: UIView, index: [Int]) {
    board.addSubview(builderPlot)
    createPlots(pBuilderPlot: builderPlot, pIndex: index)
    builderPlot.translatesAutoresizingMaskIntoConstraints = false
    builderPlot.leadingAnchor.constraint(equalTo: board.leadingAnchor).isActive = true
    builderPlot.heightAnchor.constraint(equalToConstant: 82).isActive = true
    builderPlot.widthAnchor.constraint(equalToConstant: 410).isActive = true
  }
  
  func createPlots(pBuilderPlot: UIView, pIndex: [Int]) {
    
    setupPlotConstraint(plot: plots[pIndex[0]][0], ppBuilderPlot: pBuilderPlot, firstColor: .gray, secondColor: .black, offSet: 0)
    plots[pIndex[0]][0].plotView.leadingAnchor.constraint(equalTo: pBuilderPlot.leadingAnchor).isActive = true
    
    for i in 1...9 {
      setupPlotConstraint(plot: plots[pIndex[0]][i], ppBuilderPlot: pBuilderPlot, firstColor: .gray, secondColor: .black, offSet: 0)
      plots[pIndex[0]][i].plotView.leadingAnchor.constraint(equalTo: plots[pIndex[0]][i-1].plotView.trailingAnchor).isActive = true
    }
    
    
    setupPlotConstraint(plot: plots[pIndex[1]][0], ppBuilderPlot: pBuilderPlot, firstColor: .black, secondColor: .gray, offSet: 41)
    plots[pIndex[1]][0].plotView.leadingAnchor.constraint(equalTo: pBuilderPlot.leadingAnchor).isActive = true
    
    for i in 1...9 {
      setupPlotConstraint(plot: plots[pIndex[1]][i], ppBuilderPlot: pBuilderPlot, firstColor: .black, secondColor: .gray, offSet: 41)
      plots[pIndex[1]][i].plotView.leadingAnchor.constraint(equalTo: plots[pIndex[1]][i-1].plotView.trailingAnchor).isActive = true
    }
  }
  
  func setupPlotConstraint(plot: Plot, ppBuilderPlot: UIView, firstColor: UIColor, secondColor: UIColor, offSet: CGFloat) {
    ppBuilderPlot.addSubview(plot.plotView)
    plot.plotView.backgroundColor = firstColor
    if plotColorBool {
      plot.plotView.backgroundColor = secondColor
    }
    plotColorBool = !plotColorBool
    plot.plotView.translatesAutoresizingMaskIntoConstraints = false
    plot.plotView.topAnchor.constraint(equalTo: ppBuilderPlot.topAnchor, constant: offSet).isActive = true
    plot.plotView.heightAnchor.constraint(equalToConstant: 41).isActive = true
    plot.plotView.widthAnchor.constraint(equalToConstant: 41).isActive = true
  }
  
  func createGameWinner() {
    gameWinner.text = "Let the Games Begin"
    gameWinner.font = .systemFont(ofSize: 30)
    gameWinner.textColor = .white
    gameWinner.textAlignment = .center
    gameWinner.backgroundColor = .purple
    view.addSubview(gameWinner)
    gameWinner.translatesAutoresizingMaskIntoConstraints = false
    gameWinner.topAnchor.constraint(equalTo: board.bottomAnchor).isActive = true
    gameWinner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
    gameWinner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
    gameWinner.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  func createGameName() {
    gameName.text = "Checkers"
    gameName.font = .systemFont(ofSize: 70)
    gameName.textColor = .white
    gameName.textAlignment = .center
    gameName.backgroundColor = .purple
    view.addSubview(gameName)
    gameName.translatesAutoresizingMaskIntoConstraints = false
    gameName.topAnchor.constraint(equalTo: view.topAnchor, constant: 48 ).isActive = true
    gameName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
    gameName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
    gameName.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  func createNewGame() {
    newGame.setTitle("New Game", for: .normal)
    newGame.titleLabel?.font = .systemFont(ofSize: 30)
    newGame.titleLabel?.textAlignment = .center
    newGame.backgroundColor = .purple
    newGame.addTarget(self, action: #selector(newGameAction), for: .touchUpInside)
    view.addSubview(newGame)
    newGame.translatesAutoresizingMaskIntoConstraints = false
    newGame.bottomAnchor.constraint(equalTo: board.topAnchor).isActive = true
    newGame.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
    newGame.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
    newGame.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  @objc func newGameAction() {
    newGame.setTitle("New Game", for: .normal)
    pOneLives = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    pTwoLives = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    var stateBool = true
    for i in 0...2 {
      for j in 0..<plots.count {
        if stateBool {
          plots[i][j].state = 1
        } else if !stateBool {
          plots[i][j].state = 0
        }
        stateBool = !stateBool
      }
      stateBool = !stateBool
    }
    
    stateBool = false
    
    for i in 3...6 {
      for j in 0..<plots.count {
        if stateBool {
          plots[i][j].state = 3
        } else if !stateBool {
          plots[i][j].state = 0
        }
        stateBool = !stateBool
      }
      stateBool = !stateBool
    }
    
    stateBool = false
    
    for i in 7...9 {
      for j in 0..<plots.count {
        if stateBool {
          plots[i][j].state = 2
        } else if !stateBool {
          plots[i][j].state = 0
        }
        stateBool = !stateBool
      }
      stateBool = !stateBool
    }
    
    pOnePieces[0].location = [0,0]
    pOnePieces[1].location = [0,2]
    pOnePieces[2].location = [0,4]
    pOnePieces[3].location = [0,6]
    pOnePieces[4].location = [0,8]
    pOnePieces[5].location = [1,1]
    pOnePieces[6].location = [1,3]
    pOnePieces[7].location = [1,5]
    pOnePieces[8].location = [1,7]
    pOnePieces[9].location = [1,9]
    pOnePieces[10].location = [2,0]
    pOnePieces[11].location = [2,2]
    pOnePieces[12].location = [2,4]
    pOnePieces[13].location = [2,6]
    pOnePieces[14].location = [2,8]
    
    pTwoPieces[0].location = [7,1]
    pTwoPieces[1].location = [7,3]
    pTwoPieces[2].location = [7,5]
    pTwoPieces[3].location = [7,7]
    pTwoPieces[4].location = [7,9]
    pTwoPieces[5].location = [8,0]
    pTwoPieces[6].location = [8,2]
    pTwoPieces[7].location = [8,4]
    pTwoPieces[8].location = [8,6]
    pTwoPieces[9].location = [8,8]
    pTwoPieces[10].location = [9,1]
    pTwoPieces[11].location = [9,3]
    pTwoPieces[12].location = [9,5]
    pTwoPieces[13].location = [9,7]
    pTwoPieces[14].location = [9,9]
    
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.backgroundColor = .black
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(firstTappedGestureRecogniser)
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(sFirstTappedGestureRecogniser)
    
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.backgroundColor = .black
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(secondTappedGestureRecogniser)
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(sSecondTappedGestureRecogniser)
    
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.backgroundColor = .black
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(thirdTappedGestureRecogniser)
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(sThirdTappedGestureRecogniser)
    
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.backgroundColor = .black
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(fourthTappedGestureRecogniser)
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(sFourthTappedGestureRecogniser)
    
    currentLocation = [0,0]
    nextLocation = [[10,10], [10,10], [10,0], [10,0]]
    nextLocationBool = [false, false, false, false]
    lastLocation = [[0,0], [0,0], [0,0], [0,0]]
    piece = 0
    playerTurn = true
    playerOneKill = [false, false, false, false]
    playerTwoKill = [false, false, false, false]
    kingMeBool = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    sKingMeBool = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    moreKillBool = false
    gameWinner.text = "Let the Games Begin"
    gameWinner.backgroundColor = .purple
    createPieces()
  }
  
  func printPlotState() {
    for i in 0..<plots.count {
      print("(\(i),0): \(plots[i][0].state), (\(i),1): \(plots[i][1].state), (\(i),2): \(plots[i][2].state), (\(i),3): \(plots[i][3].state), (\(i),4): \(plots[i][4].state), (\(i),5): \(plots[i][5].state), (\(i),6): \(plots[i][6].state), (\(i),7): \(plots[i][7].state), (\(i),8): \(plots[i][8].state), (\(i),9): \(plots[i][9].state)")
    }
  }
  
  func locatePiece(location: [Int]) -> Int {
    
    var locatedPiece = 0
    
    for i in 0..<pOnePieces.count {
      if pOnePieces[i].location == location && pOneLives[i] == 1 {
        locatedPiece = i
      }
      if pTwoPieces[i].location == location && pTwoLives[i] == 1 {
        locatedPiece = i
      }
    }
    
    return locatedPiece
    
  }
  
  func useToCreatePiece(thePiece: Piece, selector: Selector, color: UIColor) {
    thePiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    thePiece.button.layer.cornerRadius = 0.5 * thePiece.button.bounds.size.width
    thePiece.button.backgroundColor = color
    thePiece.button.addTarget(self, action: selector, for: .touchUpInside)
    plots[thePiece.location[0]][thePiece.location[1]].plotView.addSubview(thePiece.button)
  }
  
  func createPieces() {
    
    useToCreatePiece(thePiece: pOnePieces[0], selector: #selector(firstButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[1], selector: #selector(secondButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[2], selector: #selector(thirdButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[3], selector: #selector(fourthButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[4], selector: #selector(fifthButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[5], selector: #selector(sixthButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[6], selector: #selector(seventhButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[7], selector: #selector(eighthButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[8], selector: #selector(ninethButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[9], selector: #selector(tenthButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[10], selector: #selector(eleventhButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[11], selector: #selector(twelfthButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[12], selector: #selector(thirtenthButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[13], selector: #selector(fourtheenthButtonAction), color: .blue)
    useToCreatePiece(thePiece: pOnePieces[14], selector: #selector(fiftheenthButtonAction), color: .blue)
    
    useToCreatePiece(thePiece: pTwoPieces[0], selector: #selector(sFirstButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[1], selector: #selector(sSecondButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[2], selector: #selector(sThirdButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[3], selector: #selector(sFourthButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[4], selector: #selector(sFifthButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[5], selector: #selector(sSixthButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[6], selector: #selector(sSeventhButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[7], selector: #selector(sEighthButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[8], selector: #selector(sNinethButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[9], selector: #selector(sTenthButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[10], selector: #selector(sEleventhButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[11], selector: #selector(sTwelfthButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[12], selector: #selector(sThirteenthButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[13], selector: #selector(sFourtheenthButtonAction), color: .red)
    useToCreatePiece(thePiece: pTwoPieces[14], selector: #selector(sFifteenthButtonAction), color: .red)
    
  }
  
  func useToCreateButtonAction(thePieceNumber: Int) {
    
    if playerTurn && !moreKillBool {
      plots[lastLocation[0][0]][lastLocation[0][1]].plotView.backgroundColor = .black
      plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(firstTappedGestureRecogniser)
      plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(sFirstTappedGestureRecogniser)
      
      plots[lastLocation[1][0]][lastLocation[1][1]].plotView.backgroundColor = .black
      plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(secondTappedGestureRecogniser)
      plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(sSecondTappedGestureRecogniser)
      
      plots[lastLocation[2][0]][lastLocation[2][1]].plotView.backgroundColor = .black
      plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(thirdTappedGestureRecogniser)
      plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(sThirdTappedGestureRecogniser)
      
      plots[lastLocation[3][0]][lastLocation[3][1]].plotView.backgroundColor = .black
      plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(fourthTappedGestureRecogniser)
      plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(sFourthTappedGestureRecogniser)
      
      piece = thePieceNumber
      currentLocation = pOnePieces[piece].location
      
      if currentLocation[0]+1 < plots.count {
        if currentLocation[1]+1 < plots.count {
          if plots[currentLocation[0]+1][currentLocation[1]+1].state == 3 {
            nextLocation[0] = [currentLocation[0]+1, currentLocation[1]+1]
            lastLocation[0] = nextLocation[0]
            plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .purple
            nextLocationBool[0] = true
            playerOneKill[0] = false
          } else if plots[currentLocation[0]+1][currentLocation[1]+1].state == 2 {
            if currentLocation[0]+2 < plots.count && currentLocation[1]+2 < plots.count {
              if plots[currentLocation[0]+2][currentLocation[1]+2].state == 3 {
                nextLocation[0] = [currentLocation[0]+2, currentLocation[1]+2]
                lastLocation[0] = nextLocation[0]
                plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .purple
                nextLocationBool[0] = true
                playerOneKill[0] = true
              }
            }
          }
        }
        
        if currentLocation[1]-1 > -1 {
          if plots[currentLocation[0]+1][currentLocation[1]-1].state == 3 {
            nextLocation[1] = [currentLocation[0]+1, currentLocation[1]-1]
            lastLocation[1] = nextLocation[1]
            plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .purple
            nextLocationBool[1] = true
            playerOneKill[1] = false
          } else if plots[currentLocation[0]+1][currentLocation[1]-1].state == 2 {
            if currentLocation[0]+2 < plots.count && currentLocation[1]-2 > -1 {
              if plots[currentLocation[0]+2][currentLocation[1]-2].state == 3 {
                nextLocation[1] = [currentLocation[0]+2, currentLocation[1]-2]
                lastLocation[1] = nextLocation[1]
                plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .purple
                nextLocationBool[1] = true
                playerOneKill[1] = true
              }
            }
          }
        }
        movePiece()
      }
      
      if kingMeBool[thePieceNumber] && currentLocation[0]-1 > -1 {
        if currentLocation[1]+1 < plots.count {
          if plots[currentLocation[0]-1][currentLocation[1]+1].state == 3 {
            nextLocation[2] = [currentLocation[0]-1, currentLocation[1]+1]
            lastLocation[2] = nextLocation[2]
            plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .purple
            nextLocationBool[2] = true
            playerOneKill[2] = false
          } else if plots[currentLocation[0]-1][currentLocation[1]+1].state == 2 {
            if currentLocation[0]-2 > -1 && currentLocation[1]+2 < plots.count {
              if plots[currentLocation[0]-2][currentLocation[1]+2].state == 3 {
                nextLocation[2] = [currentLocation[0]-2, currentLocation[1]+2]
                lastLocation[2] = nextLocation[2]
                plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .purple
                nextLocationBool[2] = true
                playerOneKill[2] = true
              }
            }
          }
        }
        
        if currentLocation[1]-1 > -1 {
          if plots[currentLocation[0]-1][currentLocation[1]-1].state == 3 {
            nextLocation[3] = [currentLocation[0]-1, currentLocation[1]-1]
            lastLocation[3] = nextLocation[3]
            plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .purple
            nextLocationBool[3] = true
            playerOneKill[3] = false
          } else if plots[currentLocation[0]-1][currentLocation[1]-1].state == 2 {
            if currentLocation[0]-2 > -1 && currentLocation[1]-2 > -1 {
              if plots[currentLocation[0]-2][currentLocation[1]-2].state == 3 {
                nextLocation[3] = [currentLocation[0]-2, currentLocation[1]-2]
                lastLocation[3] = nextLocation[3]
                plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .purple
                nextLocationBool[3] = true
                playerOneKill[3] = true
              }
            }
          }
        }
        movePiece()
      }
    }
    
  }
  
  @objc func firstButtonAction() {
    useToCreateButtonAction(thePieceNumber: 0)
  }
  
  @objc func secondButtonAction() {
    useToCreateButtonAction(thePieceNumber: 1)
  }
  
  @objc func thirdButtonAction() {
    useToCreateButtonAction(thePieceNumber: 2)
  }
  
  @objc func fourthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 3)
  }
  
  @objc func fifthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 4)
  }
  
  @objc func sixthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 5)
  }
  
  @objc func seventhButtonAction() {
    useToCreateButtonAction(thePieceNumber: 6)
  }
  
  @objc func eighthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 7)
  }
  
  @objc func ninethButtonAction() {
    useToCreateButtonAction(thePieceNumber: 8)
  }
  
  @objc func tenthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 9)
  }
  
  @objc func eleventhButtonAction() {
    useToCreateButtonAction(thePieceNumber: 10)
  }
  
  @objc func twelfthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 11)
  }
  
  @objc func thirtenthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 12)
  }
  
  @objc func fourtheenthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 13)
  }
  
  @objc func fiftheenthButtonAction() {
    useToCreateButtonAction(thePieceNumber: 14)
  }
  
  func movePiece() {
    if nextLocationBool[0] == true {
      firstTappedGestureRecogniser.addTarget(self, action: #selector(toFirstLocation(sender: )))
      plots[nextLocation[0][0]][nextLocation[0][1]].plotView.addGestureRecognizer(firstTappedGestureRecogniser)
    }
    if nextLocationBool[1] == true {
      secondTappedGestureRecogniser.addTarget(self, action: #selector(toSecondLocation(sender: )))
      plots[nextLocation[1][0]][nextLocation[1][1]].plotView.addGestureRecognizer(secondTappedGestureRecogniser)
    }
    if nextLocationBool[2] == true {
      thirdTappedGestureRecogniser.addTarget(self, action: #selector(toThirdLocation(sender: )))
      plots[nextLocation[2][0]][nextLocation[2][1]].plotView.addGestureRecognizer(thirdTappedGestureRecogniser)
    }
    if nextLocationBool[3] == true {
      fourthTappedGestureRecogniser.addTarget(self, action: #selector(toFourthLocation(sender: )))
      plots[nextLocation[3][0]][nextLocation[3][1]].plotView.addGestureRecognizer(fourthTappedGestureRecogniser)
    }
  }
  
  @objc func toFirstLocation(sender: UITapGestureRecognizer) {
    
    plots[nextLocation[0][0]][nextLocation[0][1]].plotView.addSubview(pOnePieces[piece].button)
    plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .black
    if nextLocation[1][0] != 10 && nextLocation[1][1] != 10 {
      plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .black
    }
    if nextLocation[2][0] != 10 && nextLocation[2][1] != 10 {
      plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .black
    }
    if nextLocation[3][0] != 10 && nextLocation[3][1] != 10 {
      plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .black
    }
    pOnePieces[piece].location = nextLocation[0]
    if pOnePieces[piece].location[0] == 9 {
      kingMeBool[piece] = true
      pOnePieces[piece].button.backgroundColor = .green
    }
    plots[currentLocation[0]][currentLocation[1]].state = 3
    plots[nextLocation[0][0]][nextLocation[0][1]].state = 1
    nextLocationBool[0] = false
    playerTurn = !playerTurn
//    printPlotState()
//    print("next")
    if playerOneKill[0] {
      plots[nextLocation[0][0]-1][nextLocation[0][1]-1].state = 3
      let removedPiece = locatePiece(location: [nextLocation[0][0]-1, nextLocation[0][1]-1])
      pTwoPieces[removedPiece].button.removeFromSuperview()
      pTwoLives[removedPiece] = 0
      isGameOver()
      playerOneKill[0] = false
      playerOneKill[1] = false
      playerOneKill[2] = false
      playerOneKill[3] = false
      moreKills(thePieceNumber: piece)
    }
  }
  
  @objc func toSecondLocation(sender: UITapGestureRecognizer) {
    plots[nextLocation[1][0]][nextLocation[1][1]].plotView.addSubview(pOnePieces[piece].button)
    plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .black
    if nextLocation[0][0] != 10 && nextLocation[0][1] != 10 {
      plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .black
    }
    if nextLocation[2][0] != 10 && nextLocation[2][1] != 10 {
      plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .black
    }
    if nextLocation[3][0] != 10 && nextLocation[3][1] != 10 {
      plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .black
    }
    pOnePieces[piece].location = nextLocation[1]
    if pOnePieces[piece].location[0] == 9 {
      kingMeBool[piece] = true
      pOnePieces[piece].button.backgroundColor = .green
    }
    plots[currentLocation[0]][currentLocation[1]].state = 3
    plots[nextLocation[1][0]][nextLocation[1][1]].state = 1
    nextLocationBool[1] = false
//    printPlotState()
//    print("next")
    playerTurn = !playerTurn
    if playerOneKill[1] {
      plots[nextLocation[1][0]-1][nextLocation[1][1]+1].state = 3
      let removedPiece = locatePiece(location: [nextLocation[1][0]-1, nextLocation[1][1]+1])
      pTwoPieces[removedPiece].button.removeFromSuperview()
      pTwoLives[removedPiece] = 0
      isGameOver()
      playerOneKill[0] = false
      playerOneKill[1] = false
      playerOneKill[2] = false
      playerOneKill[3] = false
      moreKills(thePieceNumber: piece)
    }
  }
  
  @objc func toThirdLocation(sender: UITapGestureRecognizer) {
    plots[nextLocation[2][0]][nextLocation[2][1]].plotView.addSubview(pOnePieces[piece].button)
    plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .black
    if nextLocation[0][0] != 10 && nextLocation[0][1] != 10 {
      plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .black
    }
    if nextLocation[1][0] != 10 && nextLocation[1][1] != 10 {
      plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .black
    }
    if nextLocation[3][0] != 10 && nextLocation[3][1] != 10 {
      plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .black
    }
    pOnePieces[piece].location = nextLocation[2]
    plots[currentLocation[0]][currentLocation[1]].state = 3
    plots[nextLocation[2][0]][nextLocation[2][1]].state = 1
    nextLocationBool[2] = false
    playerTurn = !playerTurn
//    printPlotState()
//    print("next")
    if playerOneKill[2] {
      plots[nextLocation[2][0]+1][nextLocation[2][1]-1].state = 3
      let removedPiece = locatePiece(location: [nextLocation[2][0]+1, nextLocation[2][1]-1])
      pTwoPieces[removedPiece].button.removeFromSuperview()
      pTwoLives[removedPiece] = 0
      isGameOver()
      playerOneKill[0] = false
      playerOneKill[1] = false
      playerOneKill[2] = false
      playerOneKill[3] = false
      moreKills(thePieceNumber: piece)
    }
  }
  
  @objc func toFourthLocation(sender: UITapGestureRecognizer) {
    plots[nextLocation[3][0]][nextLocation[3][1]].plotView.addSubview(pOnePieces[piece].button)
    plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .black
    if nextLocation[0][0] != 10 && nextLocation[0][1] != 10 {
      plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .black
    }
    if nextLocation[1][0] != 10 && nextLocation[1][1] != 10 {
      plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .black
    }
    if nextLocation[2][0] != 10 && nextLocation[2][1] != 10 {
      plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .black
    }
    pOnePieces[piece].location = nextLocation[3]
    plots[currentLocation[0]][currentLocation[1]].state = 3
    plots[nextLocation[3][0]][nextLocation[3][1]].state = 1
    nextLocationBool[3] = false
//    printPlotState()
//    print("next")
    playerTurn = !playerTurn
    if playerOneKill[3] {
      plots[nextLocation[3][0]+1][nextLocation[3][1]+1].state = 3
      let removedPiece = locatePiece(location: [nextLocation[3][0]+1, nextLocation[3][1]+1])
      pTwoPieces[removedPiece].button.removeFromSuperview()
      pTwoLives[removedPiece] = 0
      isGameOver()
      playerOneKill[0] = false
      playerOneKill[1] = false
      playerOneKill[2] = false
      playerOneKill[3] = false
      moreKills(thePieceNumber: piece)
    }
  }
  
  func moreKills ( thePieceNumber: Int ) {
    
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.backgroundColor = .black
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(firstTappedGestureRecogniser)
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(sFirstTappedGestureRecogniser)
    
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.backgroundColor = .black
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(secondTappedGestureRecogniser)
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(sSecondTappedGestureRecogniser)
    
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.backgroundColor = .black
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(thirdTappedGestureRecogniser)
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(sThirdTappedGestureRecogniser)
    
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.backgroundColor = .black
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(fourthTappedGestureRecogniser)
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(sFourthTappedGestureRecogniser)
    
    piece = thePieceNumber
    currentLocation = pOnePieces[piece].location
    
    if currentLocation[0]+1 < plots.count {
      if currentLocation[1]+1 < plots.count {
        if plots[currentLocation[0]+1][currentLocation[1]+1].state == 2 {
          if currentLocation[0]+2 < plots.count && currentLocation[1]+2 < plots.count {
            if plots[currentLocation[0]+2][currentLocation[1]+2].state == 3 {
              nextLocation[0] = [currentLocation[0]+2, currentLocation[1]+2]
              lastLocation[0] = nextLocation[0]
              plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .purple
              nextLocationBool[0] = true
              playerOneKill[0] = true
            }
          }
        }
      }
      
      if currentLocation[1]-1 > -1 {
        if plots[currentLocation[0]+1][currentLocation[1]-1].state == 2 {
          if currentLocation[0]+2 < plots.count && currentLocation[1]-2 > -1 {
            if plots[currentLocation[0]+2][currentLocation[1]-2].state == 3 {
              nextLocation[1] = [currentLocation[0]+2, currentLocation[1]-2]
              lastLocation[1] = nextLocation[1]
              plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .purple
              nextLocationBool[1] = true
              playerOneKill[1] = true
            }
          }
        }
      }
    }
    
    if currentLocation[0]-1 > -1 {
      if currentLocation[1]+1 < plots.count {
        if plots[currentLocation[0]-1][currentLocation[1]+1].state == 2 {
          if currentLocation[0]-2 > -1 && currentLocation[1]+2 < plots.count {
            if plots[currentLocation[0]-2][currentLocation[1]+2].state == 3 {
              nextLocation[2] = [currentLocation[0]-2, currentLocation[1]+2]
              lastLocation[2] = nextLocation[2]
              plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .purple
              nextLocationBool[2] = true
              playerOneKill[2] = true
            }
          }
        }
      }
      
      if currentLocation[1]-1 > -1 {
        if plots[currentLocation[0]-1][currentLocation[1]-1].state == 2 {
          if currentLocation[0]-2 > -1 && currentLocation[1]-2 > -1 {
            if plots[currentLocation[0]-2][currentLocation[1]-2].state == 3 {
              nextLocation[3] = [currentLocation[0]-2, currentLocation[1]-2]
              lastLocation[3] = nextLocation[3]
              plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .purple
              nextLocationBool[3] = true
              playerOneKill[3] = true
            }
          }
        }
      }
    }
    if playerOneKill[0] || playerOneKill[1] || playerOneKill[2] || playerOneKill[3] {
      playerTurn = !playerTurn
      moreKillBool = true
      movePiece()
    } else {
      moreKillBool = false
    }
  }
  
  func sUseToCreateButtonAction(thePieceNumber: Int) {
    if !playerTurn && !moreKillBool {
      plots[lastLocation[0][0]][lastLocation[0][1]].plotView.backgroundColor = .black
      plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(firstTappedGestureRecogniser)
      plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(sFirstTappedGestureRecogniser)
      
      plots[lastLocation[1][0]][lastLocation[1][1]].plotView.backgroundColor = .black
      plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(secondTappedGestureRecogniser)
      plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(sSecondTappedGestureRecogniser)
      
      plots[lastLocation[2][0]][lastLocation[2][1]].plotView.backgroundColor = .black
      plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(thirdTappedGestureRecogniser)
      plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(sThirdTappedGestureRecogniser)
      
      plots[lastLocation[3][0]][lastLocation[3][1]].plotView.backgroundColor = .black
      plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(fourthTappedGestureRecogniser)
      plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(sFourthTappedGestureRecogniser)
      
      piece = thePieceNumber
      currentLocation = pTwoPieces[piece].location
      
      if currentLocation[0]-1 > -1 {
        if currentLocation[1]+1 < plots.count {
          if plots[currentLocation[0]-1][currentLocation[1]+1].state == 3 {
            nextLocation[0] = [currentLocation[0]-1, currentLocation[1]+1]
            lastLocation[0] = nextLocation[0]
            plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .purple
            nextLocationBool[0] = true
            playerTwoKill[0] = false
          } else if plots[currentLocation[0]-1][currentLocation[1]+1].state == 1 {
            if currentLocation[0]-2 > -1 && currentLocation[1]+2 < plots.count {
              if plots[currentLocation[0]-2][currentLocation[1]+2].state == 3 {
                nextLocation[0] = [currentLocation[0]-2, currentLocation[1]+2]
                lastLocation[0] = nextLocation[0]
                plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .purple
                nextLocationBool[0] = true
                playerTwoKill[0] = true
              }
            }
          }
        }
        
        if currentLocation[1]-1 > -1 {
          if plots[currentLocation[0]-1][currentLocation[1]-1].state == 3 {
            nextLocation[1] = [currentLocation[0]-1, currentLocation[1]-1]
            lastLocation[1] = nextLocation[1]
            plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .purple
            nextLocationBool[1] = true
            playerTwoKill[1] = false
          } else if plots[currentLocation[0]-1][currentLocation[1]-1].state == 1 {
            if currentLocation[0]-2 > -1 && currentLocation[1]-2 > -1 {
              if plots[currentLocation[0]-2][currentLocation[1]-2].state == 3 {
                nextLocation[1] = [currentLocation[0]-2, currentLocation[1]-2]
                lastLocation[1] = nextLocation[1]
                plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .purple
                nextLocationBool[1] = true
                playerTwoKill[1] = true
              }
            }
          }
        }
        sMovePiece()
      }
      
      if sKingMeBool[thePieceNumber] && currentLocation[0]+1 < plots.count {
        if currentLocation[1]+1 < plots.count {
          if plots[currentLocation[0]+1][currentLocation[1]+1].state == 3 {
            nextLocation[2] = [currentLocation[0]+1, currentLocation[1]+1]
            lastLocation[2] = nextLocation[2]
            plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .purple
            nextLocationBool[2] = true
            playerTwoKill[2] = false
          } else if plots[currentLocation[0]+1][currentLocation[1]+1].state == 1 {
            if currentLocation[0]+2 < plots.count && currentLocation[1]+2 < plots.count {
              if plots[currentLocation[0]+2][currentLocation[1]+2].state == 3 {
                nextLocation[2] = [currentLocation[0]+2, currentLocation[1]+2]
                lastLocation[2] = nextLocation[2]
                plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .purple
                nextLocationBool[2] = true
                playerTwoKill[2] = true
              }
            }
          }
        }
        
        if currentLocation[1]-1 > -1 {
          if plots[currentLocation[0]+1][currentLocation[1]-1].state == 3 {
            nextLocation[3] = [currentLocation[0]+1, currentLocation[1]-1]
            lastLocation[3] = nextLocation[3]
            plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .purple
            nextLocationBool[3] = true
            playerTwoKill[3] = false
          } else if plots[currentLocation[0]+1][currentLocation[1]-1].state == 1 {
            if currentLocation[0]+2 < plots.count && currentLocation[1]-2 > -1 {
              if plots[currentLocation[0]+2][currentLocation[1]-2].state == 3 {
                nextLocation[3] = [currentLocation[0]+2, currentLocation[1]-2]
                lastLocation[3] = nextLocation[3]
                plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .purple
                nextLocationBool[3] = true
                playerTwoKill[3] = true
              }
            }
          }
        }
        sMovePiece()
      }
    }
  }
  
  @objc func sFirstButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 0)
  }
  
  @objc func sSecondButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 1)
  }
  
  @objc func sThirdButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 2)
  }
  
  @objc func sFourthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 3)
  }
  
  @objc func sFifthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 4)
  }
  
  @objc func sSixthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 5)
  }
  
  @objc func sSeventhButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 6)
  }
  
  @objc func sEighthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 7)
  }
  
  @objc func sNinethButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 8)
  }
  
  @objc func sTenthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 9)
  }
  
  @objc func sEleventhButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 10)
  }
  
  @objc func sTwelfthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 11)
  }
  
  @objc func sThirteenthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 12)
  }
  
  @objc func sFourtheenthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 13)
  }
  
  @objc func sFifteenthButtonAction() {
    sUseToCreateButtonAction(thePieceNumber: 14)
  }
  
  
  func sMovePiece() {
    if nextLocationBool[0] == true {
      sFirstTappedGestureRecogniser.addTarget(self, action: #selector(sToFirstLocation(sender: )))
      plots[nextLocation[0][0]][nextLocation[0][1]].plotView.addGestureRecognizer(sFirstTappedGestureRecogniser)
    }
    if nextLocationBool[1] == true {
      sSecondTappedGestureRecogniser.addTarget(self, action: #selector(sToSecondLocation(sender: )))
      plots[nextLocation[1][0]][nextLocation[1][1]].plotView.addGestureRecognizer(sSecondTappedGestureRecogniser)
    }
    if nextLocationBool[2] == true {
      sThirdTappedGestureRecogniser.addTarget(self, action: #selector(sToThirdLocation(sender: )))
      plots[nextLocation[2][0]][nextLocation[2][1]].plotView.addGestureRecognizer(sThirdTappedGestureRecogniser)
    }
    if nextLocationBool[3] == true {
      sFourthTappedGestureRecogniser.addTarget(self, action: #selector(sToFourthLocation(sender: )))
      plots[nextLocation[3][0]][nextLocation[3][1]].plotView.addGestureRecognizer(sFourthTappedGestureRecogniser)
    }
  }
  
  @objc func sToFirstLocation(sender: UITapGestureRecognizer) {
    plots[nextLocation[0][0]][nextLocation[0][1]].plotView.addSubview(pTwoPieces[piece].button)
    plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .black
    if nextLocation[1][0] != 10 && nextLocation[1][1] != 10 {
      plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .black
    }
    if nextLocation[2][0] != 10 && nextLocation[2][1] != 10 {
      plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .black
    }
    if nextLocation[3][0] != 10 && nextLocation[3][1] != 10 {
      plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .black
    }
    pTwoPieces[piece].location = nextLocation[0]
    if pTwoPieces[piece].location[0] == 0 {
      sKingMeBool[piece] = true
      pTwoPieces[piece].button.backgroundColor = .orange
    }
    plots[currentLocation[0]][currentLocation[1]].state = 3
    plots[nextLocation[0][0]][nextLocation[0][1]].state = 2
    playerTurn = !playerTurn
    nextLocationBool[0] = false
//    printPlotState()
//    print("next")
    if playerTwoKill[0] {
      plots[nextLocation[0][0]+1][nextLocation[0][1]-1].state = 3
      let removedPiece = locatePiece(location: [nextLocation[0][0]+1, nextLocation[0][1]-1])
      pOnePieces[removedPiece].button.removeFromSuperview()
      pOneLives[removedPiece] = 0
      isGameOver()
      playerTwoKill[0] = false
      playerTwoKill[1] = false
      playerTwoKill[2] = false
      playerTwoKill[3] = false
      sMoreKills(thePieceNumber: piece)
    }
  }
  
  @objc func sToSecondLocation(sender: UITapGestureRecognizer) {
    plots[nextLocation[1][0]][nextLocation[1][1]].plotView.addSubview(pTwoPieces[piece].button)
    plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .black
    if nextLocation[0][0] != 10 && nextLocation[0][1] != 10 {
      plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .black
    }
    if nextLocation[2][0] != 10 && nextLocation[2][1] != 10 {
      plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .black
    }
    if nextLocation[3][0] != 10 && nextLocation[3][1] != 10 {
      plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .black
    }
    pTwoPieces[piece].location = nextLocation[1]
    if pTwoPieces[piece].location[0] == 0 {
      sKingMeBool[piece] = true
      pTwoPieces[piece].button.backgroundColor = .orange
    }
    plots[currentLocation[0]][currentLocation[1]].state = 3
    plots[nextLocation[1][0]][nextLocation[1][1]].state = 2
    playerTurn = !playerTurn
    nextLocationBool[1] = false
//    printPlotState()
//    print("next")
    if playerTwoKill[1] {
      plots[nextLocation[1][0]+1][nextLocation[1][1]+1].state = 3
      let removedPiece = locatePiece(location: [nextLocation[1][0]+1, nextLocation[1][1]+1])
      pOnePieces[removedPiece].button.removeFromSuperview()
      pOneLives[removedPiece] = 0
      isGameOver()
      playerTwoKill[0] = false
      playerTwoKill[1] = false
      playerTwoKill[2] = false
      playerTwoKill[3] = false
      sMoreKills(thePieceNumber: piece)
    }
  }
  
  @objc func sToThirdLocation(sender: UITapGestureRecognizer) {
    plots[nextLocation[2][0]][nextLocation[2][1]].plotView.addSubview(pTwoPieces[piece].button)
    plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .black
    if nextLocation[0][0] != 10 && nextLocation[0][1] != 10 {
      plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .black
    }
    if nextLocation[1][0] != 10 && nextLocation[1][1] != 10 {
      plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .black
    }
    if nextLocation[3][0] != 10 && nextLocation[3][1] != 10 {
      plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .black
    }
    pTwoPieces[piece].location = nextLocation[2]
    plots[currentLocation[0]][currentLocation[1]].state = 3
    plots[nextLocation[2][0]][nextLocation[2][1]].state = 2
    playerTurn = !playerTurn
    nextLocationBool[2] = false
//    printPlotState()
//    print("next")
    if playerTwoKill[2] {
      plots[nextLocation[2][0]-1][nextLocation[2][1]-1].state = 3
      let removedPiece = locatePiece(location: [nextLocation[2][0]-1, nextLocation[2][1]-1])
      pOnePieces[removedPiece].button.removeFromSuperview()
      pOneLives[removedPiece] = 0
      isGameOver()
      playerTwoKill[0] = false
      playerTwoKill[1] = false
      playerTwoKill[2] = false
      playerTwoKill[3] = false
      sMoreKills(thePieceNumber: piece)
    }
  }
  
  @objc func sToFourthLocation(sender: UITapGestureRecognizer) {
    plots[nextLocation[3][0]][nextLocation[3][1]].plotView.addSubview(pTwoPieces[piece].button)
    plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .black
    if nextLocation[0][0] != 10 && nextLocation[0][1] != 10 {
      plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .black
    }
    if nextLocation[1][0] != 10 && nextLocation[1][1] != 10 {
      plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .black
    }
    if nextLocation[2][0] != 10 && nextLocation[2][1] != 10 {
      plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .black
    }
    pTwoPieces[piece].location = nextLocation[3]
    plots[currentLocation[0]][currentLocation[1]].state = 3
    plots[nextLocation[3][0]][nextLocation[3][1]].state = 2
    playerTurn = !playerTurn
    nextLocationBool[3] = false
//    printPlotState()
//    print("next")
    if playerTwoKill[3] {
      plots[nextLocation[3][0]-1][nextLocation[3][1]+1].state = 3
      let removedPiece = locatePiece(location: [nextLocation[3][0]-1, nextLocation[3][1]+1])
      pOnePieces[removedPiece].button.removeFromSuperview()
      pOneLives[removedPiece] = 0
      isGameOver()
      playerTwoKill[0] = false
      playerTwoKill[1] = false
      playerTwoKill[2] = false
      playerTwoKill[3] = false
      sMoreKills(thePieceNumber: piece)
    }
  }
  
  func sMoreKills ( thePieceNumber: Int ) {
    
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.backgroundColor = .black
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(firstTappedGestureRecogniser)
    plots[lastLocation[0][0]][lastLocation[0][1]].plotView.removeGestureRecognizer(sFirstTappedGestureRecogniser)
    
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.backgroundColor = .black
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(secondTappedGestureRecogniser)
    plots[lastLocation[1][0]][lastLocation[1][1]].plotView.removeGestureRecognizer(sSecondTappedGestureRecogniser)
    
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.backgroundColor = .black
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(thirdTappedGestureRecogniser)
    plots[lastLocation[2][0]][lastLocation[2][1]].plotView.removeGestureRecognizer(sThirdTappedGestureRecogniser)
    
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.backgroundColor = .black
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(fourthTappedGestureRecogniser)
    plots[lastLocation[3][0]][lastLocation[3][1]].plotView.removeGestureRecognizer(sFourthTappedGestureRecogniser)
    
    piece = thePieceNumber
    currentLocation = pTwoPieces[piece].location
    
    if currentLocation[0]-1 > -1 {
      if currentLocation[1]+1 < plots.count {
        if plots[currentLocation[0]-1][currentLocation[1]+1].state == 1 {
          if currentLocation[0]-2 > -1 && currentLocation[1]+2 < plots.count {
            if plots[currentLocation[0]-2][currentLocation[1]+2].state == 3 {
              nextLocation[0] = [currentLocation[0]-2, currentLocation[1]+2]
              lastLocation[0] = nextLocation[0]
              plots[nextLocation[0][0]][nextLocation[0][1]].plotView.backgroundColor = .purple
              nextLocationBool[0] = true
              playerTwoKill[0] = true
            }
          }
        }
      }
      
      if currentLocation[1]-1 > -1 {
        if plots[currentLocation[0]-1][currentLocation[1]-1].state == 1 {
          if currentLocation[0]-2 > -1 && currentLocation[1]-2 > -1 {
            if plots[currentLocation[0]-2][currentLocation[1]-2].state == 3 {
              nextLocation[1] = [currentLocation[0]-2, currentLocation[1]-2]
              lastLocation[1] = nextLocation[1]
              plots[nextLocation[1][0]][nextLocation[1][1]].plotView.backgroundColor = .purple
              nextLocationBool[1] = true
              playerTwoKill[1] = true
            }
          }
        }
      }
    }
    
    if currentLocation[0]+1 < plots.count {
      if currentLocation[1]+1 < plots.count {
        if plots[currentLocation[0]+1][currentLocation[1]+1].state == 1 {
          if currentLocation[0]+2 < plots.count && currentLocation[1]+2 < plots.count {
            if plots[currentLocation[0]+2][currentLocation[1]+2].state == 3 {
              nextLocation[2] = [currentLocation[0]+2, currentLocation[1]+2]
              lastLocation[2] = nextLocation[2]
              plots[nextLocation[2][0]][nextLocation[2][1]].plotView.backgroundColor = .purple
              nextLocationBool[2] = true
              playerTwoKill[2] = true
            }
          }
        }
      }
      
      if currentLocation[1]-1 > -1 {
        if plots[currentLocation[0]+1][currentLocation[1]-1].state == 1 {
          if currentLocation[0]+2 < plots.count && currentLocation[1]-2 > -1 {
            if plots[currentLocation[0]+2][currentLocation[1]-2].state == 3 {
              nextLocation[3] = [currentLocation[0]+2, currentLocation[1]-2]
              lastLocation[3] = nextLocation[3]
              plots[nextLocation[3][0]][nextLocation[3][1]].plotView.backgroundColor = .purple
              nextLocationBool[3] = true
              playerTwoKill[3] = true
            }
          }
        }
      }
    }
    if playerTwoKill[0] || playerTwoKill[1] || playerTwoKill[2] || playerTwoKill[3] {
      playerTurn = !playerTurn
      moreKillBool = true
      sMovePiece()
    } else {
      moreKillBool = false
    }
  }
  
  func isGameOver() {
    
    var gameOver = [true, true]
    
    for i in 0..<pOneLives.count {
      if pOneLives[i] == 1 {
        gameOver[0] = false
      }
      if pTwoLives[i] == 1 {
        gameOver[1] = false
      }
    }
    
    if gameOver[1] {
      gameWinner.text = "Player One Wins"
      gameWinner.backgroundColor = .blue
      newGame.setTitle("Restart Game", for: .normal)
    }
    if gameOver[0] {
      gameWinner.text = "Player Two Wins"
      gameWinner.backgroundColor = .red
      newGame.setTitle("Restart Game", for: .normal)
    }
  }
  
}

struct Piece {
  let button: UIButton
  var location: [Int]
}

struct Plot {
  let plotView: UIView
  var state: Int
}
