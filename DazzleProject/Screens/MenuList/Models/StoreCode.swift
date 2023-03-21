//
//  StoreCode.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/20.
//

import Foundation

struct StoreCode: Codable {
    let storeCode: String
    
    enum CodingKeys: String, CodingKey {
        case storeCode
    }
}
