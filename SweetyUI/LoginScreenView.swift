//
//  LoginScreenView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct LoginScreenView: View {
    @EnvironmentObject var authSettings: AuthSettings
    @State var showSheet = false
    @State var isDarkMode = false
    
    var body: some View {
        
        if(authSettings.user == nil){
            
            
            VStack(spacing:30){
                
                VStack(alignment: .leading){
                    Text("Profile")
                        .font(.system(size: 25))
                    Text("Log in, to make your next shopping experience.")
                        .foregroundColor(.gray)
                        .font(.system(size: 22))
                }
                .padding(.top, 25)
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .padding(.bottom)
                
                Button{
                    showSheet = true
                } label: {
                    Text("Login")
                        .frame(maxWidth: .maximum(100, 340), maxHeight: .maximum(10, 50))
                        .controlSize(.large)
                        .tint(.mint)
                        .foregroundColor(.mint)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                            //.fill(Color.mint)
                                .stroke(Color.mint, lineWidth: 2)
                        )
                }
                .sheet(isPresented: $showSheet){
                    SignInView(isRegistered: false)
                }.environmentObject(authSettings)
                
                HStack{
                    Text("No Account?")
                    Button{
                        showSheet = true
                    } label: {
                        Text("Register")
                            .underline()
                            .tint(.primary)
                            .bold()
                    }
                }.padding(.trailing, 160)
                    .sheet(isPresented: $showSheet){
                        SignInView(isRegistered: true)
                    }.environmentObject(authSettings)
                Spacer()
            }
            .navigationTitle("Profile")
        } else {
            VStack{
                NavigationStack{
                    Form {
                        Toggle("Dark Mode", isOn: $isDarkMode)
                        Section{
                            Button("Sign off"){
                                authSettings.delete()
                            }
                        }
                    }
                    .navigationTitle("Hello, \(authSettings.user!.userName)")
                }
                
            }
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView().environmentObject(AuthSettings(user: User(userName: "User678", email: "user678@email.com"), shoppingCart: nil))
        
        LoginScreenView().environmentObject(AuthSettings(user: User(userName: "User678", email: "user678@email.com"), shoppingCart: nil))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        
        
    }
}
