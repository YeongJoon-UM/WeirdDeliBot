//
//  VerifyCodeRequest.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/26.
//

import Foundation

struct VerifyCodeRequest: Codable {
    let userID: String
    let verifyCode: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case verifyCode = "mailCode"
    }
}
