//
//  DropDownMenuOption.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/14.
//

import Foundation

// We are going to use this type with ForEach, so we need to conform it to
// Hashable protocol.
struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropdownMenuOption {
    static let locations: [DropdownMenuOption] = [
        DropdownMenuOption(option: "한국기술교육대학교 공학1관"),
        DropdownMenuOption(option: "한국기술교육대학교 공학2관"),
        DropdownMenuOption(option: "한국기술교육대학교 공학3관"),
        DropdownMenuOption(option: "한국기술교육대학교 공학4관"),
        DropdownMenuOption(option: "한국기술교육대학교 담헌실학관"),
        DropdownMenuOption(option: "한국기술교육대학교 다산정보관"),
        DropdownMenuOption(option: "한국기술교육대학교 기숙사동"),
        DropdownMenuOption(option: "한국기술교육대학교 학생종합지원센터"),
    ]
}
