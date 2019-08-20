//
//  ViewController.swift
//  PokeApiProject
//
//  Created by MCS on 8/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pokeAPIArray: [FirstTuple] = []
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        URLSession.shared.dataTask(with: URL(string: "https://pokeapi.co/api/v2")!) { (data, _, _) in
            guard let data = data else {return}
            
            guard let pokeAPI = try? JSONDecoder().decode(PokeAPI.self, from: data) else {
                print("Something went wrong")
                return
            }
            
            let mirror = Mirror(reflecting: pokeAPI)
            
            for child in mirror.children{
                let firstTuple = FirstTuple(property: child.label ?? "", myURL: child.value as! String)
                self.pokeAPIArray.append(firstTuple)
            }
            DispatchQueue.main.async{
                self.homeTableView.reloadData()
            }
            }.resume()
        
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeAPIArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(pokeAPIArray[indexPath.row].property)" + pokeAPIArray[indexPath.row].myURL
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        
        nextViewController.nextURL = pokeAPIArray[indexPath.row].myURL
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

