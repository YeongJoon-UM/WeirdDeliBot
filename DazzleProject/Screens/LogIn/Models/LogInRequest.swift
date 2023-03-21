//
//  LoginRequest.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation

struct LogInRequest: Codable {
    let account, password: String
}
