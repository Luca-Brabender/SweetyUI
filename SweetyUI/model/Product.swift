//
//  Product.swift
//  SweetyUI
//
//  Created by Luca Brabender on 22.02.24.
//

import Foundation


class Product: Identifiable, Hashable{
    let id: UUID = UUID()
    var productName: String
    var productPrice: Double
    var productDescription: String
    var productPicture: String
    
    init(productname: String, productPrice: Double, productDescription: String, productPicture: String) {
        self.productName = productname
        self.productPrice = productPrice
        self.productDescription = productDescription
        self.productPicture = productPicture
    }
}


extension Product{
    func hash(into hasher: inout Hasher) {
        hasher.combine(productName)
        hasher.combine(productDescription)
    }
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.productName == rhs.productName
    }
}
