//
//  ViewController.swift
//  SingletonProject
//
//  Created by MCS on 8/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonNamelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let group = DispatchGroup()
        var pokemonArray: [Pokemon] = []
        for _ in 1...6 {
            group.enter()
            getRandonPokemon{ (pokemon) in
                defer { group.leave() }
                guard let pokemon = pokemon else {return}
                pokemonArray.append(pokemon)
            }
        }
        
        group.notify(queue: .main){
            //This is where we do the work after all the calls are done
            let pokemonNameString = pokemonArray.isEmpty
                ? "No Pokemon found"
                : String(pokemonArray.reduce("", { $0 + $1.name + "/"}).dropLast(1))
            self.pokemonNamelabel.text = pokemonNameString
        }
    
        // Do any additional setup after loading the view.
//        let theSingleton = MySingleton.shared
        
//        print("1")
//        DispatchQueue.global().async{
//            print("3")
//            DispatchQueue.main.sync{
//                print("4")
//            }
//            print("5")
//        }
//        print("2")
    }
        //12345
//        URLSession.shared.dataTask(with: URL(string: "https://pokeapi.co/api/v2/pokemon/34")!){ (data, _, _) in
//            guard let data = data else {return}
//            let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
//            DispatchQueue.global().async{
//                for number in 0 ... 100000{
//                    print(number)
//                }
//            }
////            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
////                self.pokemonNamelabel.text = pokemon?.name
////            })
//            DispatchQueue.main.async{
//                self.pokemonNamelabel.text = pokemon?.name
//            }
//        }.resume()
//    }
    
    func getRandonPokemon(completion: @escaping (Pokemon?) -> Void) {
        let pokemonNumber = Int.random(in: 1...807)
        URLSession.shared.dataTask(with: URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonNumber)")!) { (data, _, _) in
            guard let data = data,
            let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else { completion(nil)
                return
            }
            completion(pokemon)
        }.resume()
    }
}

struct Pokemon: Codable {
    let name: String
}

//class MySingleton {
//
//    static let shared = MySingleton()
//
//    private init() { }
//}

