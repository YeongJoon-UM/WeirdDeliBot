//
//  CartRow.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/01/02.
//

import SwiftUI

struct CartItemRow: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @StateObject var viewModel: CartRowViewModel = CartRowViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel
    @State var isOptionShow: Bool = false
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
                .onAppear() {
                    viewModel.getItemInfo(item: order, token: rootViewModel.token?.token ?? "")
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
                    
                    Text(viewModel.menu?.name ?? "Name")
                        .font(.system(size: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(viewModel.menu?.price ?? 0)₩")
                        .font(Font.system(size: 19))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                if(!order.options.isEmpty) {
                    Button(action: { isOptionShow.toggle() }) {
                        if isOptionShow {
                            Image(systemName: "chevron.up")
                        } else {
                            Image(systemName: "chevron.down")
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(width: 12, height: 12)
                    if(isOptionShow) {
                        ForEach(order.options, id: \.self) { option in
                            CartOptionRow(orderOption: option)
                        }
                    }
                }
            }
        }
    }
}

