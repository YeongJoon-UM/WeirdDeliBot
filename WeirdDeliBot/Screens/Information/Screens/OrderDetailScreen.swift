//
//  OrderDetailScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/17.
//

import SwiftUI
import PopupView

struct OrderDetailScreen: View {
    @EnvironmentObject var viewModel: OrderHistoryViewModel
    @Environment(\.presentationMode) var presentation
    @State var isPopUpShow: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                if viewModel.orderHistory.orderState >= 0 && viewModel.orderHistory.orderState <= 2 {
                    if viewModel.orderHistory.orderState == 0 {
                        Text("주문이 완료되었습니다")
                            .sizeCustomJUA(22)
                            .foregroundColor(.myGreen)
                    } else if viewModel.orderHistory.orderState == 1 {
                        Text("준비 중 입니다")
                            .sizeCustomJUA(22)
                            .foregroundColor(.myGreen)
                    } else if viewModel.orderHistory.orderState == 2 {
                        Text("배달을 시작했습니다")
                            .sizeCustomJUA(22)
                            .foregroundColor(.myGreen)
                    }
                    Spacer()
                    NavigationLink(destination: LocationScreen().environmentObject(viewModel)) {
                        Image(systemName: "box.truck.badge.clock.fill")
                            .imageSize(35)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.myWhite)
                            .background(Color.myGreen)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                } else if viewModel.orderHistory.orderState == 3 {
                    Text("배달이 완료되었습니다")
                        .sizeCustomJUA(22)
                        .foregroundColor(.basic)
                    Spacer()
                    
                    Image(systemName: "checkmark")
                        .imageSize(20)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.myWhite)
                        .background(Color.basic)
                        .cornerRadius(10)
                } else if viewModel.orderHistory.orderState == -1 {
                    Text("주문이 취소되었습니다")
                        .sizeCustomJUA(22)
                        .foregroundColor(.myGray)
                    Spacer()
                    
                    Image(systemName: "xmark")
                        .imageSize(20)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.myWhite)
                        .background(Color.myGray.opacity(0.5))
                        .cornerRadius(10)
                }
            
            }
            .frame(height: 60)
            .padding(.top, 20)
            .padding(.leading, 36)
            .padding(.trailing, 34)
            
            CustomDivider(top: 24, bottom: 16)
            
            OrderListView(orderList: viewModel.orderHistory.orderList, totalPrice: viewModel.getTotalPrice())
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text("주문 일자")
                            .foregroundColor(.myBlack)
                        Spacer()
                        Text("\(slashDateFormatter(viewModel.orderHistory.orderDate))")
                            .padding(.trailing, 8)
                            .foregroundColor(.myGray)
                    }
                    .padding(.bottom, 16)
                    
                    Text("배달 정보")
                        .foregroundColor(.myBlack)
                        .padding(.bottom, 4)
                    Group {
                        Text("\(viewModel.orderHistory.address)")
                        Text("\(viewModel.orderHistory.addressDesc)")
                        Text("\(viewModel.orderHistory.phone)")
                    }
                    .foregroundColor(.myGray)
                    
                    Text("요청 사항")
                        .foregroundColor(.myBlack)
                        .padding(.top, 16)
                        .padding(.bottom, 4)
                        
                    Text("\(viewModel.orderHistory.orderReq)")
                        .foregroundColor(.myGray)
                }
                .padding(.horizontal, 16)
                .size16Regular()
                
            }
            .frame(maxHeight: 190)
            .padding(.horizontal, 24)
            .padding(.bottom, 12)
            
            Divider()
                .background(Color.basic)
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            
            if viewModel.orderHistory.orderState == 0 {
                CustomButton(action: { isPopUpShow = true }, text: "주문 취소", textColor: .myWhite, height: 63, backgroundColor: .myRed)
                    .padding(.bottom, 74)
            } else {
                Text("주문 취소")
                    .size18Regular()
                    .frame(maxWidth: .infinity, maxHeight: 63)
                    .foregroundColor(.myWhite)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.myGray.opacity(0.5)))
                    .padding(.horizontal, 28)
                
                if viewModel.orderHistory.orderState == 3 {
                    Text("준비가 시작되면 주문 취소가 불가능 합니다")
                        .size16Regular()
                        .foregroundColor(.myGray.opacity(0.5))
                        .padding(.top, 16)
                        .padding(.bottom, 39)
                    
                } else if viewModel.orderHistory.orderState == -1 {
                    Text("이미 취소 된 주문입니다")
                        .size16Regular()
                        .foregroundColor(.myGray.opacity(0.5))
                        .padding(.top, 16)
                        .padding(.bottom, 39)
                    
                } else {
                    Text("준비가 시작되면 주문 취소가 불가능 합니다")
                        .size16Regular()
                        .foregroundColor(.myGray.opacity(0.5))
                        .padding(.top, 16)
                        .padding(.bottom, 39)
                }
            }
        }
        .popup(isPresented: $isPopUpShow) {
            VStack(spacing: 0) {
                Text("주문 취소하시겠습니까?")
                    .sizeCustom(20)
                    .foregroundColor(.myBlack)
                    .padding(.top, 48)
                    .padding(.bottom, 56)
                Divider()
                HStack(spacing: 0) {
                    Button(action: {isPopUpShow = false}) {
                        Spacer()
                        Text("아니요")
                            .sizeCustom(20)
                            .foregroundColor(.myBlack)
                        Spacer()
                    }
                    
                    Divider()
                    Button(action: {
                        viewModel.cacelOrder()
                        isPopUpShow = false
                        presentation.wrappedValue.dismiss()
                    }) {
                        Spacer()
                        Text("네")
                            .sizeCustom(20)
                            .foregroundColor(.myBlack)
                        Spacer()
                    }
                }
                    
            }
            .frame(height: 182)
            .background(Color.myWhite)
            .cornerRadius(10)
            .padding(.horizontal, 24)
            .shadow(radius: 3)
        } customize: {
            $0
                .closeOnTapOutside(false)
                .closeOnTap(false)
                .backgroundColor(.myGray.opacity(0.5))
            
        }
        .customToolBar("Order Details")
    }
}
