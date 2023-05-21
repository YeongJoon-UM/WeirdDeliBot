//
//  InfoScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/05.
//

import SwiftUI

struct InfoScreen: View {
    @ObservedObject var viewModel: InfoViewModel
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var rootViewModel: RootViewModel
    
    init() {
        self.viewModel = InfoViewModel()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "person.fill")
                    .imageSize(75)
                    .foregroundColor(.myGray)
                    .background(Color.myGray.opacity(0.2))
                    .clipShape(Circle())
                    .padding(.trailing, 16)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Text("\(rootViewModel.user?.name ?? "")")
                            .foregroundColor(.myBlack)
                            .padding(.trailing, 8)
                        
                        Text("\(rootViewModel.user?.account ?? "")")
                            .foregroundColor(.myGray)
                    }
                    .size16Regular()
                    .padding(.bottom, 8)
                    
                    Group {
                        Text("\(rootViewModel.user?.address ?? "")")
                        Text("\(rootViewModel.user?.addressDesc ?? "")")
                        Text("\(rootViewModel.user?.phone ?? "")")
                    }
                    .size14Regular()
                    .foregroundColor(.myGray)
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 40, leading: 24, bottom: 34, trailing: 24))
           
        }
        VStack(spacing: 0) {
            Text("주문 내역")
                .frame(maxWidth: .infinity, alignment: .leading)
                .sizeCustomJUA(18)
                .foregroundColor(.myWhite)
                .padding(.leading, 24)
                .padding(.top, 16)
                .padding(.bottom, 4)
            ScrollView {
                ForEach(viewModel.orderHistories.indices, id: \.self) { index in
                    OrderHistoryRow(orderHistory: viewModel.orderHistories[index])
                }
            }
            
            
            Spacer()
        }
        .onAppear() {
            viewModel.getOrderHistory(account: rootViewModel.user?.account ?? "")
        }
        .background(Color.basic)
        .cornerRadius(10)
        .shadow(radius: 8)
        .edgesIgnoringSafeArea(.all)
        
        .customToolBar("User Info", showCartButton: false, showInfoButton: false)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: UserEditScreen().environmentObject(rootViewModel)) {
                    Image(systemName: "gearshape.fill")
                        .imageSize(25)
                        .foregroundColor(.myBlack)
                }
            }
        }
        
    }
    
}

