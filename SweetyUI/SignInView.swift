//
//  SignInView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 19.02.24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authSettings: AuthSettings
    
    @State var username = ""
    @State var password = ""
    @State var email = ""
    @State var isRegistered = true
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.thickMaterial)
                .frame(width: 360, height: 400, alignment: .topTrailing)
                .padding(.bottom, 220)
            
            
            
            VStack{
                if(!isRegistered){
                    Text("Sign In")
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .foregroundColor(Color.mint)
                        .padding([.top, .bottom], 40)
                        .padding(.top,30)
                    
                    
                    VStack(alignment: .leading, spacing: 15){
                        
                        
                        TextField("E-mail", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                        
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                        
                        
                        
                    }.padding([.leading, .trailing], 27.5)
                    
                    
                    
                    
                    VStack{
                        Button(action: {}){
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.mint)
                                .cornerRadius(15.0)
                        }.padding(.top, 50)
                        
                        
                        
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
                    }.padding(.bottom, 300)
                    
                } else {
                    Text("Register")
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .foregroundColor(Color.mint)
                        .padding(.top, 80)
                    
                    
                    VStack(alignment: .leading, spacing: 15){
                        TextField("Username", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                        
                        
                        TextField("E-mail", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                        
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20.0)
                        
                        
                        
                    }.padding([.leading, .trailing], 27.5)
                    
                    
                    
                    
                    Button(action: {
                        Task{
                            //await registerViewModel.registerUser(email, passwordd)
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
                    }.padding(.bottom, 300)
                }
            }
            
        }
        .background(
            Image("icecream")
                .resizable()
                .colorMultiply(.gray)
                .frame(width: 800.0, height: 900.0)
                .ignoresSafeArea()
            
            //.saturation(0.8)
            //.contrast(0.1)
        )
        .ignoresSafeArea()
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(AuthSettings(user: nil, authenticated: false))
    }
}
