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
  
  let builderPlotOne = UIView(); let builderPlotTwo = UIView(); let builderPlotThree = UIView()
  let builderPlotFour = UIView();  let builderPlotFive = UIView()
  
  let plotOne = Plot(plotView: UIView(), state: 1, index: [0,0]); let plotTwo = Plot(plotView: UIView(), state: 0, index: [0,1]); let plotThree = Plot(plotView: UIView(), state: 1, index: [0,2]); let plotFour = Plot(plotView: UIView(), state: 0, index: [0,3]); let plotFive = Plot(plotView: UIView(), state: 1, index: [0,4]); let plotSix = Plot(plotView: UIView(), state: 0, index: [0,5]); let plotSeven = Plot(plotView: UIView(), state: 1, index: [0,6]); let plotEight = Plot(plotView: UIView(), state: 0, index: [0,7]); let plotNine = Plot(plotView: UIView(), state: 1, index: [0,8]); let plotTen = Plot(plotView: UIView(), state: 0, index: [0,9]); let plotEleven = Plot(plotView: UIView(), state: 0, index: [1,0]); let plotTwelve = Plot(plotView: UIView(), state: 1, index: [1,1]); let plotThirteen = Plot(plotView: UIView(), state: 0, index: [1,2]); let plotFourteen = Plot(plotView: UIView(), state: 1, index: [1,3]); let plotFifteen = Plot(plotView: UIView(), state: 0, index: [1,4]); let plotSixteen = Plot(plotView: UIView(), state: 1, index: [1,5]); let plotSeventeen = Plot(plotView: UIView(), state: 0, index: [1,6]); let plotEighteen = Plot(plotView: UIView(), state: 1, index: [1,7]);let plotNineteen = Plot(plotView: UIView(), state: 0, index: [1,8]); let plotTwenty = Plot(plotView: UIView(), state: 1, index: [1,9]); let plotTwentyOne = Plot(plotView: UIView(), state: 1, index: [2,0]); let plotTwentyTwo = Plot(plotView: UIView(), state: 0, index: [2,1]); let plotTwentyThree = Plot(plotView: UIView(), state: 1, index: [2,2]); let plotTwentyFour = Plot(plotView: UIView(), state: 0, index: [2,3]); let plotTwentyFive = Plot(plotView: UIView(), state: 1, index: [2,4]); let plotTwentySix = Plot(plotView: UIView(), state: 0, index: [2,5]); let plotTwentySeven = Plot(plotView: UIView(), state: 1, index: [2,6]); let plotTwentyEight = Plot(plotView: UIView(), state: 0, index: [2,7]); let plotTwentyNine = Plot(plotView: UIView(), state: 1, index: [2,8]); let plotThirty = Plot(plotView: UIView(), state: 0, index: [2,9]); let plotThirtyOne = Plot(plotView: UIView(), state: 0, index: [3,0]); let plotThirtyTwo = Plot(plotView: UIView(), state: 3, index: [3,1]); let plotThirtyThree = Plot(plotView: UIView(), state: 0, index: [3,2]); let plotThirtyFour = Plot(plotView: UIView(), state: 3, index: [3,3]); let plotThirtyFive = Plot(plotView: UIView(), state: 0, index: [3,4]); let plotThirtySix = Plot(plotView: UIView(), state: 3, index: [3,5]); let plotThirtySeven = Plot(plotView: UIView(), state: 0, index: [3,6]); let plotThirtyEight = Plot(plotView: UIView(), state: 3, index: [3,7]); let plotThirtyNine = Plot(plotView: UIView(), state: 0, index: [3,8]); let plotFourty = Plot(plotView: UIView(), state: 3, index: [3,9]); let plotFourtyOne = Plot(plotView: UIView(), state: 3, index: [4,0]); let plotFourtyTwo = Plot(plotView: UIView(), state: 0, index: [4,1]); let plotFourtyThree = Plot(plotView: UIView(), state: 3, index: [4,2]); let plotFourtyFour = Plot(plotView: UIView(), state: 0, index: [4,3]); let plotFourtyFive = Plot(plotView: UIView(), state: 3, index: [4,4]); let plotFourtySix = Plot(plotView: UIView(), state: 0, index: [4,5]); let plotFourtySeven = Plot(plotView: UIView(), state: 3, index: [4,6]); let plotFourtyEight = Plot(plotView: UIView(), state: 0, index: [4,7]); let plotFourtyNine = Plot(plotView: UIView(), state: 3, index: [4,8]); let plotFifty = Plot(plotView: UIView(), state: 0, index: [4,9]); let plotFiftyOne = Plot(plotView: UIView(), state: 0, index: [5,0]); let plotFiftyTwo = Plot(plotView: UIView(), state: 3, index: [5,1]); let plotFiftyThree = Plot(plotView: UIView(), state: 0, index: [5,2]); let plotFiftyFour = Plot(plotView: UIView(), state: 3, index: [5,3]); let plotFiftyFive = Plot(plotView: UIView(), state: 0, index: [5,4]); let plotFiftySix = Plot(plotView: UIView(), state: 3, index: [5,5]); let plotFiftySeven = Plot(plotView: UIView(), state: 0, index: [5,6]); let plotFiftyEight = Plot(plotView: UIView(), state: 3, index: [5,7]); let plotFiftyNine = Plot(plotView: UIView(), state: 0, index: [5,8]); let plotSixty = Plot(plotView: UIView(), state: 3, index: [5,9]); let plotSixtyOne = Plot(plotView: UIView(), state: 3, index: [6,0]); let plotSixtyTwo = Plot(plotView: UIView(), state: 0, index: [6,1]); let plotSixtyThree = Plot(plotView: UIView(), state: 3, index: [6,2]); let plotSixtyFour = Plot(plotView: UIView(), state: 0, index: [6,3]); let plotSixtyFive = Plot(plotView: UIView(), state: 3, index: [6,4]); let plotSixtySix = Plot(plotView: UIView(), state: 0, index: [6,5]); let plotSixtySeven = Plot(plotView: UIView(), state: 3, index: [6,6]); let plotSixtyEight = Plot(plotView: UIView(), state: 0, index: [6,7]); let plotSixtyNine = Plot(plotView: UIView(), state: 3, index: [6,8]); let plotSeventy = Plot(plotView: UIView(), state: 0, index: [6,9]); let plotSeventyOne = Plot(plotView: UIView(), state: 0, index: [7,0]); let plotSeventyTwo = Plot(plotView: UIView(), state: 2, index: [7,1]); let plotSeventyThree = Plot(plotView: UIView(), state: 0, index: [7,2]); let plotSeventyFour = Plot(plotView: UIView(), state: 2, index: [7,3]); let plotSeventyFive = Plot(plotView: UIView(), state: 0, index: [7,4]); let plotSeventySix = Plot(plotView: UIView(), state: 2, index: [7,5]); let plotSeventySeven = Plot(plotView: UIView(), state: 0, index: [7,6]); let plotSeventyEight = Plot(plotView: UIView(), state: 2, index: [7,7]); let plotSeventyNine = Plot(plotView: UIView(), state: 0, index: [7,8]); let plotEighty = Plot(plotView: UIView(), state: 2, index: [7,9]); let plotEightyOne = Plot(plotView: UIView(), state: 2, index: [8,0]); let plotEightyTwo = Plot(plotView: UIView(), state: 0, index: [8,1]); let plotEightyThree = Plot(plotView: UIView(), state: 2, index: [8,2]); let plotEightyFour = Plot(plotView: UIView(), state: 0, index: [8,3]); let plotEightyFive = Plot(plotView: UIView(), state: 2, index: [8,4]); let plotEightySix = Plot(plotView: UIView(), state: 0, index: [8,5]); let plotEightySeven = Plot(plotView: UIView(), state: 2, index: [8,6]); let plotEightyEight = Plot(plotView: UIView(), state: 0, index: [8,7]); let plotEightyNine = Plot(plotView: UIView(), state: 2, index: [8,8]); let plotNinety = Plot(plotView: UIView(), state: 0, index: [8,9]); let plotNinetyOne = Plot(plotView: UIView(), state: 0, index: [9,0]); let plotNinetyTwo = Plot(plotView: UIView(), state: 2, index: [9,1]); let plotNinetyThree = Plot(plotView: UIView(), state: 0, index: [9,2]); let plotNinetyFour = Plot(plotView: UIView(), state: 2, index: [9,3]); let plotNinetyFive = Plot(plotView: UIView(), state: 0, index: [9,4]); let plotNinetySix = Plot(plotView: UIView(), state: 2, index: [9,5]); let plotNinetySeven = Plot(plotView: UIView(), state: 0, index: [9,6]); let plotNinetyEight = Plot(plotView: UIView(), state: 2, index: [9,7]); let plotNinetyNine = Plot(plotView: UIView(), state: 0, index: [9,8]); let plotOneHundred = Plot(plotView: UIView(), state: 2, index: [9,9])
  
  var plotColorBool = true
  
  let pOneFirstPiece = Piece(button: UIButton(type: .custom), index: [0,0])
  let pOneSecondPiece = Piece(button: UIButton(type: .custom), index: [0,2])
  let pOneThirdPiece = Piece(button: UIButton(type: .custom), index: [0,4])
  let pOneFourthPiece = Piece(button: UIButton(type: .custom), index: [0,6])
  let pOneFifthPiece = Piece(button: UIButton(type: .custom), index: [0,8])
  let pOneSixthPiece = Piece(button: UIButton(type: .custom), index: [1,1])
  let pOneSeventhPiece = Piece(button: UIButton(type: .custom), index: [1,3])
  let pOneEighthPiece = Piece(button: UIButton(type: .custom), index: [1,5])
  let pOneNinethPiece = Piece(button: UIButton(type: .custom), index: [1,7])
  let pOneTenthPiece = Piece(button: UIButton(type: .custom), index: [1,9])
  let pOneEleventhPiece = Piece(button: UIButton(type: .custom), index: [2,0])
  let pOneTwelvethPiece = Piece(button: UIButton(type: .custom), index: [2,2])
  let pOneThirteenthPiece = Piece(button: UIButton(type: .custom), index: [2,4])
  let pOneFourtheenthPiece = Piece(button: UIButton(type: .custom), index: [2,6])
  let pOneFifteenthPiece = Piece(button: UIButton(type: .custom), index: [2,8])
  
  var array = [[1,0,1,0,1,0,1,0,1,0],[0,1,0,1,0,1,0,1,0,1],[1,0,1,0,1,0,1,0,1,0],[0,3,0,3,0,3,0,3,0,3],[3,0,3,0,3,0,3,0,3,0],[0,3,0,3,0,3,0,3,0,3],[3,0,3,0,3,0,3,0,3,0],[0,2,0,2,0,2,0,2,0,2],[2,0,2,0,2,0,2,0,2,0],[0,2,0,2,0,2,0,2,0,2]]
  var moveTo = [0,0]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createBoard()
    //moveTestPiece()
  }
  
  func createArrayOfView() -> [[Plot]] {
    let arrayOfViews = [[plotOne, plotTwo, plotThree, plotFour, plotFive, plotSix, plotSeven, plotEight, plotNine, plotTen], [plotEleven, plotTwelve, plotThirteen, plotFourteen, plotFifteen, plotSixteen, plotSeventeen, plotEighteen, plotNineteen, plotTwenty], [plotTwentyOne, plotTwentyTwo, plotTwentyThree, plotTwentyFour, plotTwentyFive, plotTwentySix, plotTwentySeven, plotTwentyEight, plotTwentyNine, plotThirty], [plotThirtyOne, plotThirtyTwo, plotThirtyThree, plotThirtyFour, plotThirtyFive, plotThirtySix, plotThirtySeven, plotThirtyEight, plotThirtyNine, plotFourty], [plotFourtyOne, plotFourtyTwo, plotFourtyThree, plotFourtyFour, plotFourtyFive, plotFourtySix, plotFourtySeven, plotFourtyEight, plotFourtyNine, plotFifty], [plotFiftyOne, plotFiftyTwo, plotFiftyThree, plotFiftyFour, plotFiftyFive, plotFiftySix, plotFiftySeven, plotFiftyEight, plotFiftyNine, plotSixty], [plotSixtyOne, plotSixtyTwo, plotSixtyThree, plotSixtyFour, plotSixtyFive, plotSixtySix, plotSixtySeven, plotSixtyEight, plotSixtyNine, plotSeventy],[plotSeventyOne, plotSeventyTwo, plotSeventyThree, plotSeventyFour, plotSeventyFive, plotSeventySix, plotSeventySeven, plotSeventyEight, plotSeventyNine, plotEighty], [plotEightyOne, plotEightyTwo, plotEightyThree, plotEightyFour, plotEightyFive, plotEightySix, plotEightySeven, plotEightyEight, plotEightyNine, plotNinety], [plotNinetyOne, plotNinetyTwo, plotNinetyThree, plotNinetyFour, plotNinetyFive, plotNinetySix, plotNinetySeven, plotNinetyEight, plotNinetyNine, plotOneHundred]]
    return arrayOfViews
  }
  
  func createPieces() {
    pOneFirstPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneFirstPiece.button.layer.cornerRadius = 0.5 * pOneFirstPiece.button.bounds.size.width
    pOneFirstPiece.button.backgroundColor = .blue
    //pOneFirstPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotOne.plotView.addSubview(pOneFirstPiece.button)
    
    pOneSecondPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneSecondPiece.button.layer.cornerRadius = 0.5 * pOneSecondPiece.button.bounds.size.width
    pOneSecondPiece.button.backgroundColor = .blue
    //pOneSecondPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotThree.plotView.addSubview(pOneSecondPiece.button)
    
    pOneThirdPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneThirdPiece.button.layer.cornerRadius = 0.5 * pOneThirdPiece.button.bounds.size.width
    pOneThirdPiece.button.backgroundColor = .blue
    //pOneThirdPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotFive.plotView.addSubview(pOneThirdPiece.button)
    
    pOneFourthPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneFourthPiece.button.layer.cornerRadius = 0.5 * pOneFourthPiece.button.bounds.size.width
    pOneFourthPiece.button.backgroundColor = .blue
    //pOneFourthPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotSeven.plotView.addSubview(pOneFourthPiece.button)
    
    pOneFifthPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneFifthPiece.button.layer.cornerRadius = 0.5 * pOneFifthPiece.button.bounds.size.width
    pOneFifthPiece.button.backgroundColor = .blue
    //pOneFifthPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotNine.plotView.addSubview(pOneFifthPiece.button)
    
    pOneSixthPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneSixthPiece.button.layer.cornerRadius = 0.5 * pOneSixthPiece.button.bounds.size.width
    pOneSixthPiece.button.backgroundColor = .blue
    //pOneSixthPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotTwelve.plotView.addSubview(pOneSixthPiece.button)
    
    pOneSeventhPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneSeventhPiece.button.layer.cornerRadius = 0.5 * pOneSeventhPiece.button.bounds.size.width
    pOneSeventhPiece.button.backgroundColor = .blue
    //pOneSeventhPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotFourteen.plotView.addSubview(pOneSeventhPiece.button)
    
    pOneEighthPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneEighthPiece.button.layer.cornerRadius = 0.5 * pOneEighthPiece.button.bounds.size.width
    pOneEighthPiece.button.backgroundColor = .blue
    //pOneEighthPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotSixteen.plotView.addSubview(pOneEighthPiece.button)
    
    pOneNinethPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneNinethPiece.button.layer.cornerRadius = 0.5 * pOneNinethPiece.button.bounds.size.width
    pOneNinethPiece.button.backgroundColor = .blue
//    //pOneNinethPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotEighteen.plotView.addSubview(pOneNinethPiece.button)
    
    pOneTenthPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneTenthPiece.button.layer.cornerRadius = 0.5 * pOneTenthPiece.button.bounds.size.width
    pOneTenthPiece.button.backgroundColor = .blue
    //pOneSixthPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotTwenty.plotView.addSubview(pOneTenthPiece.button)
    
    pOneEleventhPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneEleventhPiece.button.layer.cornerRadius = 0.5 * pOneEleventhPiece.button.bounds.size.width
    pOneEleventhPiece.button.backgroundColor = .blue
    pOneEleventhPiece.button.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotTwentyOne.plotView.addSubview(pOneEleventhPiece.button)
    
    pOneTwelvethPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneTwelvethPiece.button.layer.cornerRadius = 0.5 * pOneTwelvethPiece.button.bounds.size.width
    pOneTwelvethPiece.button.backgroundColor = .blue
    //pOneSecondPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotTwentyThree.plotView.addSubview(pOneTwelvethPiece.button)
    
    pOneThirteenthPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneThirteenthPiece.button.layer.cornerRadius = 0.5 * pOneThirteenthPiece.button.bounds.size.width
    pOneThirteenthPiece.button.backgroundColor = .blue
    //pOneThirdPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotTwentyFive.plotView.addSubview(pOneThirteenthPiece.button)
    
    pOneFourtheenthPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneFourtheenthPiece.button.layer.cornerRadius = 0.5 * pOneFourtheenthPiece.button.bounds.size.width
    pOneFourtheenthPiece.button.backgroundColor = .blue
    //pOneFourthPiece.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotTwentySeven.plotView.addSubview(pOneFourtheenthPiece.button)
    
    pOneFifteenthPiece.button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    pOneFifteenthPiece.button.layer.cornerRadius = 0.5 * pOneFifteenthPiece.button.bounds.size.width
    pOneFifteenthPiece.button.backgroundColor = .blue
    //pOneFifteenthPiece.button.addTarget(self, action: #selector(whereToMove), for: .touchUpInside)
    plotTwentyNine.plotView.addSubview(pOneFifteenthPiece.button)
  }
  
  @objc func whereToMove() {
    let theViews = createArrayOfView()
    theViews[pOneEleventhPiece.index[0]+1][pOneEleventhPiece.index[1]+1].plotView.backgroundColor = .purple
    moveTo = [pOneEleventhPiece.index[0]+1, pOneEleventhPiece.index[1]+1]
    movePiece(button: pOneEleventhPiece.button)
  }
  
  func movePiece(button: UIButton) {
    let theViews = createArrayOfView()
    let tappedGestureRecogniser = UITapGestureRecognizer()
    tappedGestureRecogniser.addTarget(self, action: #selector(canNowMove(sender: )))
    //plotThirtyTwo.plotView.addGestureRecognizer(tappedGestureRecogniser)
    theViews[moveTo[0]][moveTo[1]].plotView.addGestureRecognizer(tappedGestureRecogniser)
  }
  
  @objc func canNowMove(sender: UITapGestureRecognizer) {
    let theViews = createArrayOfView()
    theViews[moveTo[0]][moveTo[1]].plotView.addSubview(pOneEleventhPiece.button)
    theViews[moveTo[0]][moveTo[1]].plotView.backgroundColor = .black
  }
  
  func createBoard() {
    view.addSubview(board)
    board.translatesAutoresizingMaskIntoConstraints = false
    board.topAnchor.constraint(equalTo: view.topAnchor, constant: 224).isActive = true
    board.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
    board.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
    board.heightAnchor.constraint(equalToConstant: 410).isActive = true
    let arrayOfViews = createArrayOfView()
    createBuilderPlot(array: arrayOfViews)
    createPieces()
  }
  
  func createBuilderPlot(array: [[Plot]]) {
    let builderPlotArray = [builderPlotOne,builderPlotTwo,builderPlotThree,builderPlotFour,builderPlotFive]
    
    setupBuilderPlotConstraint(builderPlot: builderPlotOne, index: [0,1])
    builderPlotOne.topAnchor.constraint(equalTo: board.topAnchor).isActive = true
    
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
  
    let array = createArrayOfView()
    
    setupPlotConstraint(plot: array[pIndex[0]][0], ppBuilderPlot: pBuilderPlot, firstColor: .gray, secondColor: .black, offSet: 0)
    array[pIndex[0]][0].plotView.leadingAnchor.constraint(equalTo: pBuilderPlot.leadingAnchor).isActive = true
    
    for i in 1...9 {
      setupPlotConstraint(plot: array[pIndex[0]][i], ppBuilderPlot: pBuilderPlot, firstColor: .gray, secondColor: .black, offSet: 0)
      array[pIndex[0]][i].plotView.leadingAnchor.constraint(equalTo: array[pIndex[0]][i-1].plotView.trailingAnchor).isActive = true
    }
    
    
    setupPlotConstraint(plot: array[pIndex[1]][0], ppBuilderPlot: pBuilderPlot, firstColor: .black, secondColor: .gray, offSet: 41)
    array[pIndex[1]][0].plotView.leadingAnchor.constraint(equalTo: pBuilderPlot.leadingAnchor).isActive = true
    
    for i in 1...9 {
      setupPlotConstraint(plot: array[pIndex[1]][i], ppBuilderPlot: pBuilderPlot, firstColor: .black, secondColor: .gray, offSet: 41)
      array[pIndex[1]][i].plotView.leadingAnchor.constraint(equalTo: array[pIndex[1]][i-1].plotView.trailingAnchor).isActive = true
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
  
}

struct Plot {
  let plotView: UIView
  var state: Int
  let index: [Int]
}

struct Piece {
  let button: UIButton
  let index: [Int]
}
