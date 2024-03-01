//
//  ProductItem.swift
//  SweetyUI
//
//  Created by Luca Brabender on 29.02.24.
//

import Foundation

class ProductItem:Hashable ,Identifiable{
    var productItemId = UUID()
    var itemName: String
    var itemPieces: Int
    var itemPrice: Double
    
    init(itemName: String, itemPieces: Int, itemPrice: Double) {
        self.itemName = itemName
        self.itemPieces = itemPieces
        self.itemPrice = itemPrice
    }
}


extension ProductItem{
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.productItemId == rhs.productItemId &&
            lhs.itemName == rhs.itemName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(itemName)
        hasher.combine(productItemId)
    }
    
    public func getProductItemId() -> UUID{
        return productItemId
    }
}
