//
//  MessageViewModel.swift
//  MessageProject
//
//  Created by MCS on 12/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

class MessageViewModel {
  
  var senderViewModel = People(id: 1, person: "", password: "", contact: [Contact(id: 2, person: "", message: [])])
  var senderViewModelURL: String!
  
  func getData(completion: (()-> Void)?) {
    guard let viewModelUrl = URL(string: senderViewModelURL) else { return }
    URLSession.shared.dataTask(with: viewModelUrl){ (data,_,_) in
      defer { completion?() }
      guard let data = data else {return}
      guard let message = try? JSONDecoder().decode(People.self, from: data) else {return}
      self.senderViewModel = message
    }.resume()
  }
  
  func getMessageSender(contactIndex: Int, messageIndex: Int) -> String {
    return senderViewModel.contact[contactIndex].message[messageIndex].message
  }
  
  func getMessageSenderContact(contactIndex: Int, messageIndex: Int) -> String {
    return senderViewModel.contact[contactIndex].message[messageIndex].person
  }
  
  func getNumberOfMessageSender(contactIndex: Int) -> Int {
    return senderViewModel.contact[contactIndex].message.count
  }
  
  func addNewMessage(newMessage: Message, contactindex: Int){
    
    senderViewModel.contact[contactindex].message.append(newMessage)
    guard let uploadData = try? JSONEncoder().encode(senderViewModel) else { return }
    
    let url = URL(string: senderViewModelURL) //Remember to put ATS exception if the URL is not https
    var request = URLRequest(url: url!)
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
