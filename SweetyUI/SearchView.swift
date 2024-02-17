//
//  SearchView.swift
//  SweetyUI
//
//  Created by Luca Brabender on 17.02.24.
//

import SwiftUI

struct SearchView: View {
    let products = ["Donuts", "Cupcake", "Cheesecake", "Brownies"]
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            NavigationStack{
                List {
                    ForEach(products, id:\.self) { product in
                        NavigationLink{
                            ProductView(name: product, productText: "Delicous Donuts with creamy filling. For a busy workday. The texture of the inside of a donut should be moist, crumbly, and fluffy. As you bite into the donut, the donut will crumble and be delicate.")
                                
                        } label: {
                            ProductButtonView(productName: product, price: 0)
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
