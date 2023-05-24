//
//  OrderListView.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/16.
//

import SwiftUI

struct OrderListView: View {
    let orderList: [OrderInfo]
    let totalPrice: Int
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                ForEach(orderList.indices, id: \.self) { index in
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("\(orderList[index].itemName)")
                                .size18Bold()
                                .foregroundColor(.myBlack)
                                .padding(.trailing, 4)
                            if orderList[index].count > 1 {
                                Text("×\(orderList[index].count)")
                                    .size16Bold()
                                    .foregroundColor(.myGray)
                            }
                            Spacer()
                            Text("\(orderList[index].price / orderList[index].count)₩")
                                .size18Bold()
                                .foregroundColor(.myBlack)
                        }
                        
                        if !orderList[index].optionList.isEmpty {
                            ForEach(orderList[index].optionList.indices, id: \.self) { index2 in
                                HStack(spacing: 0) {
                                    Image(systemName: "plus")
                                        .imageSize(8)
                                        .padding(.trailing, 8)
                                    Text("\(orderList[index].optionList[index2].itemName)")
                                    Spacer()
                                    Text("\(orderList[index].optionList[index2].price)₩")
                                }
                                .size16Bold()
                                .padding(.top, 7)
                            }
                        }
                    }
                    .padding(.leading, 36)
                    .padding(.trailing, 44)
                    .padding(.bottom, 16)
                }
            }
            .frame(height: 200)
            
            CustomDivider(bottom: 24)
            
            HStack(spacing: 0) {
                Text("결제 금액")
                
                Spacer()
                
                Text("\(totalPrice)₩")
            }
            .size18Bold()
            .foregroundColor(.myBlack)
            .padding(.leading, 36)
            .padding(.trailing, 44)
            
            CustomDivider(top: 18, bottom: 16)
        }
    }
}

