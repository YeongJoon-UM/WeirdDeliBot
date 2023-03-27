//
//  CartOptionRow.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/27.
//

import SwiftUI

struct CartOptionRow: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @StateObject var viewModel: CartRowViewModel = CartRowViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel
    @State var isOptionShow: Bool = false
    var orderOption: OrderItemOption
    
    var body: some View {
        if(viewModel.option == nil){
            if(viewModel.status == nil) {
                ProgressView() {
                    VStack(spacing: 0) {
                        Text("로딩 중..")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .onAppear() {
                    viewModel.getOptionInfo(option: orderOption, token: rootViewModel.token?.token ?? "")
                }
                .progressViewStyle(CircularProgressViewStyle())
            } else if viewModel.status == false { //로딩 실패 시 실패 메세지 출력.
                Spacer()
                Text("Loading Failed.")
            }
        } else {
            HStack(spacing: 0) {
                Text(viewModel.option?.name ?? "Name")
                    .font(.system(size: 19))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(orderOption.amount)개")
                    .font(Font.system(size: 19))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("\(viewModel.option?.price ?? 0)₩")
                    .font(Font.system(size: 19))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

