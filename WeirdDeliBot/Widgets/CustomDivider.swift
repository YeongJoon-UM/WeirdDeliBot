//
//  CustomDivider.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/17.
//

import SwiftUI

struct CustomDivider: View {
    let top: CGFloat
    let bottom: CGFloat
    
    init(top: CGFloat = 0, bottom: CGFloat = 0) {
        self.top = top
        self.bottom = bottom
    }
    
    var body: some View {
        Divider()
            .background(Color.basic)
            .padding(.horizontal, 24)
            .padding(.top, top)
            .padding(.bottom, bottom)

    }
}


