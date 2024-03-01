//
//  ShoppingCart.swift
//  SweetyUI
//
//  Created by Luca Brabender on 29.02.24.
//

import Foundation

class ShoppingCart: ObservableObject{
    
    @Published var itemList:[ProductItem]
    
    init(itemList: [ProductItem]) {
        self.itemList = itemList
    }
}

extension ShoppingCart{
    public func isEmpty() -> Bool{
        return itemList.isEmpty    }
    
    public func addToCart(item: ProductItem){
        itemList.append(item)
    }
    
    public func removeFromCart(index: IndexSet){
        itemList.remove(atOffsets: index)
    }
    
    public func getSize() -> Int {
        return itemList.count
    }
}
