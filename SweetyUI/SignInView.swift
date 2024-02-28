//
//  SignInView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 19.02.24.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authSettings: AuthSettings
    
    @State var username = ""
    @State var password = ""
    @State var email = ""
    @State var isRegistered: Bool;
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.thickMaterial)
                    .frame(
                        width: geometry.size.width*0.9,
                        height: geometry.size.height*0.5,
                        alignment: .top
                    )
                    .padding(.bottom, geometry.size.height*0.2)
                
                
                
                VStack{
                    if(!isRegistered){
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            Text("Sign In")
                                .font(.system(size: 30, weight: .heavy, design: .default))
                                .foregroundColor(Color.mint)
                                .position(x:geometry.size.width*0.4, y:geometry.size.height*0.25)
                            
                            TextField("Username", text: $username)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20.0)
                            
                            
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20.0)
                            
                            
                            
                        }.padding([.leading, .trailing], geometry.size.width*0.1)
                        
                        
                        VStack{
                            Button(action: {
                                authSettings.authenticate(
                                    User(userName: username, email: email),
                                    true
                                )
                                dismiss()
                            }){
                                Text("Login")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color.mint)
                                    .cornerRadius(15.0)
                            }.padding(.top, 40)
                            
                            
                            HStack{
                                Text("No Account?")
                                    .foregroundColor(.mint)
                                Button{
                                    withAnimation(.default){
                                        isRegistered.toggle()
                                    }
                                } label: {
                                    Text("Register")
                                        .underline()
                                        .tint(.primary)
                                        .bold()
                                        .foregroundColor(.mint)
                                }
                            }
                        }.padding(.bottom, geometry.size.height*0.4)
                        
                    } else {
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text("Register")
                                .font(.system(size: 30, weight: .heavy, design: .default))
                                .foregroundColor(Color.mint)
                                .position(x: geometry.size.width * 0.4,y: geometry.size.height * 0.22)
                            
                            
                            TextField("Username", text: $username)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20.0)
                            
                            
                            TextField("E-mail", text: $email)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20.0)
                            
                            
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20.0)
                            
                            
                            
                        }.padding([.leading, .trailing], geometry.size.height*0.05)
                        
                        
                        
                        
                        Button(action: {
                            Task{
                                authSettings.authenticate(
                                    User(userName: username, email: email),
                                    true
                                )
                                dismiss()
                            }
                        }){
                            Text("Register")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.mint)
                                .cornerRadius(15.0)
                        }.padding(.top, 20)
                        
                        
                        HStack{
                            Text("Already having an Account? ")
                                .foregroundColor(.mint)
                            Button{
                                withAnimation(.default){
                                    isRegistered.toggle()
                                }
                            } label: {
                                Text("Sign In")
                                    .underline()
                                    .tint(.primary)
                                    .bold()
                                    .foregroundColor(.mint)
                            }
                        }.padding(.bottom, geometry.size.height*0.4)
                    }
                }
                
            }
            .background(
                Image("icecream")
                    .resizable()
                    .colorMultiply(.gray)
                    .frame(
                        width: geometry.size.width*1,
                        height: geometry.size.height*1.2
                    )
                    
            )
            .ignoresSafeArea()
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(isRegistered: false).environmentObject(AuthSettings(user: nil, authenticated: false))
    }
}
