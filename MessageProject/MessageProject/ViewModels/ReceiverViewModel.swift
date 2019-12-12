//
//  ReceiverViewModel.swift
//  MessageProject
//
//  Created by MCS on 12/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

class ReceiverViewModel {
  var receiverViewModel = People(id: 1, person: "", password: "", contact: [Contact(id: 2, person: "", message: [])], userURL: "")
  var receiverViewModelURL: String!
  
  func getDataReceiver(completion: (()-> Void)?) {
    guard let viewModelUrl = URL(string: receiverViewModelURL) else { return }
    URLSession.shared.dataTask(with: viewModelUrl){ (data,_,_) in
      defer { completion?() }
      guard let data = data else {return}
      guard let message = try? JSONDecoder().decode(People.self, from: data) else {return}
      self.receiverViewModel = message
    }.resume()
  }
  
  func getMessageReceiver(contactIndex: Int, messageIndex: Int) -> String {
    return receiverViewModel.contact[contactIndex].message[messageIndex]
  }
  func getNumberOfMessageReceiver(contactIndex: Int) -> Int {
    return receiverViewModel.contact[contactIndex].message.count
  }
  func getNumberOfContact() -> Int {
    return receiverViewModel.contact.count
  }
  func getMessageReceiverContact(contactIndex: Int) -> String {
    return receiverViewModel.contact[contactIndex].person
  }
  func addNewMessage(newMessage: String, contactindex: Int){//, receiverIndex: Int) {
   
      //let message = Message(id: id, message: newMessage, person: person)
      receiverViewModel.contact[contactindex].message.append(newMessage)
      guard let uploadData = try? JSONEncoder().encode(receiverViewModel) else { return }
      
      let url = URL(string: receiverViewModelURL) //Remember to put ATS exception if the URL is not https
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
