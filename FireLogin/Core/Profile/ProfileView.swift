//
//  ProfileView.swift
//  FireLogin
//
//  Created by Duver on 9/7/23.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
      
      if let user = viewModel.currentUser {
        List{
          Section(){
            HStack{
              Text(user.initals).font(.title)
                .frame(width: 64,height: 64)
                .background(Color(.systemBlue))
                .clipShape(Circle())
              VStack(alignment: .leading){
                Text(user.fullname).font(.subheadline)
                  .fontWeight(.semibold)
                
                Text(user.email)
                  .font(.footnote)
                  .foregroundColor(.gray)
              }
            }
            
          }
          Section("general"){
            HStack{
            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.gray))
              Spacer()
              Text("1.0.0").font(  .subheadline).foregroundColor(.gray)
            }
            SettingsRowView(imageName: "shareplay", title: "Find me", tintColor: Color(.gray))
            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.gray))
            
            HStack{
              SettingsRowView(imageName: "applelogo", title: "la manzanita", tintColor: Color(.gray))
              Spacer()
  //           add to favorite with interaction
              
              ForEach(0..<5){_ in
                
                Image(systemName: "star.fill").foregroundColor(.yellow)
              }
            }
          }
          Section("Account"){
            
            Button {
              viewModel.signOut()
            } label: {
              
                SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.red))
            }
            
            Button {
              print("account deleted")
            } label: {
              
              SettingsRowView(imageName: "x.circle.fill", title: "Delete Account", tintColor: Color(.red))
            }
            
            Button {
              print("account deleted")
            } label: {
              
              SettingsRowView(imageName: "applelogo", title: "criptos", tintColor: .orange)
              
            }

            
          }
         
        }
        .padding(.top,30)

      }
      VStack{
      
      }
    }


}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
