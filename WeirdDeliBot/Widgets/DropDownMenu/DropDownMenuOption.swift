//
//  DropDownMenuOption.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/14.
//

import Foundation

struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
    let latitude: String
    let longitude: String
}

extension DropdownMenuOption {
    static let locations: [DropdownMenuOption] = [
        DropdownMenuOption(option: "한국기술교육대학교 공학 1관", latitude: "36.7652", longitude: "127.2800"),
        DropdownMenuOption(option: "한국기술교육대학교 공학 2관", latitude: "36.7663", longitude: "127.2816"),
        DropdownMenuOption(option: "한국기술교육대학교 공학 3관", latitude: "36.7649", longitude: "127.2799"),
        DropdownMenuOption(option: "한국기술교육대학교 함지관", latitude: "36.7621", longitude: "127.2834"),
        DropdownMenuOption(option: "한국기술교육대학교 한울관", latitude: "36.7616", longitude: "127.2819"),
        DropdownMenuOption(option: "한국기술교육대학교 청솔관", latitude: "36.7609", longitude: "127.2808"),
        DropdownMenuOption(option: "한국기술교육대학교 소울관", latitude: "36.7618", longitude: "127.2795"),
        DropdownMenuOption(option: "한국기술교육대학교 인문경영관", latitude: "36.7647", longitude: "127.2818"),
        DropdownMenuOption(option: "한국기술교육대학교 담헌실학관", latitude: "36.7655", longitude: "127.2821"),
        DropdownMenuOption(option: "한국기술교육대학교 다산정보관", latitude: "36.7636", longitude: "127.2808"),
        DropdownMenuOption(option: "한국기술교육대학교 대학본부", latitude: "36.7644", longitude: "127.2825"),
        DropdownMenuOption(option: "한국기술교육대학교 K-Factory", latitude: "36.7601", longitude: "127.2781"),
        DropdownMenuOption(option: "한국기술교육대학교 산학협력관", latitude: "36.7604", longitude: "127.2778"),
        DropdownMenuOption(option: "한국기술교육대학교 체육관", latitude: "36.7611", longitude: "127.2848")
    ]
}


