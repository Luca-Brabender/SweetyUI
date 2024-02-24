//
//  SearchView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct SearchView: View {
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
                                ProductView(name: product.productName,     productText: product.productDescription,
                                            image: product.productPicture)
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
        SearchView()
    }
}
