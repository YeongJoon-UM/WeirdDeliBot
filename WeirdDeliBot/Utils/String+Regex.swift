//
//  String+Regex.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/11/16.
//

import Foundation
import SwiftUI

let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}";
let passwordRegex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,16}";


extension String {
    func regexMatches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression) != nil
    }
}

func phoneRegex(_ phoneNumber: String) -> String {
    var formatted = phoneNumber
    if formatted.count > 3 {
        formatted.insert("-", at: formatted.index(formatted.startIndex, offsetBy: 3))
    }
    if formatted.count > 8 {
        formatted.insert("-", at: formatted.index(formatted.startIndex, offsetBy: 8))
    }
    if formatted.count > 13 {
        formatted = String(formatted.prefix(13))
    }
    return formatted
}
