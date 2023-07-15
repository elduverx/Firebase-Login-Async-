//
//  CoinRowView.swift
//  FireLogin
//
//  Created by Duver on 15/7/23.
//


import SwiftUI
import Kingfisher

struct CoinRowView: View {
  let coin: Coin
    var body: some View {
      VStack(alignment: .leading){
//        number list
        HStack{
          Text("\(coin.marketCapRank ?? 1)").font(.footnote).foregroundColor(.gray)
          //        image
          
          KFImage(URL(string: coin.image)).resizable().scaledToFit().frame(width: 32,height: 32)
        
  //        name coin
          VStack(alignment: .leading){
            Text(coin.name).font(.subheadline)
            Text(coin.symbol.uppercased()).font(.caption).foregroundColor(.gray).padding(.leading,2)
          }
          Spacer()
          
            VStack(alignment: .trailing){
              Text((coin.currentPrice.toCurrency())).font(.subheadline).padding(.leading,4)
              Text(coin.priceChangePercentage24H.toPercent()).font(.caption)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green:.red)
            }
          
        }.padding(.horizontal)
          .padding(.vertical,4)

        
//        price coin info
      }
      
    }
}

//struct CoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
