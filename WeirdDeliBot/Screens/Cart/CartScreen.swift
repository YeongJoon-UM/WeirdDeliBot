//
//  CartScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct CartScreen: View {
    @EnvironmentObject var viewModel: CartViewModel
    @Environment(\.presentationMode) var presentation
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("주문을 확인해주세요")
                    .sizeCustomJUA(22)
                    .foregroundColor(.myBlack)
                Spacer()
                Image(systemName: "basket.fill")
                    .imageSize(35)
                    .foregroundColor(.myBlack)
            }
            .frame(height: 60)
            .padding(.top, 20)
            .padding(.leading, 40)
            .padding(.trailing, 50)
            
            CustomDivider(top: 41)
            
            if !viewModel.userOrderList.isEmpty {
                List {
                    ForEach(Array(zip(viewModel.userOrderList.indices, viewModel.userOrderList)), id: \.0) { index, order in
                        //ForEach(viewModel.userOrderList, id: \.self) { order in
                        ZStack {
                            NavigationLink(destination: EditScreen(index: index)){}.opacity(0)
                            CartItemRow(index: index, order: order)
                        }.listRowInsets(EdgeInsets())
                        
                    }
                    .onDelete{ index in
                        viewModel.removeOrderItem(index: index)
                    }
                }
                .id(UUID())
                .listStyle(.inset)
                .padding(.horizontal, 24)
                Spacer()
                
            }

            else {
                HStack(spacing: 0) {
                    Text("장바구니가 비었습니다.")
                        .size18Bold()
                        .foregroundColor(.myGray.opacity(0.5))
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.leading, 40)
                Spacer()
            }
            CustomDivider(bottom: 24)
            HStack(spacing: 0) {
                Text("합계 금액")
                Spacer()
                Text("\(viewModel.totalPrice)₩")
            }
            .size18Bold()
            .padding(.leading, 36)
            .padding(.trailing, 41)
            
            CustomDivider(top: 24, bottom: 24)
            
            if !viewModel.userOrderList.isEmpty {
                NavigationLink(destination: OrderScreen(path: $path)) {
                    HStack(spacing: 0) {
                        Spacer()
                        Text("주문 하기")
                            .size18Regular()
                            .foregroundColor(.myWhite)
                        Spacer()
                    }
                }
                .frame(height: 63)
                .background(Color.basic)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding(.horizontal, 28)
                .padding(.bottom, 74)
            } else {
                Text("주문 하기")
                    .size18Regular()
                    .frame(maxWidth: .infinity, maxHeight: 63)
                    .foregroundColor(.myWhite)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.myGray.opacity(0.5)))
                    .padding(.horizontal, 28)
                    .padding(.bottom, 74)
            }
        }
        .customToolBar("Cart", showCartButton: false, path: $path)
    }
    
}


