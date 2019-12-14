//
//  ContactViewModel.swift
//  MessageProject
//
//  Created by MCS on 12/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

class ContactViewModel {
  var contactViewModel = People(id: 1, person: "", password: "", contact: [])
  var viewModelURL: String!
  
  func getData(completion: (()-> Void)?) {
    guard let viewModelUrl = URL(string: viewModelURL) else {return}
    URLSession.shared.dataTask(with: viewModelUrl){ (data,_,_) in
      defer { completion?() }
      guard let data = data else {return}
      guard let contact = try? JSONDecoder().decode(People.self, from: data) else {return}
      self.contactViewModel = contact
    }.resume()
  }
  
  func getContact(index: Int) -> String {
    return contactViewModel.contact[index].person
  }
  
  func getNumberOfContacts() -> Int {
    return contactViewModel.contact.count
  }
  
  func addNewContact(newMessages: [Message], person: String, id: Int) {
 
    let contact = Contact(id: id, person: person, message: newMessages)
    contactViewModel.contact.append(contact)
    guard let uploadData = try? JSONEncoder().encode(contactViewModel) else { return }
    
    guard let url = URL(string: viewModelURL) else {return}//Remember to put ATS exception if the URL is not https
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
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
