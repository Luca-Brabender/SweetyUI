//
//  ImageButton.swift
//  SweetyUI
//
//  Created by Luca Brabender on 22.02.24.
//

import SwiftUI

struct ImageButton: View {
    let image: String
    let name: String
    let price: Double
    
    var body: some View {
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 300, height: 400)
                    .cornerRadius(15)
            
                HStack{
                    let priceText = String(format: "%.2f", price)
                    Text(name)
                        .padding(.trailing, 100)
                        .foregroundColor(.gray)
                        .font(.system(size: 25))
                    Text("\(priceText)$")
                        .foregroundColor(.gray)
                        .font(.system(size: 25))
                }
                
            
            }
            .shadow(radius: 10)
            .padding()
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(image: "brownies", name: "Brownies", price: 1.30)
    }
}
