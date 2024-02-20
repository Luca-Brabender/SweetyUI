//
//  ProductView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct ProductView: View {
    @State private var orderNumber = 0
    var name: String
    var productText: String;
    
    var body: some View {
        ZStack{
            VStack{
                
                Image("donuts")
                    .resizable()
                    .frame(width: 400.0, height: 400.0)
                    .ignoresSafeArea()
                Spacer()
            }
            
            ZStack{
                
                VStack{
                    
                    Spacer()
                    RoundedRectangle(cornerRadius: 40)
                        .fill(.white)
                        .frame(width: 400, height: 450)
                        .ignoresSafeArea()
                    
                    
                }
                VStack(){
                    Spacer()
                    Text(name)
                        .font(.system(size: 36, weight: .bold, design: .default))
                        //.padding()
                    
                    
                        
                        Text(productText)
                        .frame(maxHeight: 110, alignment: .center)
                            //.position(x:185, y:180)
                            .padding()
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                            
                        
                    Spacer()
                        .frame(height: 50)
                    
                    VStack{
                        Text("How many do you want to order?")
                            .foregroundColor(.black)
                            //.padding()
                        HStack{
                            Spacer()
                            TextField("How many do you want?", value: $orderNumber, format: .number)
                                .textFieldStyle(.roundedBorder)
                                .padding(20)
                                //.position(x: 0)
                            //.background(.mint)
                                .foregroundColor(.mint)
                            
                            
                            
                            Button{
                                
                            } label: {
                                Image(systemName: "cart.badge.plus")
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 50)
                                    .background(Color.mint)
                                    .cornerRadius(15)
                                    .padding(.horizontal)
                                    //.fixedSize()

                            }
                            
                        }
                        
                    }.frame(maxHeight: 150, alignment: .top)
                    
                    
                }
            }
            
        }
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(name: "Donut", productText: "Delicous Donuts with creamy filling. For a busy workday. The texture of the inside of a donut should be moist, crumbly, and fluffy. As you bite into the donut, the donut will crumble and be delicate.")
    }
}
