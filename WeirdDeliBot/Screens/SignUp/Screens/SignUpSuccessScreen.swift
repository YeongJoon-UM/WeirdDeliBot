//
//  SignUpSuccessScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/25.
//

import SwiftUI

struct SignUpSuccessScreen: View {
    @EnvironmentObject var viewModel: SignUpViewModel
    @EnvironmentObject var rootViewModel: RootViewModel
    @Environment(\.presentationMode) var presentation
    
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
            
            CustomButton(action: {viewModel.logIn()}, text: "로그인", textColor: .myWhite, height: 63, backgroundColor: .basic)
                
            Spacer()
        }
        .onChange(of: self.viewModel.token) { token in
            if (token != nil) {
                self.rootViewModel.setToken(token: token!)
            }
        }
    }
}

struct SignUpSuccessScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSuccessScreen()
    }
}
