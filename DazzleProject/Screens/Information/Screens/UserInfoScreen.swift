//
//  UserInfoScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/04/05.
//

import SwiftUI

struct UserInfoScreen: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text("안녕하세요 \(rootViewModel.user?.name ?? "")님!")
            Text("아이디 : \(rootViewModel.user?.account ?? "")")
            Text("주소 : \(rootViewModel.user?.address ?? "")")
            Text("상세 주소 : \(rootViewModel.user?.addressDesc ?? "")")
            Text("휴대전화 : \(rootViewModel.user?.phone ?? "")")
        }
        .navigationBarTitle(Text("User"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{ ToolBarBackButton(presentation: presentation) }
    }
}

struct UserInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoScreen()
    }
}
