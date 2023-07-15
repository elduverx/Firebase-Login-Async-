//
//  ContentView.swift
//  FireLogin
//
//  Created by Duver on 6/7/23.
//

import SwiftUI
import Firebase



struct ContentView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  var body: some View {
    Group{
      if viewModel.userSession != nil{
        TabView{
          ProfileView().tabItem {
            Image(systemName: "house.fill")
              Text("home")
          }
          .ignoresSafeArea()
          HomeView().tabItem {
            Image(systemName: "person.fill")
              Text("casa")
          }
        }
      } else{
        LoginView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
