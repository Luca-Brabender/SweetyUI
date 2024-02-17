//
//  ContentView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct SweetyUIView: View {
    var body: some View {
        TabView(){
            Text("Log in To view your shopping basket.")
                .badge(2)
                .tabItem{
                    Label("Basket",
                        systemImage: "cart")
                }
            SearchView()
                .tabItem{
                    Label("Sweets", systemImage: "bag.circle.fill")
                }
            LoginScreenView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
        }.accentColor(.mint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SweetyUIView()
    }
}
