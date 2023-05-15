//
//  OrderProgressView.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/14.
//

import SwiftUI

struct OrderProgressView: View {
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            VStack(spacing: 0) {
                Image(systemName: "chevron.compact.down")
                    .imageSize(20)
                    .foregroundColor(.basic)
                    .rotationEffect(.degrees(isExpanded ? 0 : 180))
                    .padding(.top, 8)
                
                HStack(spacing: 0) {
                    Text("13 : 00")
                        .sizeCustom(36, .bold)
                        .padding(.trailing, 12)
                    Text(" 도착예정")
                        .sizeCustom(24, .regular)
                    Spacer()
                }
                .foregroundColor(.basic)
                .padding(.leading, 24)
                .padding(.bottom, isExpanded ? 8 : 0)
                
                let statusLayout = isExpanded ? AnyLayout(VStackLayout(spacing: 0)) : AnyLayout(HStackLayout(spacing: 0))
                
                statusLayout {
                    deliveryStepView(imageName: "cart.fill", stepText: "12:17", statusText: "주문 완료")
                    
                    progressBar()
                   
                    deliveryStepView(imageName: "cup.and.saucer.fill", stepText: "12:20", statusText: "준비 중")
                    
                    progressBar()
                    
                    deliveryStepView(imageName: "box.truck.badge.clock.fill", stepText: "12:36", statusText: "배달 시작")
                    
                    progressBar()
                    
                    deliveryStepView(imageName: "checkmark",  stepText: "13:00", statusText: "배달 완료")
                    
                }
                Spacer()
                
            }
            .frame(height: isExpanded ? 426 : 140) // Vstack 높이를 조정
            .background(Color.myWhite)
            .cornerRadius(10)
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
        .shadow(radius: 8)
        .ignoresSafeArea(.all)
        .animation(.default, value: isExpanded)
        
    }
    
    private func deliveryStepView(imageName: String, stepText: String, statusText: String) -> some View {
        HStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 75)
                    .fill()
                    .foregroundColor(.basic)
                    .frame(width: isExpanded ? 52 : 80, height: isExpanded ? 52 : 8)
                
                Image(systemName: imageName)
                    .imageSize(27)
                    .foregroundColor(.myWhite)
                    .opacity(isExpanded ? 1 : 0)
            }
            .padding(.horizontal, isExpanded ? 0 : 6)
            
            
            Text(stepText)
                .sizeCustom(24, .medium)
                .foregroundColor(.basic.opacity(isExpanded ? 1 : 0))
                .frame(width: isExpanded ? 68 : 0, alignment: .leading)
                .padding(.leading, isExpanded ? 24 : 0)
                .padding(.trailing, isExpanded ? 21 : 0)
            
            Text(statusText)
                .sizeCustom(20, .regular)
                .foregroundColor(.basic.opacity(isExpanded ? 1 : 0))
                .frame(width: isExpanded ? 79 : 0, alignment: .leading)
            if isExpanded {
                Spacer()
            }
            
        }
        .padding(.leading, isExpanded ? 36 : 0)
    }
    
    private func progressBar() -> some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill()
                .foregroundColor(.basic)
                .frame(width: isExpanded ? 2 : 0, height: isExpanded ? 20 : 0)
            if isExpanded {
                Spacer()
            }
            
        }
        .opacity(isExpanded ? 1 : 0)
        .padding(.leading, isExpanded ? 61 : 0)
        .padding(.vertical, isExpanded ? 4 : 0)
    }
}




struct OrderProgressView_Previews: PreviewProvider {
    static var previews: some View {
        OrderProgressView()
    }
}
