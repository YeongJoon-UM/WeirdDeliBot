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
let phoneRegex = "01[0-1, 7]-\\d{4}-\\d{4}"
let codeRegex = "\\d{4}"

extension String {
    func regexMatches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression) != nil
    }
}

