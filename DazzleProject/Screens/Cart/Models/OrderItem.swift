//
//  Order.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/01/02.
//

import Foundation

struct OrderList: Codable{
    var orderList: [OrderItem]
}

struct OrderItem: Codable {
    var id: String
    var amount: Int
    var options: [OrderItemOption]
    
    enum CodingKeys: String, CodingKey {
        case id = "itemCode"
        case amount = "itemCount"
        case options
    }
}

struct OrderItemOption: Codable {
    var id: String
    var amount: Int

    enum CodingKeys: String, CodingKey {
        case id = "optionCode"
        case amount = "optionCount"
    }
}
