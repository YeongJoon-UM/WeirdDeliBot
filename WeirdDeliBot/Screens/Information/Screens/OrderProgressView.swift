//
//  OrderProgressView.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/14.
//

import SwiftUI

struct OrderProgressView: View {
    @EnvironmentObject var viewModel: OrderHistoryViewModel
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
                    Text("\(viewModel.getTimeDifference())")
                        .sizeCustomJUA(30)
                        .foregroundColor(.basic)
                        .padding(.trailing, 12)
                    Spacer()
                    Text(hourFormatter(viewModel.getEstimatedTime()))
                        .size18Regular()
                        .foregroundColor(.myGray.opacity(0.5))
                        .padding(.trailing, 8)
                    Text("도착예정")
                        .size18Regular()
                        .foregroundColor(.myGray.opacity(0.5))
                }
                
                .padding(.horizontal, 24)
                .padding(.bottom, isExpanded ? 16 : 0)
                
                let statusLayout = isExpanded ? AnyLayout(VStackLayout(spacing: 0)) : AnyLayout(HStackLayout(spacing: 0))
                //MARK: HStack, VStack 가변 레이아웃
                statusLayout {
                    deliveryStepView(imageName: "cart.fill", stepText: viewModel.getStepTime(state: 0), statusText: "주문 완료", state: viewModel.isStateStep(state: 0))
                    
                    progressBar(state: viewModel.isStateStep(state: 1))
                   
                    deliveryStepView(imageName: "cup.and.saucer.fill", stepText: viewModel.getStepTime(state: 1), statusText: "준비 중", state: viewModel.isStateStep(state: 1))
                    
                    progressBar(state: viewModel.isStateStep(state: 2))
                    
                    deliveryStepView(imageName: "box.truck.badge.clock.fill", stepText: viewModel.getStepTime(state: 2), statusText: "배달 시작", state: viewModel.isStateStep(state: 2))
                    
                    progressBar(state: viewModel.isStateStep(state: 3))
                    
                    deliveryStepView(imageName: "checkmark",  stepText: viewModel.getStepTime(state: 3), statusText: "배달 완료", state: viewModel.isStateStep(state: 3))
                    
                }
                Spacer()
                
            }
            .frame(height: isExpanded ? 426 : 140)
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
    
    private func deliveryStepView(imageName: String, stepText: String, statusText: String, state: Bool) -> some View {
        HStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 75)
                    .fill()
                    .foregroundColor(state ? .basic : .myGray.opacity(0.5))
                    .frame(width: isExpanded ? 52 : 80, height: isExpanded ? 52 : 8)
                
                Image(systemName: imageName)
                    .imageSize(27)
                    .foregroundColor(.myWhite)
                    .opacity(isExpanded ? 1 : 0)
            }
            .padding(.horizontal, isExpanded ? 0 : 6)
            
            
            Text(stepText)
                .sizeCustom(24, .medium)
                .foregroundColor(state ? .basic.opacity(isExpanded ? 1 : 0) : .myGray.opacity(isExpanded ? 0.5 : 0))
                .frame(width: isExpanded ? 75 : 0, alignment: .leading)
                .padding(.leading, isExpanded ? 24 : 0)
                .padding(.trailing, isExpanded ? 21 : 0)
            
            Text(statusText)
                .sizeCustom(20, .regular)
                .foregroundColor(state ? .basic.opacity(isExpanded ? 1 : 0) : .myGray.opacity(isExpanded ? 0.5 : 0))
                .frame(width: isExpanded ? 79 : 0, alignment: .leading)
            if isExpanded {
                Spacer()
            }
            
        }
        .padding(.leading, isExpanded ? 36 : 0)
    }
    
    private func progressBar(state: Bool) -> some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill()
                .foregroundColor(state ? .basic : .myGray.opacity(0.5))
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



