//
//  ShoppingCartButton.swift
//  SweetyUI
//
//  Created by Luca Brabender on 29.02.24.
//

import SwiftUI

struct ShoppingCartButton: View {
    let productItem: ProductItem
    
    var body: some View {
        GeometryReader{ geometry in
            HStack{
                Text("\(productItem.itemPieces) \(productItem.itemName)")
                Spacer()
                VStack{
                    Text("Price:")
                    Text("\(productItem.itemPrice * Double(productItem.itemPieces), specifier: "%.2f")$")
                }
            }
        }
    }
}

struct ShoppingCartButton_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartButton(
            productItem: ProductItem(itemName: "Donuts", itemPieces: 20, itemPrice: 1.3)
        )
    }
}
