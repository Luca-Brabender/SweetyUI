//
//  ContentView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct SweetyUIView: View {
    @EnvironmentObject var authSettings: AuthSettings
    
    var body: some View {
        TabView(){
            ShoppingCartView()
                .tabItem{
                    Label("Cart",
                        systemImage: "cart")
                }
            SearchView()
                .tabItem{
                    Label("Sweets", systemImage: "bag.circle.fill")
                }
            LoginScreenView()
                .environmentObject(authSettings)
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
                
               
        }.accentColor(.mint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SweetyUIView().environmentObject(AuthSettings(user: nil, authenticated: false))
        SweetyUIView().environmentObject(AuthSettings(user: nil, authenticated: false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
