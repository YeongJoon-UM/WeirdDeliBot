//
//  UpdateInfo.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/24.
//

import Foundation

struct UpdateInfo: Codable {
    let addressDesc: String
    let latitude: String
    let longitude: String
    let phone: String
    
    enum CodingKeys: String, CodingKey {
        case addressDesc = "addressInfo"
        case latitude, longitude, phone
    }
    
}
