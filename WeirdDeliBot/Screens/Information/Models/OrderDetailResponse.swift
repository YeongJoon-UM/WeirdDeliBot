//
//  OrderDetailResponse.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/18.
//

import Foundation


struct OrderDetailResponse: Codable {
    let result: [OrderDetail]
    let resultCode: Int
    let resultMsg: String
}

struct OrderDetail: Codable {
    let type, parentCode, code, itemCode: String
    let itemName: String
    let count, price: Int
}
