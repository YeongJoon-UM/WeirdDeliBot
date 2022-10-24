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
    
    let menu: Menu
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            NavigationView() {
                VStack() {
                    MenuDescRow(menu: menu)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.addToCart()
                        cartViewModel.addCartCnt()
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
