//
//  ProductView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var authSettings: AuthSettings
    @State private var orderNumber = 2
    let price: Double
    var name: String
    var productText: String;
    var image: String
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geometry.size.width * 1,
                            height: geometry.size.height * 0.7
                        )
                        .ignoresSafeArea()
                        
                    Spacer()
                }
                
                ZStack{
                    
                    VStack{
                        
                        Spacer()
                        RoundedRectangle(cornerRadius: 40)
                            .fill(.white)
                            .frame(width: geometry.size.width * 1.1, height: geometry.size.height * 0.5)
                            .position(x: geometry.size.width * 0.5,y: geometry.size.height * 0.6)
                            //.ignoresSafeArea()
                        
                        
                    }
                    VStack(){
                        
                        Text(name)
                            .font(.system(size: 36, weight: .bold, design: .default))
                        
                        
                        
                        
                        Text(productText)
                            .frame(maxHeight: geometry.size.height*0.14, alignment: .center)
                            
                            .foregroundColor(.gray)
            
                        
                        VStack{
                            Text("How many do you want to order?")
                                .foregroundColor(.black)
                            
                            VStack{
                                Picker("Number of \(name)", selection: $orderNumber) {
                                    ForEach(2..<51, id: \.self) { picker in
                                            Text("\(picker) \(name)s")
                                        }
                                    }
                                
                                Button{
                                    if(authSettings.user != nil){
                                        authSettings.addToCart(item: ProductItem(itemName: name, itemPieces: orderNumber, itemPrice: price)
                                        )
                                        authSettings.objectWillChange.send()
                                    }
                                    
                                } label: {
                                    
                                    HStack{
                                        Text("Add To Cart")
                                            .padding(.leading)
                                        Image(systemName: "cart.badge.plus")
                                        
                                    }
                                    .foregroundColor(.white)
                                    .frame(
                                        width: geometry.size.width*0.9,
                                        height: geometry.size.height*0.06)
                                    .background(Color.mint)
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                                }
                                .position(x: geometry.size.width*0.5, y: geometry.size.height*0.15)
                                
                            }
                            
                        }.frame(maxHeight: geometry.size.height*(0.2))
                    }
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height*0.60)
                }
                
            }
        }
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(price: 1.30, name: "Donut", productText: "Delicous Donuts with creamy filling. For a busy workday. The texture of the inside of a donut should be moist, crumbly, and fluffy. As you bite into the donut, the donut will crumble and be delicate.", image: "donuts")
            .environmentObject(AuthSettings(user: nil, shoppingCart: nil))
    }
}
