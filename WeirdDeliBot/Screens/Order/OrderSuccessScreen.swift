//
//  OrderSuccessScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/21.
//

import SwiftUI

struct OrderSuccessScreen: View {
    @Binding var path: NavigationPath
    let orderDate: String
    let totalPrice: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .imageSize(90)
                .foregroundColor(.basic)
                .padding(.bottom, 24)
            Text("주문이 완료되었습니다")
                .sizeCustomJUA(24)
                .foregroundColor(.basic)
            Spacer()
            CustomDivider(bottom: 24)
            HStack(spacing: 0) {
                Text("주문 일자")
                Spacer()
                Text("\(slashDateFormatter(orderDate))")
            }
            .size16Regular()
            .foregroundColor(.myBlack)
            .padding(.horizontal, 40)
            .padding(.bottom, 16)
            
            HStack(spacing: 0) {
                Text("결제 금액")
                Spacer()
                Text("\(totalPrice)₩")
            }
            .size16Regular()
            .foregroundColor(.myBlack)
            .padding(.horizontal, 40)
            
            CustomDivider(top: 24, bottom: 24)
            CustomButton(action: {path = .init()}, text: "돌아가기", textColor: .myWhite, height: 63, backgroundColor: .basic)
                .padding(.bottom, 74)
        }
        .customToolBar("", showBackButton: false, showCartButton: false, showInfoButton: false)
    }
}

