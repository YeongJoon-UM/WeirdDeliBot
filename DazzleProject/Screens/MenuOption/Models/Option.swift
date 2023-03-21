//
//  Option.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/12/26.
//

import Foundation

struct Options: Codable {
    let options: [Option]
}

struct Option: Codable {
    var id: String
    var name: String
    var price: Int
    var amount: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "optionCode"
        case name = "optionName"
        case price = "optionPrice"
        case amount = "optionCount"
    }
}
