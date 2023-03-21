//
//  Menu.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/20.
//

import Foundation

struct MenuResponse: Codable {
    let result: [Menu]
    let resultCode: Int
    let resultMsg: String
}

struct Menu: Codable, Identifiable {
    let id: String
    let name: String
    let price: Int
    let desc: String
    let catCode: String
    let category: String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "itemCode"
        case name = "itemName"
        case price = "itemPrice"
        case desc = "itemDesc"
        case category = "catName"
        case catCode, image
    }
}
