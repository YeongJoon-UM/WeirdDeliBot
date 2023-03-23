//
//  CartViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var userOrderList: [OrderItem] = []
    @Published var userOrder: Order?
    
    
    func addOrderItem(item: OrderItem) {
        self.userOrderList.append(item)
        self.userOrderList[userOrderList.endIndex - 1].options.removeAll { option in
            option.amount == 0
        }
    }
}
