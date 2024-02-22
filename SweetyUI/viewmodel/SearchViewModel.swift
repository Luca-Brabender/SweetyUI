//
//  SearchViewModel.swift
//  SweetyUI
//
//  Created by Luca Brabender on 22.02.24.
//

import Foundation

class SearchViewModel: ObservableObject{
    let donutProduct = Product(productname: "Donut",
                               productPrice: 1.30,
                               productDescription: "Delicous Donuts with creamy filling. For a busy workday. The texture of the inside of a donut should be moist, crumbly, and fluffy. As you bite into the donut, the donut will crumble and be delicate.",
                               productPicture: "donuts")
    let cupcakeProduct = Product(productname: "Cupcake",
                                 productPrice: 2.30,
                                 productDescription: "What are Cupcakes? Cupcakes are small, tasty snack cakes that are favored for their portability and portion-control. They are batter cakes baked in a cup-shaped foil or temperature resistant paper. A cupcake can be prepared from a variety of formulations and can be decorated with cream and icings.",
                                 productPicture: "cupcakes")
    
    
    
    
}

extension SearchViewModel{
    public func fetchProducts() -> [Product]{
        return [donutProduct, cupcakeProduct]
    }
}
