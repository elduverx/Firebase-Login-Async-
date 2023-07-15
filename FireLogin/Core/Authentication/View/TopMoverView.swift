//
//  TopMoverView.swift
//  FireLogin
//
//  Created by Duver on 15/7/23.
//

import Foundation



import SwiftUI

struct TopMoverView: View {
  @StateObject var viewModel: HomeViewModel
  var body: some View {
    
    VStack(alignment: .leading){
      Text("Top Movers").font(.headline).padding()
      
      ScrollView(.horizontal){
        HStack{
          ForEach(viewModel.topMovingCoins){coin in
            TopMoverItemView(coin: coin)
          }
        }
        
      }
    }
  }
}
