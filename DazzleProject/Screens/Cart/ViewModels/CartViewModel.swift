//
//  CartViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cartCnt: Int = 0
    
    func addCartCnt() {
        self.cartCnt += 1
    }
}
