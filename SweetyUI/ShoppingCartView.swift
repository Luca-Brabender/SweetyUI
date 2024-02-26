//
//  ShoppingCartView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 26.02.24.
//

import SwiftUI

struct ShoppingCartView: View {
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Shopping Cart")
                .font(.system(size: 30))
                .padding(.bottom, 80)
            Text("No items")
                .font(.headline)
            Text("Login to view your shopping cart")
                .padding(.bottom, 450)
                .foregroundColor(.gray)
            
        }
        .padding(.trailing, 85)
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView()
    }
}
