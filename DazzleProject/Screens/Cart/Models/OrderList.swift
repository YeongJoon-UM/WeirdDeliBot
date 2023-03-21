//
//  OrderList.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/20.
//

import Foundation

struct OrderList: Codable {
    var id: String
    var address: String
    var addressDesc: String
    var phone: String
    var orderReq: String
    var writeNm: String
    var storeCode: String
    var orderList: Orders
    
    enum CodingKeys: String, CodingKey {
        case id = "writeID"
        case address, addressDesc, phone, orderReq, writeNm, storeCode, orderList
    }
}

