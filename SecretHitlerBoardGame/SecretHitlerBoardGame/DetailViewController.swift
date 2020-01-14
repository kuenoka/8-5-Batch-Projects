//
//  DetailViewController.swift
//  SecretHitlerBoardGame
//
//  Created by MCS on 12/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  let board = UIView()
  let liberalColumn = UIView()
  let liberalPolicyPlot = [UIView(), UIView(), UIView(), UIView(), UIView()]
  let fascistColumn = UIView()
  let fascistPolicyPlot = [UIView(), UIView(), UIView(), UIView(), UIView(), UIView()]
  let vote = UIView()
  let jaVote = UIButton()
  let neinVote = UIButton()
  let preseidentVoteHeader = UILabel()
  let preseidentVote = UILabel()
  let chancellorVote = UILabel()
  let chancellorVoteHeader = UILabel()
  let gameTable = UIView()
  let playerPosition = [UILabel(), UILabel(), UILabel(), UILabel(), UILabel()]
  let gameTitle = UILabel()
  let playView = UIView()
  
  var playerIndex: Int!
  var namesArray: [String]!
  var player = PlayerViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    player.sURL = "http://localhost:8000/SecretHitler/\(playerIndex+1)"
    player.getData{}
    view.backgroundColor = .white
    createVoteView()
    createGameTable()
    createBoard()
    createGameTitle()
    createPlayView()
  }
  
  func createGameTitle() {
    gameTitle.text = "Secret Hitler"
    gameTitle.textColor = .black
    gameTitle.font = .systemFont(ofSize: 40)
    gameTitle.textAlignment = .center
    view.addSubview(gameTitle)
    gameTitle.translatesAutoresizingMaskIntoConstraints = false
    gameTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
    gameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    gameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    gameTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  func createPlayView() {
    playView.backgroundColor = .black
    view.addSubview(playView)
    playView.translatesAutoresizingMaskIntoConstraints = false
    playView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
    playView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
    playView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
    playView.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  func createVoteView() {
    vote.backgroundColor = .black
    view.addSubview(vote)
    vote.translatesAutoresizingMaskIntoConstraints = false
    vote.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
    vote.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
    vote.widthAnchor.constraint(equalToConstant: 200).isActive = true
    vote.heightAnchor.constraint(equalToConstant: 200).isActive = true
    createPresidentVote()
    createChancellorVote()
    createJaButton()
  }
  
  func createJaButton() {
    jaVote.setTitle("Ja", for: .normal)
    jaVote.titleLabel?.font = .systemFont(ofSize: 30)
    jaVote.backgroundColor = .green
    jaVote.addTarget(self, action: #selector(letsVote), for: .touchUpInside)
    view.addSubview(jaVote)
    jaVote.translatesAutoresizingMaskIntoConstraints = false
    jaVote.bottomAnchor.constraint(equalTo: vote.bottomAnchor, constant: -10).isActive = true
    jaVote.leadingAnchor.constraint(equalTo: vote.leadingAnchor, constant: 5).isActive = true
    jaVote.widthAnchor.constraint(equalToConstant: 90).isActive = true
    jaVote.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    neinVote.setTitle("Nein", for: .normal)
    neinVote.titleLabel?.font = .systemFont(ofSize: 30)
    neinVote.backgroundColor = .orange
    view.addSubview(neinVote)
    neinVote.translatesAutoresizingMaskIntoConstraints = false
    neinVote.bottomAnchor.constraint(equalTo: vote.bottomAnchor, constant: -10).isActive = true
    neinVote.trailingAnchor.constraint(equalTo: vote.trailingAnchor, constant: -5).isActive = true
    neinVote.widthAnchor.constraint(equalToConstant: 90).isActive = true
    neinVote.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
  @objc func letsVote() {
    player.voteCandidates(myVote: true)
  }
  func createPresidentVote() {
    preseidentVoteHeader.textColor = .white
    preseidentVoteHeader.text = "Elect President:"
    vote.addSubview(preseidentVoteHeader)
    preseidentVoteHeader.translatesAutoresizingMaskIntoConstraints = false
    preseidentVoteHeader.topAnchor.constraint(equalTo: vote.topAnchor, constant: 10).isActive = true
    preseidentVoteHeader.leadingAnchor.constraint(equalTo: vote.leadingAnchor, constant: 10).isActive = true
    preseidentVoteHeader.widthAnchor.constraint(equalToConstant: 180).isActive = true
    preseidentVoteHeader.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    preseidentVote.textColor = .white
    preseidentVote.text = "Joe"
    vote.addSubview(preseidentVote)
    preseidentVote.translatesAutoresizingMaskIntoConstraints = false
    preseidentVote.topAnchor.constraint(equalTo: vote.topAnchor, constant: 40).isActive = true
    preseidentVote.leadingAnchor.constraint(equalTo: vote.leadingAnchor, constant: 10).isActive = true
    preseidentVote.widthAnchor.constraint(equalToConstant: 180).isActive = true
    preseidentVote.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  func createChancellorVote() {
    chancellorVoteHeader.textColor = .white
    chancellorVoteHeader.text = "Elect Chancellor:"
    vote.addSubview(chancellorVoteHeader)
    chancellorVoteHeader.translatesAutoresizingMaskIntoConstraints = false
    chancellorVoteHeader.topAnchor.constraint(equalTo: vote.topAnchor, constant: 70).isActive = true
    chancellorVoteHeader.leadingAnchor.constraint(equalTo: vote.leadingAnchor, constant: 10).isActive = true
    chancellorVoteHeader.widthAnchor.constraint(equalToConstant: 180).isActive = true
    chancellorVoteHeader.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    chancellorVote.textColor = .white
    chancellorVote.text = "Peter"
    vote.addSubview(chancellorVote)
    chancellorVote.translatesAutoresizingMaskIntoConstraints = false
    chancellorVote.topAnchor.constraint(equalTo: vote.topAnchor, constant: 100).isActive = true
    chancellorVote.leadingAnchor.constraint(equalTo: vote.leadingAnchor, constant: 10).isActive = true
    chancellorVote.widthAnchor.constraint(equalToConstant: 180).isActive = true
    chancellorVote.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  func createGameTable() {
    gameTable.layer.cornerRadius = 80
    gameTable.backgroundColor = .gray
    view.addSubview(gameTable)
    gameTable.translatesAutoresizingMaskIntoConstraints = false
    gameTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
    gameTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
    gameTable.widthAnchor.constraint(equalToConstant: 200).isActive = true
    gameTable.heightAnchor.constraint(equalToConstant: 200).isActive = true
    createPlayerPosition()
  }
  
  func createPlayerPosition() {
    playerPosition[0].backgroundColor = .black
    playerPosition[0].text = namesArray[0]
    playerPosition[0].textColor = .white
    gameTable.addSubview(playerPosition[0])
    playerPosition[0].translatesAutoresizingMaskIntoConstraints = false
    playerPosition[0].topAnchor.constraint(equalTo: gameTable.topAnchor, constant: 5).isActive = true
    playerPosition[0].leadingAnchor.constraint(equalTo: gameTable.leadingAnchor, constant: 60).isActive = true
    playerPosition[0].widthAnchor.constraint(equalToConstant: 80).isActive = true
    playerPosition[0].heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    playerPosition[1].backgroundColor = .black
    playerPosition[1].text = namesArray[1]
    playerPosition[1].textColor = .white
    gameTable.addSubview(playerPosition[1])
    playerPosition[1].translatesAutoresizingMaskIntoConstraints = false
    playerPosition[1].topAnchor.constraint(equalTo: gameTable.topAnchor, constant: 60).isActive = true
    playerPosition[1].leadingAnchor.constraint(equalTo: gameTable.leadingAnchor, constant: 5).isActive = true
    playerPosition[1].widthAnchor.constraint(equalToConstant: 80).isActive = true
    playerPosition[1].heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    playerPosition[2].backgroundColor = .black
    playerPosition[2].text = namesArray[2]
    playerPosition[2].textColor = .white
    gameTable.addSubview(playerPosition[2])
    playerPosition[2].translatesAutoresizingMaskIntoConstraints = false
    playerPosition[2].topAnchor.constraint(equalTo: gameTable.topAnchor, constant: 60).isActive = true
    playerPosition[2].trailingAnchor.constraint(equalTo: gameTable.trailingAnchor, constant: -5).isActive = true
    playerPosition[2].widthAnchor.constraint(equalToConstant: 80).isActive = true
    playerPosition[2].heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    playerPosition[3].backgroundColor = .black
    playerPosition[3].textColor = .white
    playerPosition[3].text = namesArray[3]
    gameTable.addSubview(playerPosition[3])
    playerPosition[3].translatesAutoresizingMaskIntoConstraints = false
    playerPosition[3].topAnchor.constraint(equalTo: gameTable.topAnchor, constant: 115).isActive = true
    playerPosition[3].leadingAnchor.constraint(equalTo: gameTable.leadingAnchor, constant: 15).isActive = true
    playerPosition[3].widthAnchor.constraint(equalToConstant: 80).isActive = true
    playerPosition[3].heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    playerPosition[4].backgroundColor = .black
    playerPosition[4].textColor = .white
    playerPosition[4].text = namesArray[4]
    gameTable.addSubview(playerPosition[4])
    playerPosition[4].translatesAutoresizingMaskIntoConstraints = false
    playerPosition[4].topAnchor.constraint(equalTo: gameTable.topAnchor, constant: 115).isActive = true
    playerPosition[4].trailingAnchor.constraint(equalTo: gameTable.trailingAnchor, constant: -15).isActive = true
    playerPosition[4].widthAnchor.constraint(equalToConstant: 80).isActive = true
    playerPosition[4].heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  func createBoard() {
    board.backgroundColor = .black
    view.addSubview(board)
    board.translatesAutoresizingMaskIntoConstraints = false
    board.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    board.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    board.heightAnchor.constraint(equalToConstant: 410).isActive = true
    board.widthAnchor.constraint(equalToConstant: 410).isActive = true
    createLiberalColumn()
    createFascistColumn()
  }
  
  func createLiberalColumn() {
    liberalColumn.backgroundColor = .blue
    board.addSubview(liberalColumn)
    liberalColumn.translatesAutoresizingMaskIntoConstraints = false
    liberalColumn.topAnchor.constraint(equalTo: board.topAnchor, constant: 3).isActive = true
    liberalColumn.leadingAnchor.constraint(equalTo: board.leadingAnchor, constant: 5).isActive = true
    liberalColumn.trailingAnchor.constraint(equalTo: board.trailingAnchor, constant: -5).isActive = true
    liberalColumn.heightAnchor.constraint(equalToConstant: 200).isActive = true
    var lead = 10
    for i in 0..<liberalPolicyPlot.count {
      createLiberalPolicyPlot(index: i, leadBy: CGFloat(lead))
      lead += 80
    }
  }
  
  func createLiberalPolicyPlot(index: Int, leadBy: CGFloat) {
    liberalPolicyPlot[index].backgroundColor = .lightGray
    liberalColumn.addSubview(liberalPolicyPlot[index])
    liberalPolicyPlot[index].translatesAutoresizingMaskIntoConstraints = false
    liberalPolicyPlot[index].topAnchor.constraint(equalTo: liberalColumn.topAnchor, constant: 10).isActive = true
    liberalPolicyPlot[index].leadingAnchor.constraint(equalTo: liberalColumn.leadingAnchor, constant: leadBy).isActive = true
    liberalPolicyPlot[index].widthAnchor.constraint(equalToConstant: 60).isActive = true
    liberalPolicyPlot[index].heightAnchor.constraint(equalToConstant: 180).isActive = true
  }
  
  func createFascistColumn() {
    fascistColumn.backgroundColor = .red
    board.addSubview(fascistColumn)
    fascistColumn.translatesAutoresizingMaskIntoConstraints = false
    fascistColumn.bottomAnchor.constraint(equalTo: board.bottomAnchor, constant: -3).isActive = true
    fascistColumn.leadingAnchor.constraint(equalTo: board.leadingAnchor, constant: 5).isActive = true
    fascistColumn.trailingAnchor.constraint(equalTo: board.trailingAnchor, constant: -5).isActive = true
    fascistColumn.heightAnchor.constraint(equalToConstant: 200).isActive = true
    var lead = 5
    for i in 0..<fascistPolicyPlot.count {
      createFascistPolicyPlot(index: i, leadBy: CGFloat(lead))
      if i == 2 {
        lead += 4
      }
      lead += 66
    }
  }
  
  func createFascistPolicyPlot(index: Int, leadBy: CGFloat) {
    fascistPolicyPlot[index].backgroundColor = .lightGray
    fascistColumn.addSubview(fascistPolicyPlot[index])
    fascistPolicyPlot[index].translatesAutoresizingMaskIntoConstraints = false
    fascistPolicyPlot[index].topAnchor.constraint(equalTo: fascistColumn.topAnchor, constant: 10).isActive = true
    fascistPolicyPlot[index].leadingAnchor.constraint(equalTo: fascistColumn.leadingAnchor, constant: leadBy).isActive = true
    fascistPolicyPlot[index].widthAnchor.constraint(equalToConstant: 56).isActive = true
    fascistPolicyPlot[index].heightAnchor.constraint(equalToConstant: 180).isActive = true
  }
}
