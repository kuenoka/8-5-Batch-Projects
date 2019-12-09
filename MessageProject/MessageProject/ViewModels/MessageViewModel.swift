//
//  MessageViewModel.swift
//  MessageProject
//
//  Created by MCS on 12/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

class MessageViewModel {
  private var messageViewModel = [Message]()
  private let viewModelURL = URL(string: "http://localhost:3000/MessageJSON")
  
  func getData(completion: (()-> Void)?) {
    guard let viewModelUrl = viewModelURL else { return }
    URLSession.shared.dataTask(with: viewModelUrl){ (data,_,_) in
      defer { completion?() }
      guard let data = data else {return}
      guard let message = try? JSONDecoder().decode([Message].self, from: data) else {return}
      self.messageViewModel = message
    }.resume()
  }
  
  func getMessage(index: Int) -> String {
    return messageViewModel[index].message
  }
  
  func getPerson(index: Int) -> String {
    return messageViewModel[index].person
  }
  
  func getNumberOfMessage() -> Int {
    return messageViewModel.count
  }
  
  func addNewMessage(newMessage: String, person: String, id: Int) {
 
    let message = Message(id: id, message: newMessage, person: person)
    guard let uploadData = try? JSONEncoder().encode(message) else { return }
    
    let url = viewModelURL //Remember to put ATS exception if the URL is not https
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
  
  func changeMessage(newMessage: String, person: String, id: Int) {
   
      let message = Message(id: 1, message: "YOLO", person: "King")
      guard let uploadData = try? JSONEncoder().encode(message) else { return }
      
      let url = URL(string: "http://localhost:3000/MessageJSON/1") //Remember to put ATS exception if the URL is not https
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
