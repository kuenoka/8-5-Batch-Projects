//
//  ViewController.swift
//  CollectionViewInTableViewProject
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var categoriesArray = ["yellow+flowers", "blue+flowers", "purple+flowers", "white+flowers", "pink+flowers"]
    var tableArray: [UICollectionView] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        URLSession.shared.dataTask(with: URL(string: "https://pixabay.com/api/?key=13466097-dd8cc09427e40108d19a70079&q=\(categoriesArray[index])&image_type=photo&pretty=true")!) { (data, _, _) in
            guard let data = data else {return}
            guard let clue = try? JSONDecoder().decode([Jeopardy].self, from: data) else {
                print("Something went wrong")
                return
            }
            
            DispatchQueue.main.async{
                self.clueArray = clue
                self.jeopardyTable.reloadData()
            }
            }.resume()
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
