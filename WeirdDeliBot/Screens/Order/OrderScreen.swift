//
//  OrderScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/03.
//

import SwiftUI

struct OrderScreen: View {
    @StateObject var viewModel: OrderViewModel = OrderViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @Environment(\.presentationMode) var presentation
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            if(viewModel.order?.name == nil || viewModel.order?.name == "") {
                ProgressView(label: {
                    VStack(spacing : 0) {
                        Text("로딩 중..")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                ).progressViewStyle(CircularProgressViewStyle())
            } else {
                Group {
                    Text("배달정보")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .sizeCustom(25, .bold)
                        .padding(.leading, 16)
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                    
                    Text("\(viewModel.order?.address ?? "")")
                        .size16Regular()
                        .padding(.bottom, 8)
                    
                    TextField("\(viewModel.order?.addressDesc ?? "")", text: $viewModel.newAddress)
                        .onChange(of: viewModel.newAddress) { address in
                            viewModel.setNewAddress()
                        }
                        .disabled(!viewModel.isAddressEditable)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .frame(width: 260, height: 40)
                        .size16Regular()
                        .padding(.leading, 16)
                        .foregroundColor(viewModel.isAddressEditable ? .textMain : .main)
                        .background(Rectangle().fill(Color.base).cornerRadius(20))
                        .padding(.bottom, 8)
                    
                    TextField("\(viewModel.order?.phone ?? "")", text: $viewModel.newPhone)
                        .onChange(of: viewModel.newPhone) { phone in
                            var formatted = phone
                            if formatted.count > 3 {
                                formatted.insert("-", at: formatted.index(formatted.startIndex, offsetBy: 3))
                            }
                            if formatted.count > 8 {
                                formatted.insert("-", at: formatted.index(formatted.startIndex, offsetBy: 8))
                            }
                            if formatted.count > 13 {
                                formatted = String(formatted.prefix(13))
                                viewModel.setNewPhone()
                            }
                            viewModel.newPhone = formatted
                        }
                        .disabled(!viewModel.isPhoneEditable)
                        .keyboardType(.phonePad)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .frame(width: 260, height: 40)
                        .size16Regular()
                        .padding(.leading, 16)
                        .foregroundColor(viewModel.isPhoneEditable ? .textMain : .main)
                        .background(Rectangle().fill(Color.base).cornerRadius(20))
                        .padding(.bottom, 16)
                }
                Text("요청사항")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .sizeCustom(25, .bold)
                    .padding(.leading, 16)
                    .padding(.top, 0)
                
                TextField("요청사항을 적어주세요.", text: $viewModel.newRequest)
                    .onChange(of: viewModel.newRequest) { request in
                        viewModel.setNewRequest()
                    }
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .multilineTextAlignment(.leading)
                    .frame(width: 260, height: 100, alignment: .top)
                    .size16Regular()
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .foregroundColor(.sub)
                    .background(Rectangle().fill(Color.base).cornerRadius(20))
                    .padding(.bottom, 16)
                
                Spacer()
                HStack(spacing: 0) {
                    Text("최종 결제금액")
                        .sizeCustom(25, .bold)
                        .padding(.leading, 16)
                        
                    
                    Spacer()
                    
                    Text("\(cartViewModel.totalPrice)₩")
                        .sizeCustom(25, .bold)
                        .padding(.trailing, 16)
                }
                .padding(.bottom, 16)
                Button(action: {
                    //viewModel.setOrderInfo(user: rootViewModel.user, orderList: cartViewModel.userOrderList)
                    viewModel.sendOrder()}) {
                        Text("결제하기")
                            .frame(width: 227, height: 50)
                            .font(Font.system(size: 20))
                            .foregroundColor(Color.white)
                            .background(Capsule().fill(Color.black))
                            .padding(.bottom, 20)
                    }
            }
        }
        .onAppear() {
            viewModel.setOrderInfo(user: rootViewModel.user, orderList: cartViewModel.userOrderList)
            //print(viewModel.order?.account)
        }
        .navigationBarTitle(Text("Order"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{ ToolBarBackButton(presentation: presentation) }
        
    }
}
