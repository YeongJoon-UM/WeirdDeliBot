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
                    viewModel.getOptionInfo(itemCode: order.id)
                    
                }
                .progressViewStyle(CircularProgressViewStyle())
            } else if viewModel.status == false { //로딩 실패 시 실패 메세지 출력.
                Spacer()
                Text("Loading Failed.")
            }
        } else {
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(viewModel.menu?.image ?? "sample")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .scaledToFit()
                        .padding(.trailing, 8)
                        .padding(.trailing, 8)
                    
                    
                    Text(viewModel.menu?.name ?? "")
                        .font(.system(size: 19))
                        .frame(width: 110, height: 65, alignment: .leading)
                        .lineLimit(nil)
                    
                    
                    Spacer()
                    
                    Text("\(viewModel.menuAmount)잔")
                        .font(.system(size: 19))
                    
                    Spacer()
                    
                    Text("\(viewModel.menu?.price ?? 0)₩")
                        .font(.system(size: 19))
                        .padding(.trailing, 8)
                    
                }
                if(!(order.options.firstIndex(where: { $0.amount != 0 }) == nil)) {
                    if(viewModel.isOptionShow) {
                        //ForEach(order.options.indices, id: \.self) { index in
                        ForEach(Array(zip(order.options.indices, order.options)), id: \.0) { index, option in
                            CartOptionRow(index: index, orderOption: option)
                                .environmentObject(viewModel)
                        }
                    }
                    Button(action: { viewModel.isOptionShowToggle() }) {
                        if(viewModel.isOptionShow) {
                            Image(systemName: "chevron.up")
                        } else {
                            Image(systemName: "chevron.down")
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(width: 12, height: 12)
                }
            }
        }
    }
}

