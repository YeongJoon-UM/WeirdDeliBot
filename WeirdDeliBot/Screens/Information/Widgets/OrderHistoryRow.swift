//
//  OrderHistoryRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/15.
//

import SwiftUI

struct OrderHistoryRow: View {
    @ObservedObject var viewModel: OrderHistoryViewModel
    @EnvironmentObject var rootViewModel: RootViewModel
    
    init(orderHistory: OrderHistory) {
        self.viewModel = OrderHistoryViewModel(orderHistory: orderHistory)
    }
    var body: some View {
        NavigationLink(destination: OrderDetailScreen().environmentObject(viewModel)) {
            HStack(spacing: 0) {
                if(viewModel.orderHistory.orderList.isEmpty) {
                    ProgressView(label: {
                        VStack(spacing : 0) {
                            Text("로딩 중..")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    ).progressViewStyle(CircularProgressViewStyle())
                } else {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Text("\(viewModel.orderHistory.orderList[0].itemName)")
                                .size18Bold()
                                .foregroundColor(.myBlack)
                                .padding(.trailing, 8)
                            if viewModel.orderHistory.orderList.count - 1 > 0 {
                                Text("외 \(viewModel.orderHistory.orderList.count - 1)")
                                    .size16Regular()
                                    .foregroundColor(.myGray)
                            }
                        }
                        .padding(.bottom, 4)
                        Group {
                            Text("\(viewModel.orderHistory.addressDesc)")
                                .padding(.bottom, 4)
                            Text("\(dotDateFormatter(viewModel.orderHistory.orderDate))")
                        }
                        .size16Regular()
                        .foregroundColor(.myGray)
                    }
                    .padding(.leading, 16)
                    
                    Spacer()
                    switch viewModel.orderHistory.orderState {
                    case 0...2 :
                        NavigationLink(destination: LocationScreen().environmentObject(viewModel)) {
                            Image(systemName: "box.truck.badge.clock.fill")
                                .imageSize(35)
                                .frame(width: 60, height: 60)
                                .foregroundColor(.myWhite)
                                .background(Color.myGreen)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                        }
                        .padding(.trailing, 16)
                        
                    case 3 :
                        Image(systemName: "checkmark")
                            .imageSize(20)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.myWhite)
                            .background(Color.basic)
                            .cornerRadius(10)
                            .padding(.trailing, 16)
                        
                    case -1 :
                        Image(systemName: "xmark")
                            .imageSize(20)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.myWhite)
                            .background(Color.myGray.opacity(0.5))
                            .cornerRadius(10)
                            .padding(.trailing, 16)
                        
                    default: EmptyView()
                        
                    }
                }
            }
            .frame(height: 100)
            .background(Color.myWhite)
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding(.horizontal, 18)
            .padding(.vertical, 8)
        }
    }
}
