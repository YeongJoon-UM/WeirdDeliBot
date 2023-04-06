//
//  Option.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/12/26.
//

import Foundation

struct OptionResponse: Codable {
    let result: [Option]
    let resultCode: Int
    let resultMsg: String
}


struct Option: Codable, Identifiable {
    let id: String
    let name: String
    let price: Int
    let desc: String?
    let maxCount: Int
    let minCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "optionCode"
        case name = "itemName"
        case price = "itemPrice"
        case desc = "itemDesc"
        case maxCount, minCount
    }
}
