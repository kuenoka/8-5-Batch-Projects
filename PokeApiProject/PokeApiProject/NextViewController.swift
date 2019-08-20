//
//  NextViewController.swift
//  PokeApiProject
//
//  Created by MCS on 8/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    var nextURLArray:  [SecondTuple] = []
    var resultArray: [Result] = []
    
    @IBOutlet weak var urlTableView: UITableView!
    
    var nextURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
            urlTableView.dataSource = self
//            urlTableView.delegate = self
            urlTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//
        URLSession.shared.dataTask(with: URL(string: nextURL ?? "")!) { (data, _, _) in
                guard let data = data else {return}

                guard let nextAPI = try? JSONDecoder().decode(NextAPI.self, from: data) else {
                    print("Something went wrong")
                    return
                }
    
                let mirror = Mirror(reflecting: nextAPI)

                for child in mirror.children{
                    let secondTuple = SecondTuple(property: child.label ?? "", output: child.value)
                    self.nextURLArray.append(secondTuple)
                }
                DispatchQueue.main.async{
                    self.urlTableView.reloadData()
                }
                }.resume()

        // Do any additional setup after loading the view.
    }

}

extension NextViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nextURLArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.numberOfLines = 0
        
        if nextURLArray[indexPath.row].property == "count" || nextURLArray[indexPath.row].property == "next" || nextURLArray[indexPath.row].property == "previous"{
            cell.textLabel?.text = "\(nextURLArray[indexPath.row].property)" + ":" + "\(nextURLArray[indexPath.row].output )"
        }
        if nextURLArray[indexPath.row].property == "results"{
            cell.textLabel?.text = "\(nextURLArray[indexPath.row].property)"
        }
        return cell
    }
}

extension NextViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
////
////        nextViewController.nextURL = pokeAPIArray[indexPath.row].myURL
////
////        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
