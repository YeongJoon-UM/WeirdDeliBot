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
    var account: String
    var password: String?
    var name: String
    var phone: String
    let address: String
    var addressDesc: String
    var latitude: String
    var longitude: String

    
    enum CodingKeys: String, CodingKey {
        case account = "userId"
        case password = "userPw"
        case name = "userNm"
        case addressDesc = "addressInfo"
        case latitude, longitude
        case phone, address
    }
}
