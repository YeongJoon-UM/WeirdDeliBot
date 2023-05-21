//
//  Account.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/19.
//

import Foundation

struct Account: Codable {
    let account: String
    
    enum CodingKeys: String, CodingKey {
        case account = "orderId"
    }
}
