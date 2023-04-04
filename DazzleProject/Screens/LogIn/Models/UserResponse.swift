//
//  UserResponse.swift
//  DazzleProject
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
    let id: Int
    let account: String
    let password: String?
    let name: String
    let phone: String
    let address: String
    let addressDesc: String
    let lastLogin: String?
    let lastLoginIp: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "seq"
        case account = "userId"
        case password = "userPw"
        case name = "userNm"
        case addressDesc = "addressInfo"
        case phone, address, lastLogin, lastLoginIp
    }
}
