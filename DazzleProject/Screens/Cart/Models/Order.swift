//
//  Order.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/01/02.
//

import Foundation

struct Orders: Codable{
    var orders: [Order]
}

struct Order: Codable {
    var id: String
    var amount: Int
    var options: Options
    
    enum CodingKeys: String, CodingKey {
        case id = "itemCode"
        case amount = "itemCount"
        case options
    }
}
