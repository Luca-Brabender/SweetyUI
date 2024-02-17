//
//  LoginScreenView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct LoginScreenView: View {
    var body: some View {
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
            HStack{
                Text("No Account?")
                Button{
                    
                } label: {
                    Text("Register")
                        .underline()
                        .tint(.primary)
                        .bold()
                }
            }.padding(.trailing, 160)
            
            
            Spacer()
        }
        .navigationTitle("Profile")
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
