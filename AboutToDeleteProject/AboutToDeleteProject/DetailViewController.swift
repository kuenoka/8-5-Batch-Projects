//
//  DetailViewController.swift
//  AboutToDeleteProject
//
//  Created by MCS on 12/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var array: [Item] = []
  var searchedItem: String!
  @IBOutlet weak var theTable: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    theTable.dataSource = self
    theTable.register(ProgrammaticTableViewCell.self, forCellReuseIdentifier: "cell")
    URLSession.shared.dataTask(with: URL(string: "https://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-NAME=FindingService&SECURITY-APPNAME=PaulRenf-PairedPr-PRD-23882c164-e7c59265&keywords=\(searchedItem ?? "")&RESPONSE-DATA-FORMAT=JSON")!){ (data,_,_) in
      guard let data = data else {return}
      guard let something = try? JSONDecoder().decode(SearchProduct.self, from: data) else {return}
      self.array = something.findItemsByKeywordsResponse[0].searchResult[0].item
      DispatchQueue.main.async {
        self.theTable.reloadData()
      }
    }.resume()
  }
  
}

extension DetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProgrammaticTableViewCell
    cell.downloadImage(title: array[indexPath.row].title[0], imageURL: array[indexPath.row].galleryURL[0])
    return cell
  }
  
  
}
