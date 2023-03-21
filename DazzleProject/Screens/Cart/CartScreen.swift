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
            if viewModel.cartTotalPrice != 0 {
                List {
                    ForEach(viewModel.carts, id: \.self) { cart in
                        let index = viewModel.carts.firstIndex(of: cart)
                        ZStack{
                            CartRow(cart: cart)
                            NavigationLink(destination: CartEditScreen(index: index ?? 0), label: {})
                                .opacity(0)
                        }
                    }
                    
                    .onDelete { index in
                        viewModel.carts.remove(atOffsets: index)
                        viewModel.getCartTotalPrice()
                    }
                    .listRowSeparator(.hidden)
                    .onAppear() {
                        print("\(viewModel.cartTotalPrice)")

                    }
                }
                .listStyle(.plain)
                
                Spacer()
                
                Text("Total Price : \(viewModel.cartTotalPrice)₩")
                    .size19Bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, 30)
                    .padding(.trailing, 16)
                
                Button(action: {
                    //TODO: 데이터 서버 전달
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("주문하기")
                        .frame(width: 227, height: 50)
                        .size20Regular()
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
    }
}
