//
//  Token.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation

// MARK: - Token
struct Token: Codable, Equatable {
    let accessToken, refreshToken: String
}
