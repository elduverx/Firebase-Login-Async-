//
//  FireLoginApp.swift
//  FireLogin
//
//  Created by Duver on 6/7/23.
//

import SwiftUI
import Firebase

@main
struct FireLoginApp: App {
  @StateObject var viewModel = AuthViewModel()
  
  init(){
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(viewModel)
        }
    }
}
