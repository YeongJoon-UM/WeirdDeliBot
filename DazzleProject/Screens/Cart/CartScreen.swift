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
        EmptyView()
        /*
        ZStack {
            NavigationView {

                if viewModel.cartTotalPrice != 0 {
                    VStack {
                        //TODO: 수정 버튼 추가.
                        List {
                            ForEach(viewModel.carts, id: \.self) { cart in
                                CartRow(cart: cart)
                            }.onDelete{ index in
                                viewModel.carts.remove(atOffsets: index)
                                viewModel.getCartTotalPrice()
                            }
                        }
                        .listStyle(.plain)
                        
                        Spacer()
                        
                        Text("Total Price : \(viewModel.cartTotalPrice)₩")
                            .font(Font.system(size: 19, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.bottom, 30)
                            .padding(.trailing, 16)
                        
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }) {
                            Text("주문하기")
                                .frame(width: 227, height: 50)
                                .font(Font.system(size: 20))
                                .foregroundColor(Color.white)
                                .background(Capsule().fill(Color.black))
                                .padding(.bottom, 20)
                        }
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
            .toolbar{ ToolBarSideMenu() }
        }
         */
    }
}
