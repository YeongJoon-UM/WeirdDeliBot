//
//  OptionCode.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/26.
//

import Foundation

struct OptionCode: Codable {
    let optionCode: String
    
    enum CodingKeys: String, CodingKey {
        case optionCode
    }
}
