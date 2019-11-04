//
//  ViewController.swift
//  Abercrombie_CodeTest
//
//  Created by MCS on 9/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var cardsTableView: UITableView!
  private var cardArray = ViewModel()
  override func viewDidLoad() {
    super.viewDidLoad()
    cardsTableView.dataSource = self
//    cardsTableView.register(UINib.init(nibName: "CardTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    cardsTableView.register(ProgrammaticCardTableViewCell.self, forCellReuseIdentifier: "cell")
    self.cardArray.getData {
      DispatchQueue.main.async {
        self.cardsTableView.reloadData()
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
      
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cardArray.numberOfCards()
  }
  
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardTableViewCell
//    cell.card = cardArray.card(at: indexPath.row)
//    cell.delegate = self
//    cell.titleLabel.text = cardArray.card(at: indexPath.row).title
//    cell.promoMessageLabel.text = cardArray.card(at: indexPath.row).promoMessage
//    cell.downloadImage(from: URL(string: cardArray.card(at: indexPath.row).backgroundImage)!)
//    cell.buttonDescriptionLabel.text = cardArray.card(at: indexPath.row).bottomDescription
//    cell.topDescriptionLabel.text = cardArray.card(at: indexPath.row).topDescription
//    cell.menButtonOutlet.setTitle("", for: .normal)
//    if cardArray.card(at: indexPath.row).content != nil {
//      cell.menButtonOutlet.setTitle(cardArray.card(at: indexPath.row).content?[0].title, for: .normal)
//    }
//    cell.womenButtonOutlet.setTitle("", for: .normal)
//    if cardArray.card(at: indexPath.row).content?.count == 2 {
//      cell.womenButtonOutlet.setTitle(cardArray.card(at: indexPath.row).content?[1].title, for: .normal)
//    }
//    return cell
//  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProgrammaticCardTableViewCell
    print(cardArray.card(at: indexPath.row))
    cell.card = cardArray.card(at: indexPath.row)
    cell.delegate = self
    cell.downloadImage(from: URL(string: cardArray.card(at: indexPath.row).backgroundImage)!)
    cell.addTopDescription(description: "")
    if let topDescription = cardArray.card(at: indexPath.row).topDescription {
      cell.addTopDescription(description: topDescription)
    }
    cell.addTitle(title: cardArray.card(at: indexPath.row).title)
    cell.addPromoMessage(promoMessage: "")
    if let newPromoMessage = cardArray.card(at: indexPath.row).promoMessage {
      cell.addPromoMessage(promoMessage: newPromoMessage)
    }
    cell.addBottomDescription(bottomDescription: "")
    if let newbottomDescription = cardArray.card(at: indexPath.row).bottomDescription {
      cell.addBottomDescription(bottomDescription: newbottomDescription)
    }
    cell.addFirstButtonTitle(buttonTitle: "")
    if let newFirstButton = cardArray.card(at: indexPath.row).content?[0].title{
      cell.addFirstButtonTitle(buttonTitle: newFirstButton)
    }
    cell.addSecondButtonTitle(buttonTitle: "")
    if cardArray.card(at: indexPath.row).content?.count == 2 {
      if let newSecondButton = cardArray.card(at: indexPath.row).content?[1].title{
        cell.addSecondButtonTitle(buttonTitle: newSecondButton)
      }
      //cell.addSecondButtonTitle(buttonTitle: cardArray.card(at: indexPath.row).content?[1].title ?? "")
    }
    cell.setConstraint()
    return cell
  }
  
}

extension ViewController: CardTableViewCellDelegate {
  
  func openWeb(with value: String, available: Bool) {
    if available == true {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
      nextViewController.urlString = value
      navigationController?.pushViewController(nextViewController, animated: true)
    }
  }
  
}

