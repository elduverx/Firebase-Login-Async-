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
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var viewModel: AuthViewModel
  
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
        InputView(text: $fullname, title: "Nombre Completo", placeholder: "el primo del duver")
        InputView(text: $password, title: "Escribe la Contraseña", placeholder: "Password",
                  isSecureField: true)
        ZStack(alignment: .trailing){
          
          InputView(text: $confirmPassword, title: "Confirma la Contraseña", placeholder: "Password",
                    isSecureField: true)
          if !password.isEmpty && !confirmPassword.isEmpty{
            if password == confirmPassword {
              Image(systemName: "checkmark.circle.fill")
                .scaledToFill()
                .fontWeight(.bold)
                .foregroundColor(Color(.systemGreen))
            }else{
              Image(systemName: "xmark.circle.fill")
                .scaledToFill()
                .fontWeight(.bold)
                .foregroundColor(Color(.systemRed))
            }
          }
        }
          
        }.padding(.horizontal)
          .padding(.top,12)
          .padding(.bottom,30)
        
        //          botton
        
        Button {
          Task{
            try await viewModel.createUser(withEmail:email,
                                           password:password
                                           ,fullname:fullname)
          }
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
        .disabled(!formIsValid)
        .opacity(formIsValid ? 1.0 : 0.5)
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
  


// MARK: - AuthenticationFormProtocol
extension Registration: AuthenticationFormProtocol{

  
  var formIsValid: Bool {
    return !email.isEmpty
    && email.contains("gmail")
    && !password.isEmpty
    && password.count  > 5
    && confirmPassword == password
    && !fullname.isEmpty
  }
  
  
}


struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    Registration()
  }
}
