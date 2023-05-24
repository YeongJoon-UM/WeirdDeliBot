//
//  CartRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/01/02.
//

import SwiftUI

struct CartItemRow: View {
    @StateObject var viewModel: CartRowViewModel = CartRowViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    var index: Int
    var order: OrderItem
    
    var body: some View {
        if(viewModel.menu == nil){
            if(viewModel.status == nil) {
                ProgressView() {
                    VStack(spacing: 0) {
                        Text("로딩 중..")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .task {
                    viewModel.getItemInfo(itemCode: order.id, amount: cartViewModel.userOrderList[index].amount)
                    viewModel.getOptionList(itemCode: order.id)
                    
                }
                .progressViewStyle(CircularProgressViewStyle())
            } else if viewModel.status == false { //로딩 실패 시 실패 메세지 출력.
                Spacer()
                Text("Loading Failed.")
            }
        } else {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(viewModel.menu?.name ?? "")
                        .size18Bold()
                        .foregroundColor(.myBlack)
                        .padding(.trailing, 8)
     
                    if viewModel.menuAmount > 1 {
                        Text("×\(viewModel.menuAmount)")
                            .size16Bold()
                            .foregroundColor(.myGray)
                    }
                    
                    Spacer()
                    
                    Text("\(viewModel.menu?.price ?? 0)₩")
                        .size18Bold()
                        .foregroundColor(.myBlack)
                }
                
                
                if(!(order.options.firstIndex(where: { $0.amount != 0 }) == nil)) {
                    ForEach(viewModel.option.indices, id: \.self) { index in
                        if order.options[index].amount == 1 {
                            HStack(spacing: 0) {
                                Text("+")
                                    .size16Bold()
                                    .padding(.trailing, 8)
                                Text("\(viewModel.option[index].name)")
                                    .size16Bold()
                                Spacer()
                                Text("\(viewModel.option[index].price)₩")
                                    .size18Bold()
                            }
                            .foregroundColor(.myBlack)
                            .padding(.top, 7)
                        }
                    }
                }
            }
            .padding(16)
        }
    }
}

