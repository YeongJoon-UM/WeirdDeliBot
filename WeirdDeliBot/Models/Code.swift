//
//  Code.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/26.
//

import Foundation

struct StoreCode: Codable {
    let storeCode: String
    
    enum CodingKeys: String, CodingKey {
        case storeCode
    }
}

struct ItemCode: Codable {
    let itemCode: String
    
    enum CodingKeys: String, CodingKey {
        case itemCode
    }
}

struct OptionCode: Codable {
    let optionCode: String
    
    enum CodingKeys: String, CodingKey {
        case optionCode
    }
}

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


