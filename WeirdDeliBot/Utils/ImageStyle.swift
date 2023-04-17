//
//  ImageStyle.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/14.
//

import SwiftUI

extension Image {
    public func imageSize(_ size: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }
}
