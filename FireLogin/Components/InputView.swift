//
//  Form.swift
//  FireLogin
//
//  Created by Duver on 6/7/23.
//

import SwiftUI

struct InputView: View {
  @Binding var text: String
  let title: String
  let placeholder: String
  var isSecureField: Bool = false
  
    var body: some View {
      VStack(alignment: .leading){
        Text(title)
          .foregroundColor(Color(.darkGray))
          .fontWeight(.semibold)
          .font(.footnote)
        
        if isSecureField{
          SecureField(placeholder, text: $text)
            .font(.system(size: 14))
        } else{
          TextField(placeholder, text: $text)
            .font(.system(size: 14))
        }
        Divider()
      }
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
      InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}
