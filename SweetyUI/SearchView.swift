//
//  SearchView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var authSettings:AuthSettings
    let searchViewModel = SearchViewModel()
    let products = ["Donuts", "Cupcake", "Cheesecake", "Brownies"]
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            NavigationStack{
                ScrollView {
                    LazyVStack{
                        ForEach(searchViewModel.fetchProducts()) { product in
                            NavigationLink{
                                ProductView(price: product.productPrice,name: product.productName,     productText: product.productDescription,
                                            image: product.productPicture)
                                .environmentObject(authSettings)
                            } label: {
                                ImageButton(image: product.productPicture, name: product.productName, price: product.productPrice)
                                    
                            }
                        }
                    }
                }
                .navigationTitle("Sweets")
            }.accentColor(.mint)
                .searchable(text: $searchText)
            
            
            
        }
    }
    
    var searchResults: [String]{
        if searchText.isEmpty {
            return products
        } else {
            return products.filter {$0.contains(searchText)}
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(AuthSettings(user: nil, shoppingCart: nil))
        
        
    }
}
