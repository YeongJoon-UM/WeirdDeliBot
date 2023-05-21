//
//  Color.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/11/16.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }

    static let basic = Color(hex: "#CA965C")
    static let myWhite = Color(hex: "#FFFFFF")
    static let myBlack = Color(hex: "#222222")
    static let myGray = Color(hex: "#5A5A5A")
    static let myRed = Color(hex: "#FF4444")
    static let myGreen = Color(hex: "#269723")
    //static let line = Color("LineColor")
    //static let test = Color(red: 52 / 255, green: 152 / 255, blue: 219 / 255)
}
