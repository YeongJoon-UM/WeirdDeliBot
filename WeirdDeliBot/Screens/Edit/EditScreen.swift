//
//  EditScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/03/27.
//

import SwiftUI

struct EditScreen: View {
    @StateObject var viewModel: EditViewModel = EditViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @Environment(\.presentationMode) var presentation
    var index: Int
    
    var body: some View {
        VStack(spacing: 0) {
            if(viewModel.menu == nil || viewModel.option == nil){
                if(viewModel.status == nil) {
                    ProgressView(label: {
                        VStack(spacing: 0) {
                            Text("로딩 중..")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    ).progressViewStyle(CircularProgressViewStyle())
                        .frame(height: 185)
                } else if viewModel.status == false {
                    Spacer()
                    Text("Loading Failed.")
                }
            } else {
                MenuDescRow(viewModel: viewModel, menu: viewModel.menu![0])
                  
                
                CustomDivider(top: 16, bottom: 16)
                
                Text("추가 옵션")
                    .size16Bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 36)
                    .padding(.bottom, 16)
                
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.option!){ option in
                        OptionRow(viewModel: viewModel, option: option)
                    }
                }
                .frame(height: 153)
                .padding(.leading, 40)
                .padding(.trailing, 27)
            }
            
            CustomDivider(top: 16, bottom: 16)
            
            HStack(spacing: 0) {
                Text("총 금액")
                    .size16Bold()
                    .foregroundColor(.myBlack)
                Spacer()
                Text("\(viewModel.totalPrice())₩")
                    .size18Bold()
                    .foregroundColor(.myBlack)
            }
            .padding(.leading, 36)
            .padding(.trailing, 44)
            
            CustomDivider(top: 16, bottom: 24)
            
            
            CustomButton(action: {
                cartViewModel.editOrderItem(index: index, newOrderItem: viewModel.tempOrderItem!, price: viewModel.totalPrice())
                self.presentation.wrappedValue.dismiss()
            }, text: "장바구니", textColor: .myWhite, height: 63, backgroundColor: .basic)
            .padding(.bottom, 74)
        }
        .onAppear() {
            viewModel.setOrderItem(orderItem: cartViewModel.userOrderList[index])
            viewModel.getItemInfo()
            viewModel.getOptionList()
        }
        .customToolBar("Edit", showCartButton: false, showInfoButton: false)
    }
}

