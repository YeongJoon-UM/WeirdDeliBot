//
//  ToolBarCart.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct ToolBarCart: ToolbarContent {
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(destination: CartScreen()){
                ZStack{ //ZStack을 사용해 장바구니 아이콘과 아이템이 장바구니에 담겼을 경우 알림을 뜨게 함
                    Image(systemName: "cart.fill")
                        .foregroundColor(.black)
                    if viewModel.userOrderList.count > 0 && viewModel.userOrderList.count < 10 {
                        Image(systemName: "\(viewModel.userOrderList.count).circle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .background(.black, in: Circle())
                            .frame(width: 14, height: 14, alignment: .bottomTrailing)
                            .padding(EdgeInsets(top: 11, leading: 16, bottom: 0, trailing: 0))
                    }
                    else if viewModel.userOrderList.count >= 10 {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .background(.black, in: Circle())
                            .frame(width: 14, height: 14, alignment: .bottomTrailing)
                            .padding(EdgeInsets(top: 11, leading: 16, bottom: 0, trailing: 0))
                    }
                }
            }
        }
    }
}
