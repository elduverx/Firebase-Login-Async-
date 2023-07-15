//
//  User.swift
//  FireLogin
//
//  Created by Duver on 9/7/23.
//

import Foundation

struct User: Identifiable, Codable{
  let id: String
  let fullname: String
  let email: String
  
  var initals: String{
    let formatter = PersonNameComponentsFormatter()
    if let components = formatter.personNameComponents(from: fullname){
      formatter.style = .abbreviated
      return formatter.string(from: components)
    }
    return ""
  }
  
}

extension User{
  static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "el Duver juanito perez", email: "tested@gmail.com")
}
