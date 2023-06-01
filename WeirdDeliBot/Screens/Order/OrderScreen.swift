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
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
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
                Text("주문자 정보")
                    .size18Bold()
                    .foregroundColor(.myBlack)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                    .padding(.leading, 36)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(viewModel.order?.name ?? "")")
                        .padding(.bottom, 8)
                    Text("\(viewModel.order?.account ?? "")")
                        .padding(.bottom, 8)
                    Text("\(viewModel.order?.phone ?? "")")
                }
                .size18Regular()
                .foregroundColor(.myBlack)
                .padding(.horizontal, 48)
                
                CustomDivider(top: 16, bottom: 16)
                
                Text("배달 주소")
                    .size18Bold()
                    .foregroundColor(.myBlack)
                    .padding(.bottom, 8)
                    .padding(.leading, 36)
                
                Text("\(viewModel.order?.address ?? "")")
                    .size18Regular()
                    .foregroundColor(.myBlack)
                    .padding(.leading, 48)
                    .padding(.bottom, 8)
                
                ZStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("요청 사항")
                            .size18Bold()
                            .foregroundColor(.myBlack)
                            .padding(.bottom, 8)
                            .padding(.leading, 36)
                        
                        TextField("", text: $viewModel.newRequest)
                            .onChange(of: viewModel.newRequest) { _ in
                                viewModel.setNewRequest()
                            }
                            .placeholder(when: viewModel.newRequest.isEmpty) {
                                Text("예) 휘핑크림 빼주세요.")
                                    .foregroundColor(.myGray.opacity(0.5))
                            }

                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                            .frame(height: 126, alignment: .top)
                            .size18Regular()
                            .padding(.top, 18)
                            .padding(.leading, 20)
                            .background(Rectangle().fill(Color.myWhite).cornerRadius(10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.basic, lineWidth: 1)
                                    
                            }
                            .padding(.horizontal, 28)
                    }
                    .padding(.top, 79)
                    
                    DropdownMenu(selectedOption: $viewModel.newLocation, placeholder: rootViewModel.user?.addressDesc ?? "", options: DropdownMenuOption.locations)
                        .onChange(of: viewModel.newLocation) { _ in
                            viewModel.setNewLocation()
                        }
                }
                
                CustomDivider(top: 24, bottom: 24)
                
                HStack(spacing: 0) {
                    Text("결제 금액")
                    
                    Spacer()
                    
                    Text("\(cartViewModel.totalPrice)₩")
                        
                }
                .size18Bold()
                .foregroundColor(.myBlack)
                .padding(.leading, 36)
                .padding(.trailing, 41)
                
                CustomDivider(top: 24, bottom: 24)
     
                CustomButton(action: {
                    viewModel.sendOrder()
                    
                }, text: "결제하기", textColor: .myWhite, height: 63, backgroundColor: .myGreen)
                    .padding(.bottom, 74)
            }
        }
        .onChange(of: viewModel.isOrderSuccess) { isOrderSuccess in
            if isOrderSuccess {
                path.append(cartViewModel.totalPrice)
                cartViewModel.emptyOrderItem()
            }
        }
        .onAppear() {
            viewModel.setOrderInfo(user: rootViewModel.user, orderList: cartViewModel.userOrderList)
        }
        .navigationDestination(for: Int.self) { price in
            OrderSuccessScreen(path: $path, orderDate: viewModel.orderDetail?.orderDate ?? "",totalPrice: price)
        }
        .customToolBar("Order", showCartButton: false, showInfoButton: false, path: $path)
    }
}

