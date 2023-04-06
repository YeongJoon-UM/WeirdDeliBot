//
//  ItemCode.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/03/22.
//

import Foundation

struct ItemCode: Codable {
    let itemCode: String
    
    enum CodingKeys: String, CodingKey {
        case itemCode
    }
}
