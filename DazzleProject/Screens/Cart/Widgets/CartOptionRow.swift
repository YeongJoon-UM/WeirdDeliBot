//
//  CartOptionRow.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/27.
//

import SwiftUI

struct CartOptionRow: View {
    @EnvironmentObject var viewModel: CartRowViewModel
    @EnvironmentObject var rootViewModel: RootViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    var index: Int
    var orderOption: OrderItemOption
    
    var body: some View {
        if(viewModel.option.isEmpty){
            if(viewModel.status == nil) {
                ProgressView() {
                    VStack(spacing: 0) {
                        Text("로딩 중..")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .progressViewStyle(CircularProgressViewStyle())
            } else if viewModel.status == false { //로딩 실패 시 실패 메세지 출력.
                Spacer()
                Text("Loading Failed.")
            }
        } else if(orderOption.amount != 0) {
            HStack(spacing: 0) {
                Text(viewModel.option[index].name)
                    .font(.system(size: 19))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(orderOption.amount)개")
                    .font(Font.system(size: 19))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("\(viewModel.option[index].price)₩")
                    .font(Font.system(size: 19))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

