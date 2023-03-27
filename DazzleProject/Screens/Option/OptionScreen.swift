//
//  MenuOptionScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct OptionScreen: View {
    @StateObject var viewModel: OptionViewModel = OptionViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var rootViewModel: RootViewModel
    let menu: Menu

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
                    
                    if(viewModel.option == nil){
                        if(viewModel.status == nil) {
                            ProgressView(label: {
                                VStack{
                                    Text("로딩 중..")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            ).progressViewStyle(CircularProgressViewStyle())
                        } else if viewModel.status == false { //로딩 실패 시 실패 메세지 출력.
                            Spacer()
                            Text("Loading Failed.")
                        }
                    } else {
                        ScrollView() {
                            ForEach(viewModel.option!){ option in
                                OptionRow(option: option)
                                    .environmentObject(viewModel)
                            }
                        }
                    }

                    Spacer()
                    
                    Text("Total : \(viewModel.totalPrice())₩")
                        .font(Font.system(size: 19, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.bottom, 30)
                        .padding(.trailing, 16)
                    
                    Button(action: {
                        viewModel.setUserOption()
                        cartViewModel.addOrderItem(item: viewModel.userMenu!, price: viewModel.totalPrice())
                        print(cartViewModel.userOrderList)
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
                .onAppear() {
                    viewModel.getSelectedMenu(menu: menu)
                    viewModel.getOptionList(token: rootViewModel.token?.token ?? "")
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

