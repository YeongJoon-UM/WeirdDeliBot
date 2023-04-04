//
//  OrderScreen.swift
//  DazzleProject
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
                Text("배달정보")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 19))
                    .padding(.leading, 16)
                    .padding(.top, 0)
                Text("\(viewModel.order?.address ?? "")")
                
                TextField("\(viewModel.order?.addressDesc ?? "")", text: $viewModel.newAddress)
                    .onChange(of: viewModel.newAddress) { address in
                        viewModel.setNewAddress()
                    }
                    .disabled(!viewModel.isAddressEditable)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .frame(width: 227, height: 30)
                    .size12Regular()
                    .padding(.leading, 10)
                    .foregroundColor(viewModel.isAddressEditable ? .textMain : .main)
                    .background(Capsule().fill(Color.base))
                
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
                    .frame(width: 227, height: 30)
                    .size12Regular()
                    .padding(.leading, 10)
                    .foregroundColor(viewModel.isPhoneEditable ? .textMain : .main)
                    .background(Capsule().fill(Color.base))
                
                Text("요청사항")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 19))
                    .padding(.leading, 16)
                    .padding(.top, 0)
                
                TextField("요청사항을 적어주세요.", text: $viewModel.newRequest)
                    .onChange(of: viewModel.newRequest) { request in
                        viewModel.setNewRequest()
                    }
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .frame(width: 227, height: 30)
                    .size12Regular()
                    .padding(.leading, 10)
                    .foregroundColor(.sub)
                    .background(Capsule().fill(Color.base))
                
                Text("결제금액")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 19))
                    .padding(.leading, 16)
                    .padding(.top, 0)
                
                Text("\(cartViewModel.totalPrice)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 19))
                    .padding(.leading, 16)
                    .padding(.top, 0)
                
                Button(action: {
                    //viewModel.setOrderInfo(user: rootViewModel.user, orderList: cartViewModel.userOrderList)
                    viewModel.sendOrder(token: rootViewModel.token?.token ?? "")}) {
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
            //TODO: 이거 문제인듯
            //print(viewModel.order?.account)
        }
        .navigationBarTitle(Text("Order"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{ ToolBarBackButton(presentation: presentation) }
        
    }
}
