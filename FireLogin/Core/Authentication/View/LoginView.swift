//
//  LoginView.swift
//  FireLogin
//
//  Created by Duver on 6/7/23.
//

import SwiftUI

struct LoginView: View {
  @State private var email = ""
  @State private var password = ""
  @EnvironmentObject var viewModel: AuthViewModel
  
    var body: some View {
      NavigationStack{
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
            InputView(text: $password, title: "Escribe la Contraseña", placeholder: "Password",
              isSecureField: true
              )
            .textInputAutocapitalization(.never)
          }.padding(.horizontal)
          .padding(.top,12)
          
//          botton
          
          Button {
            Task{
              
             try await   viewModel.signIn(withEmail: email, password: password)
            }
          } label: {
            HStack(alignment: .center){
              Text("SIGN IN")
                .fontWeight(.semibold)
              Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 32,height: 48 )
          }
          .background(Color(.systemBlue))
          .disabled(!formIsValid)
          .opacity(formIsValid ? 1.0 : 0.5)
          .cornerRadius(10)
          .padding(.top,30)

          
          Spacer()
          
//          sign up button
          NavigationLink {
            Registration()
              .navigationBarBackButtonHidden()
          } label: {
            HStack(spacing: 3){
              Text("Don't have an account?")
              Text("Sign Up").fontWeight(.bold)
            }.font(.system(size: 15))
          }

          
          
          
        }.padding()
      }
    }
}

// MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol{

  
  var formIsValid: Bool {
    return !email.isEmpty
    && email.contains("gmail")
    && !password.isEmpty
    && password.count  > 5
  }
  
  
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
