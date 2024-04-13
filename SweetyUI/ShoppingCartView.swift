//
//  ShoppingCartView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 26.02.24.
//

import SwiftUI

struct ShoppingCartView: View {
    @EnvironmentObject var authSettings: AuthSettings
    @State var isLoggedIn: Bool = false
    @State var showSheet: Bool = false
    @State var resultPrice: Double = 0
    @State var index = 0
    
    var body: some View {
        GeometryReader{ geometry in
            NavigationStack{
                VStack{
                    if(authSettings.user == nil)
                    {
                        ShoppingCartLogin
                    } else{
                        List{
                            
                            ForEach(authSettings.shoppingCart!.itemList, id:\.self){
                                productItem in
                                VStack{
                                    ShoppingCartButton(productItem: productItem)
                                }
                            }
                            .onDelete(perform:delete)
                            
                            
                        }
                        .task {
                            authSettings.shoppingCart?.objectWillChange.send()
                        }
                        
                        Button(action: {
                            
                        }){
                            HStack{
                                Spacer()
                                Text("Pay")
                                Spacer()
                            }.font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.mint)
                                .cornerRadius(10.0)
                        }
                        
                    }
                }
                .navigationTitle("Shopping Cart")
            }
        }
        
    }
    
    var ShoppingCartLogin: some View{
        GeometryReader{ geometry in
            Text("No items")
                .font(.headline)
                .position(x: geometry.size.width*0.165, y:geometry.size.height*0.2)
            Text("Login to view your shopping cart")
                .foregroundColor(.gray)
                .position(x:geometry.size.width*0.39, y:geometry.size.height*0.23)
            LoginButton
        }
    }
    
    
    
    var LoginButton: some View {
        GeometryReader{ geometry in
            Button(action: {
                showSheet.toggle()
            }){
                VStack{
                    HStack{
                        Text("Log-in")
                    }
                }
            }.font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 100, height: 50)
                .background(Color.mint)
                .cornerRadius(10.0)
                .position(
                    x: geometry.size.width*0.2,
                    y:geometry.size.height*(0.3)
                )
                .sheet(isPresented: $showSheet){
                    SignInView(isRegistered: false)
                }.environmentObject(authSettings)
        }
    }
    
    func delete(at position: IndexSet) {
        authSettings.shoppingCart!.removeFromCart(index: position)
        authSettings.objectWillChange.send()
        
    }
    
}

struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView().environmentObject(AuthSettings(
            user: User(
                userName: "Angela",
                email: "angela@gmail.com"
            ), shoppingCart: ShoppingCart(itemList: [ProductItem(itemName: "Donuts", itemPieces: 20, itemPrice: 20.30), ProductItem(itemName: "Brownies", itemPieces: 20, itemPrice: 20.30)]
                                         )))
        ShoppingCartView().environmentObject(AuthSettings(user: nil, shoppingCart: nil))
    }
}
