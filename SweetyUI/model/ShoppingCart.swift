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
    
    public func addToCart(itemName: String, itemPieces: Int, itemPrice: Double){
        if(!itemList.isEmpty){
            for item in itemList{
                if(item.itemName == itemName){
                    item.addPiecesToItem(itemPieces)
                    return
                }
            }
        }
        itemList.append(ProductItem(itemName: itemName, itemPieces: itemPieces, itemPrice: itemPrice))
    }
    
    public func removeFromCart(index: IndexSet){
        itemList.remove(atOffsets: index)
    }
    
    public func getSize() -> Int {
        return itemList.count
    }
}
