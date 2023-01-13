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
        ZStack {
            NavigationView {
                VStack {
                    List(viewModel.carts) { cart in
                        CartRow(cart: cart)
                    }
                    .listStyle(.inset)
                    
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
            .navigationBarTitle(Text("주문하기"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar{ ToolBarBackButton(presentation: presentation) }
            .toolbar{ ToolBarSideMenu() }
        }
    }
}
