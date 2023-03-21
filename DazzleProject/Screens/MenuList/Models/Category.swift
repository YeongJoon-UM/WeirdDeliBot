//
//  Category.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/21.
//

import Foundation

struct CatResponse: Codable {
    let result: [Category]
    let resultCode: Int
    let resultMsg: String
}

struct Category: Codable, Identifiable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "catCode"
        case name = "catName"
    }
}
