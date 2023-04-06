//
//  Order.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/01/02.
//

import Foundation


struct OrderItem: Codable, Hashable {
    static func == (lhs: OrderItem, rhs: OrderItem) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    
    var id: String
    var amount: Int
    var options: [OrderItemOption]
    
    enum CodingKeys: String, CodingKey {
        case id = "itemCode"
        case amount = "itemCount"
        case options
    }
}

struct OrderItemOption: Codable, Hashable {
    static func == (lhs: OrderItemOption, rhs: OrderItemOption) -> Bool {
        return lhs.id == rhs.id
        
        
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

    var id: String
    var amount: Int

    enum CodingKeys: String, CodingKey {
        case id = "optionCode"
        case amount = "optionCount"
    }
}
