//
//  OrderResponse.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/04/04.
//

import Foundation

struct OrderResponse: Codable {
    let result: String
    let resultCode: Int
    let resultMsg: String
    
    enum CodingKeys: String, CodingKey {
        case result, resultCode, resultMsg
    }
}
