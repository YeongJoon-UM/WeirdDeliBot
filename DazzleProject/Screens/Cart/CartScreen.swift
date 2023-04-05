//
//  CartScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct CartScreen: View {
    @EnvironmentObject var viewModel: CartViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(spacing: 0) {
            if !viewModel.userOrderList.isEmpty {
                List {
                    ForEach(Array(zip(viewModel.userOrderList.indices, viewModel.userOrderList)), id: \.0) { index, order in
                        //ForEach(viewModel.userOrderList, id: \.self) { order in
                        CartItemRow(index: index, order: order)
                        
                    }
                    .onDelete{ index in
                        viewModel.removeOrderItem(index: index)
                    }
                }
                .listStyle(.plain)
                
                Spacer()
                
                Text("Total Price : \(viewModel.totalPrice)₩")
                    .font(Font.system(size: 19, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, 30)
                    .padding(.trailing, 16)
                
                //TODO: NavigationLink로 변경. OrderScreen()
                NavigationLink(destination: OrderScreen()) {
                    Text("주문하기")
                        .frame(width: 227, height: 50)
                        .font(Font.system(size: 20))
                        .foregroundColor(Color.white)
                        .background(Capsule().fill(Color.black))
                        .padding(.bottom, 20)
                }
            }

            else {
                Text("장바구니가 비었습니다.")
            }
        }
        .navigationBarTitle(Text("Cart"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{ ToolBarBackButton(presentation: presentation) }
        .toolbar{ ToolBarInformation() }
    }
    
}


