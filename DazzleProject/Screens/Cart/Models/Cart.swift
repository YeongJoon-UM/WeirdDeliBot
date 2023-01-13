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

struct Cart: Identifiable {
    var id: UUID
    var beverage: Beverage
    var shot: Option
    var cream: Option
    var sizeUp: Option
    var totalPrice: Int
}
