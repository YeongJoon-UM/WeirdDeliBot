//
//  OrderHistoryRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/15.
//

import SwiftUI

struct OrderHistoryRow: View {
    @State var status: Int
    
    var body: some View {
        NavigationLink(destination: OrderListView()) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text("아메리카노 + 쿠키 세트")
                            .size18Bold()
                            .foregroundColor(.myBlack)
                            .padding(.trailing, 8)
                        Text("외 5")
                            .size16Regular()
                            .foregroundColor(.myGray)
                    }
                    .padding(.bottom, 4)
                    Group {
                        Text("한국기술교육대학교 공학 2관")
                            .padding(.bottom, 4)
                        Text("2023. 05. 13")
                    }
                    .size16Regular()
                    .foregroundColor(.myGray)
                }
                .padding(.leading, 16)
                
                Spacer()
                switch status {
                case 0...2 :
                    NavigationLink(destination: LocationScreen()) {
                        Image(systemName: "box.truck.badge.clock.fill")
                            .imageSize(35)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.myWhite)
                            .background(Color.myGreen)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                    .padding(.trailing, 16)
                    
                case 3 :
                    Image(systemName: "checkmark")
                        .imageSize(20)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.myWhite)
                        .background(Color.basic)
                        .cornerRadius(10)
                        .padding(.trailing, 16)
                    
                case -1 :
                    Image(systemName: "xmark")
                        .imageSize(20)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.myWhite)
                        .background(Color.myGray.opacity(0.5))
                        .cornerRadius(10)
                        .padding(.trailing, 16)
                    
                default: EmptyView()
                    
                }
                
            }
            .frame(height: 100)
            .background(Color.myWhite)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding(.horizontal, 18)
            .padding(.vertical, 8)
        }
    }
}

struct OrderHistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryRow(status: 1)
    }
}
