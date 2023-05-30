//
//  SignUpSuccessScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/25.
//

import SwiftUI

struct SignUpSuccessScreen: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .imageSize(90)
                .foregroundColor(.basic)
                .padding(.bottom, 24)
            Text("회원가입이 완료되었습니다")
                .sizeCustomJUA(24)
                .foregroundColor(.basic)
            Spacer()
            
            CustomButton(action: { path = .init() }, text: "로그인", textColor: .myWhite, height: 63, backgroundColor: .basic)
                
            Spacer()
        }
        .customToolBar("", showBackButton: false, showCartButton: false, showInfoButton: false)
    }
}


