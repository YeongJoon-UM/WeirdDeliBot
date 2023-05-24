//
//  OrderCode.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/18.
//

import Foundation

struct OrderCode: Codable {
    let orderCode: String
    
    enum CodingKeys: String, CodingKey {
        case orderCode
    }
}

struct OrderState: Codable {
    let orderCode: String
    let orderState: String
}
