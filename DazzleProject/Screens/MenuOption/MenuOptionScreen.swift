//
//  MenuOptionScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct MenuOptionScreen: View {
    @StateObject var viewModel = MenuOptionViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    
    let menu: Beverage
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack() {
                    MenuDescRow(menu: menu)
                        .padding()
                    
                    Text("Options")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 19))
                        .padding(.leading, 16)
                        .padding(.top, 0)
                        
                    MenuOptionRow(viewModel: viewModel)
                    
                    Spacer()
                    
                    Text("Total : \(menu.price + viewModel.totalOptionPrice())₩")
                        .font(Font.system(size: 19, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 30)
                        .padding(.trailing, 16)
                    
                    Button(action: {
                        cartViewModel.addToCart(beverage: menu, shot: viewModel.shot, cream: viewModel.cream, sizeUp: viewModel.sizeUp, totalPrice: (menu.price + viewModel.totalOptionPrice()))
                        self.presentation.wrappedValue.dismiss()    //option 모두 고른 menu를 cart에 넣고 직전 화면으로 돌아감.
                    }) {
                        Text("장바구니")
                            .frame(width: 227, height: 50)
                            .font(Font.system(size: 20))
                            .foregroundColor(Color.white)
                            .background(Capsule().fill(Color.black))
                            .padding(.bottom, 20)
                    }
                }
            }
            .navigationBarTitle(Text("Option"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar{ ToolBarBackButton(presentation: presentation) }
            .toolbar{ ToolBarSideMenu() }
            .toolbar{ ToolBarCart() }
            
            SideMenuScreen()
        }
    }
}

