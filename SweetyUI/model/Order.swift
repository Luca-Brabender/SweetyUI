//
//  Order.swift
//  SweetyUI
//
//  Created by Luca Brabender on 11.03.24.
//

import Foundation

class Order: Identifiable{
    let orderId: UUID = UUID()
    var orderList: [ProductItem]
    
    init(orderList: [ProductItem]) {
        self.orderList = orderList
    }
}

extension Order{
    func addItemToOrder(_ item: ProductItem){
        orderList.append(item)
    }
}
