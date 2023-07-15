//
//  SettingsRowView.swift
//  FireLogin
//
//  Created by Duver on 9/7/23.
//

import SwiftUI

struct SettingsRowView: View {
  let imageName: String
  let title:String
  let tintColor:Color
  
  
    var body: some View {
      HStack{
        Image(systemName: imageName)
          .imageScale(.small)
          .font(.title)
          .foregroundColor(tintColor)
        Text(title)
          .font(.subheadline)
          .foregroundColor(.black)
      }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
      SettingsRowView(imageName: "sofa.fill", title: "version", tintColor: .black)
    }
}
