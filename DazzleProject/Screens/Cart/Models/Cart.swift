//
//  Models.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/01/02.
//

import Foundation

struct Carts {
    var carts: [Cart]
}

struct Cart: Identifiable, Hashable {
    static func == (lhs: Cart, rhs: Cart) -> Bool {
        return lhs.id == rhs.id
    }
    var hashValue: Int {
            return id.hashValue
        }
    var id: UUID
    var beverage: Beverage
    var shot: Option
    var cream: Option
    var sizeUp: Option
    var totalPrice: Int
}
