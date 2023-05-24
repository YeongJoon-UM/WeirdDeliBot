//
//  CartViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var userOrderList: [OrderItem] = []
    @Published var totalPrice: Int = 0
    @Published var itemPrice: [Int] = []
    
    func addOrderItem(item: OrderItem, price: Int) {
        self.totalPrice += price
        self.itemPrice.append(price)
        self.userOrderList.append(item)
        self.getTotalPrice()
    }
    
    func removeOrderItem(index: IndexSet) {
        self.userOrderList.remove(atOffsets: index)
        self.itemPrice.remove(atOffsets: index)
        self.getTotalPrice()
    }
    
    func editOrderItem(index: Int, newOrderItem: OrderItem, price: Int) {
        self.userOrderList[index] = newOrderItem
        self.itemPrice[index] = price
        self.getTotalPrice()
    }
    
    func emptyOrderItem() {
        userOrderList = []
        totalPrice = 0
    }
    
    func getTotalPrice() {
        self.totalPrice = 0
        for price in itemPrice {
            totalPrice += price
        }
    }
}
