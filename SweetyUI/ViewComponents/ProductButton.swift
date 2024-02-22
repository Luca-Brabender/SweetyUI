//
//  ProductButton.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct ProductButtonView: View{
    var productName: String
    var price: Double
    
    var body: some View {
        Button(action: {}){
            VStack{
                HStack{
                    let priceText = String(format: "%.2f", price)
                    Text(productName)
                    Spacer()
                    Text("\(priceText) $ per piece")
                }
            }
        }.font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.mint)
            .cornerRadius(15.0)
    }
}



struct ProductButton_Previews: PreviewProvider {
    static var previews: some View {
        ProductButtonView(productName: "Donut", price: 1.50)
    }
}
