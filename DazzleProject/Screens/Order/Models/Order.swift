//
//  OrderList.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/20.
//

import Foundation

struct Order: Codable {
    var account: String
    var address: String
    var addressDesc: String
    var phone: String
    var orderReq: String
    var name: String
    var storeCode: String
    var orderList: [OrderItem]
    
    enum CodingKeys: String, CodingKey {
        case account = "writeId"
        case name = "writeNm"
        case address, addressDesc, phone, orderReq, storeCode, orderList
    }
}

