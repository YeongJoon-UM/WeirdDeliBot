//
//  UserResponse.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/04.
//

import Foundation

struct UserResponse: Codable {
    let result: User
    let resultCode: Int
    let resultMsg: String
}

struct User: Codable {
    let account: String
    let password: String?
    let name: String
    let phone: String
    let address: String
    let addressDesc: String
    let latitude: String
    let longitude: String

    
    enum CodingKeys: String, CodingKey {
        case account = "userId"
        case password = "userPw"
        case name = "userNm"
        case addressDesc = "addressInfo"
        case latitude, longitude
        case phone, address
    }
}
