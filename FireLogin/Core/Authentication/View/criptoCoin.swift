//
//  criptoCoin.swift
//  FireLogin
//
//  Created by Duver on 15/7/23.
//

import Foundation

import SwiftUI

struct criptoCoin: View {
  @StateObject var viewModel = HomeViewModel()
    var body: some View {
      NavigationView {
        ScrollView(.vertical,showsIndicators: false) {
//         top movers views
          TopMoverView(viewModel: viewModel)
          Divider()
          
          AllCoinView(viewModel: viewModel)
         
          
//          all coins view
        }
        .navigationTitle("Live Prices")
      }
      
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        criptoCoin()
//    }
//}
