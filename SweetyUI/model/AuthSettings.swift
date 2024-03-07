//
//  authSettings.swift
//  SweetyUI
//
//  Created by Luca Brabender on 25.02.24.
//

import Foundation

class AuthSettings: ObservableObject{
    @Published var user: User?
    @Published var shoppingCart: ShoppingCart?
    
    init(user: User?, shoppingCart: ShoppingCart?) {
        self.user = user
        self.shoppingCart = shoppingCart
    }
}

extension AuthSettings{
    public func authenticate(_ user: User, _ shoppingCart: ShoppingCart){
        self.user = user
        self.shoppingCart = shoppingCart
    }
    public func delete(){
        self.user = nil
        self.shoppingCart = nil
    }
    
    public func addToCart(itemName: String, itemPieces: Int, itemPrice: Double){
        self.shoppingCart!.addToCart(itemName: itemName, itemPieces: itemPieces, itemPrice: itemPrice)
    }
    
    public func removeFromCart(index: IndexSet){
        shoppingCart?.removeFromCart(index: index)
    }
    
}
