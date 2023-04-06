//
//  LogInRequest.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation

struct LogInRequest: Codable {
    let account: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case account = "userId"
        case password = "userPw"
    }
}
