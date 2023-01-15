//
//  CartViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var carts: [Cart] = []
    @Published var cartTotalPrice: Int = 0
   

    func addToCart(beverage: Beverage, shot: Option, cream: Option, sizeUp: Option, totalPrice: Int) {
        carts.append(Cart(id: UUID(), beverage: beverage, shot: shot, cream: cream, sizeUp: sizeUp, totalPrice: totalPrice))
        //cartTotalPrice += totalPrice
    }
    
    func getCartTotalPrice() {
        cartTotalPrice = 0
        if !carts.isEmpty {
            for cart in carts {
                cartTotalPrice += cart.totalPrice
            }
        }
    }
    
    func addOptionAmount(option: inout Option) {
        option.amount += 1
    }
    
    func subOptionAmount(option: inout Option) {
        option.amount -= 1
    }
}
