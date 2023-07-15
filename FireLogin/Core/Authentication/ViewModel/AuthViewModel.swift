//
//  AuthViewModel.swift
//  FireLogin
//
//  Created by Duver on 10/7/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

protocol  AuthenticationFormProtocol{
  var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject{
  @Published var userSession: FirebaseAuth.User?
  @Published var currentUser: User?
  
  init(){
    self.userSession = Auth.auth().currentUser
    
    Task{
      await fetchUser()
    }
  }
  
  func signIn(withEmail email:String,password:String) async throws{
    
    do {
     let result = try await Auth.auth().signIn(withEmail: email, password: password)
      self.userSession = result.user
      await fetchUser()
    } catch  {
      print("DEBUG: ERROR WITH SIGN IN \(error.localizedDescription)")
    }
    
  }
  func createUser(withEmail email:String, password: String, fullname:String) async throws{
    do{
      let result = try await Auth.auth().createUser(withEmail: email, password: password)
      self.userSession = result.user
      let user = User(id: result.user.uid, fullname: fullname, email: email)
      let encodedUser = try Firestore.Encoder().encode(user)
      try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
      await fetchUser()
      
    } catch{
      print("DEBUG: Failed to create user \(error.localizedDescription)")
    }
  }
  func signOut(){
    do {
      try Auth.auth().signOut()  // signs out from backend
      
      self.userSession = nil // wipes  out sign out and throws to us back login Screen
      self.currentUser = nil // wipes out current user data model 
      
    } catch  {
      print("error with sign out \(error.localizedDescription)")
    }
  }
  func deleteAccount(){
    
  }
  
  func fetchUser() async{
    guard let uid = Auth.auth().currentUser?.uid else {return}
    guard let snapShot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
    self.currentUser = try?  snapShot.data(as: User.self)
    
  }
  
  
}
