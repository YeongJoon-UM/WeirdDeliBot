//
//  CustomButton.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/15.
//
import SwiftUI

struct CustomButton: View {
    let action: () -> Void
    let text: String
    let textColor: Color
    let height: CGFloat
    let backgroundColor: Color
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                Spacer()
                Text(text)
                    .size18Regular()
                    .foregroundColor(textColor)
                Spacer()
            }
        }
        .frame(height: height)
        .background(backgroundColor)
        .cornerRadius(10)
        .padding(.horizontal, 28)
    }
}
