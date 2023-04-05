//
//  InfoScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/04/05.
//

import SwiftUI

struct InfoScreen: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                
                NavigationLink(destination: UserInfoScreen()) {
                    Text("사용자 정보")
                        .multilineTextAlignment(.center)
                        .frame(width: 150, height: 100)
                        .foregroundColor(.textSub)
                        .background(Rectangle()
                            .fill(Color.main)
                            .cornerRadius(20))
                }
                
                Spacer()
                
                NavigationLink(destination: LocationScreen()) {
                    Text("배달 추적")
                        .multilineTextAlignment(.center)
                        .frame(width: 150, height: 100)
                        .foregroundColor(.textSub)
                        .background(Rectangle()
                            .fill(Color.main)
                            .cornerRadius(20))
                }
                
                Spacer()
            }
            .padding(.bottom, 20)
            
            HStack(spacing: 0) {
                Spacer()
                
                NavigationLink(destination: HistoryScreen()) {
                    Text("주문 내역")
                        .multilineTextAlignment(.center)
                        .frame(width: 150, height: 100)
                        .foregroundColor(.textSub)
                        .background(Rectangle()
                            .fill(Color.main)
                            .cornerRadius(20))
                }
                
                Spacer()
                
                Button(action: rootViewModel.logOut) {
                    Text("로그아웃")
                        .multilineTextAlignment(.center)
                        .frame(width: 150, height: 100)
                        .foregroundColor(.textSub)
                        .background(Rectangle()
                            .fill(Color.red)
                            .cornerRadius(20))
                }
                
                Spacer()
            }
        }
        .navigationBarTitle(Text("Info"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{ ToolBarBackButton(presentation: presentation) }
    }
}

