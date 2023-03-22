//
//  Color.swift
//  DazzleProject
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
    
    static let main = Color.brown
    static let sub = Color.gray
    static let textMain = Color.black
    static let textSub = Color.white
    static let base = Color(hex: "#eeeeee")
    //static let line = Color("LineColor")
    //static let test = Color(red: 52 / 255, green: 152 / 255, blue: 219 / 255)
}
