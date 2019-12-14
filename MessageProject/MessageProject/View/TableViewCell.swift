//
//  TableViewCell.swift
//  MessageProject
//
//  Created by MCS on 12/12/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  let messageLabel = UILabel()
  let personLabel = UILabel()
  let view = UIView()
  
  func setConstraints() {
    view.layer.cornerRadius = 15
    contentView.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
    view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
    
    messageLabel.font = .systemFont(ofSize: 20)
    messageLabel.textColor = .white
    messageLabel.numberOfLines = 0
    view.addSubview(messageLabel)
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    messageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
    messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    messageLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
    
    personLabel.font = .systemFont(ofSize: 10)
    personLabel.textColor = .white
    view.addSubview(personLabel)
    personLabel.translatesAutoresizingMaskIntoConstraints = false
    personLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor).isActive = true
    personLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
    personLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    personLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    personLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
  }
}
