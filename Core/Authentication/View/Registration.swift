//
//  SignUpView.swift
//  FireLogin
//
//  Created by Duver on 6/7/23.
//

import SwiftUI

struct Registration: View {
  
  @State private var email = ""
  @State private var fullname = ""
  @State private var password = ""
  @State private var confirmPassword = ""
  var body: some View {
    VStack{
      //          image
      
      Image("firebase-logo")
        .resizable()
        .scaledToFill()
        .frame(width: 100, height: 120)
        .padding(.vertical,32)
      
      
      //          form fields
      
      VStack(spacing: 24){
        InputView(text: $email, title: "Correo Electronico", placeholder: "elprimico@example.com").textInputAutocapitalization(.never)
        InputView(text: $fullname, title: "Nombre Completo", placeholder: "elprimico@example.com")
        InputView(text: $password, title: "Escribe la Contraseña", placeholder: "Password",
                  isSecureField: true)
        
        InputView(text: $confirmPassword, title: "Confirma la Contraseña", placeholder: "Password",
                  isSecureField: true)
        
      }.padding(.horizontal)
        .padding(.top,12)
        .padding(.bottom,30)
      
      //          botton
      
      Button {
        print("user sign up")
      } label: {
        HStack(alignment: .center){
          Text("SIGN UP")
            .fontWeight(.semibold)
          Image(systemName: "arrow.right")
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width - 32,height: 48 )
      }
      .background(Color(.systemBlue))
      .cornerRadius(10)
      
      
      Spacer()
      
      //          sign up button
                NavigationLink {
                  LoginView().navigationBarBackButtonHidden()
                } label: {
                  HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign In").fontWeight(.bold)
                  }.font(.system(size: 15))
                }
      
      
    }.padding()
  }
  
}


struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    Registration()
  }
}
