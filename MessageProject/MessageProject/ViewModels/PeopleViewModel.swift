//
//  PeopleViewModel.swift
//  MessageProject
//
//  Created by MCS on 12/7/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

class PeopleViewModel {
  private var peopleViewModel = [People]()
  private let peopleURL = URL(string: "http://localhost:8000/People")
  
  func getData(completion: (()-> Void)?) {
    guard let viewModelUrl = peopleURL else { return }
    URLSession.shared.dataTask(with: viewModelUrl){ (data,_,_) in
      defer { completion?() }
      guard let data = data else {return}
      guard let person = try? JSONDecoder().decode([People].self, from: data) else {return}
      self.peopleViewModel = person
    }.resume()
  }
  
  func getPeople(index: Int) -> String {
    return peopleViewModel[index].person
  }
  
  func getPassword(index: Int) -> String {
    return peopleViewModel[index].password
  }
  
  func getNumberOfPeople() -> Int {
    return peopleViewModel.count
  }
  
  func addNewPerson(newPerson: String, id: Int, password: String) {
  
     let person = People(id: id, person: newPerson, password: password)
     peopleViewModel.append(person)
     guard let uploadData = try? JSONEncoder().encode(person) else { return }
     
     let url = peopleURL //Remember to put ATS exception if the URL is not https
     var request = URLRequest(url: url!)
     request.httpMethod = "POST"
     request.setValue("application/json", forHTTPHeaderField: "Content-Type")

     let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
         if let error = error {
             print ("error: \(error)")
             return
         }

         guard let response = response as? HTTPURLResponse,
             (200...299).contains(response.statusCode) else {
             print ("server error")
             return
         }
         if let mimeType = response.mimeType,
             mimeType == "application/json",
             let data = data,
             let dataString = String(data: data, encoding: .utf8) {
             print ("got data: \(dataString)")
         }
     }
     task.resume()
    
   }
}
