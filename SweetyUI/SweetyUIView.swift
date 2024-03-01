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
                .environmentObject(authSettings)
                .tabItem{
                    Label("Cart",
                        systemImage: "cart")
                }
                
            SearchView()
                .tabItem{
                    Label("Sweets", systemImage: "bag.circle.fill")
                }.environmentObject(authSettings)
            LoginScreenView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }.environmentObject(authSettings)
                
               
        }.accentColor(.mint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SweetyUIView().environmentObject(AuthSettings(user: nil, shoppingCart: nil))
    }
}
