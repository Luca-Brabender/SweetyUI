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
        
        GeometryReader{ geometry in
            VStack(alignment: .leading){
                Text("Shopping Cart")
                    .font(.system(size: 30))
                    
                
                Text("No items")
                    .font(.headline)
                    .position(x: geometry.size.width*0.17, y:geometry.size.height*0.2)
                Text("Login to view your shopping cart")
                    .foregroundColor(.gray)
                    .position(x:geometry.size.width*0.4, y:geometry.size.height*0.0)
                
                SimpleLoginButtonView()
                    .position(
                        x: geometry.size.width*0.2,
                        y:geometry.size.height*(-0.23)
                    )
                    
                
            }.padding(23)
        }
        
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView()
    }
}
