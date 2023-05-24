//
//  MenuOptionScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct OptionScreen: View {
    @StateObject var viewModel: OptionViewModel = OptionViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    @Binding var path: NavigationPath
    let menu: Menu
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(spacing: 0) {
            MenuDescRow(viewModel: viewModel, menu: menu)
                
            CustomDivider(top: 16, bottom: 16)
            
            Text("추가 옵션")
                .size16Bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 36)
                .padding(.bottom, 16)

            
            if(viewModel.option == nil){
                if(viewModel.status == nil) {
                    ProgressView(label: {
                        VStack(spacing: 0) {
                            Text("로딩 중..")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    ).progressViewStyle(CircularProgressViewStyle())
                } else if viewModel.status == false { //로딩 실패 시 실패 메세지 출력.
                    Spacer()
                    Text("Loading Failed.")
                }
            } else {
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
                viewModel.setUserOption()
                cartViewModel.addOrderItem(item: viewModel.userMenu!, price: viewModel.totalPrice())
                self.presentation.wrappedValue.dismiss()
            }, text: "장바구니", textColor: .myWhite, height: 63, backgroundColor: .basic)
            .padding(.bottom, 74)
            
        }
        .onAppear() {
            viewModel.getSelectedMenu(menu: menu)
            viewModel.getOptionList()
        }
        .customToolBar("Option", path: $path)
    }
}

