//
//  StringResponse.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/25.
//

import Foundation

struct StringResponse: Codable {
    let result: String
    let resultCode: Int
    let resultMsg: String
}
