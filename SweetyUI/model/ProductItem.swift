//
//  ProductItem.swift
//  SweetyUI
//
//  Created by Luca Brabender on 29.02.24.
//

import Foundation

class ProductItem:Hashable ,Identifiable, ObservableObject{
    @Published var productItemId = UUID()
    @Published var itemName: String
    @Published var itemPieces: Int
    @Published var itemPrice: Double
    
    init(itemName: String, itemPieces: Int, itemPrice: Double) {
        self.itemName = itemName
        self.itemPieces = itemPieces
        self.itemPrice = itemPrice
    }
}


extension ProductItem{
    static func == (lhs: ProductItem, rhs: ProductItem) -> Bool {
        return lhs.itemName == rhs.itemName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(itemName)
        hasher.combine(productItemId)
    }
    
    public func addPiecesToItem(_ number: Int){
        self.itemPieces += number
        self.objectWillChange.send()
    }
    
    public func getProductItemId() -> UUID{
        return productItemId
    }
}
