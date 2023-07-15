
//  Created by Duver on 15/6/23.
//

import SwiftUI
import Kingfisher

struct TopMoverItemView: View {
  let coin: Coin
    var body: some View {
      VStack{
//        image
        KFImage(URL(string: coin.image)).resizable().scaledToFill().frame(width: 40,height: 40)
        
//        coin info
        HStack(spacing: 2){
          Text("\(coin.name)").font(.caption).fontWeight(.bold)
          Text((coin.currentPrice.toCurrency())).font(.caption).foregroundColor(.gray)
        }
//        coin percent change
        Text(coin.priceChangePercentage24H.toPercent())
          .foregroundColor(coin.priceChangePercentage24H > 0 ? .green:.red)
      }.frame(width: 140,height: 140).background(Color("ligthdark")).overlay(
        RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4),lineWidth: 2.3))
    }
}

//struct TopMoverItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoverItemView()
//    }
//}
