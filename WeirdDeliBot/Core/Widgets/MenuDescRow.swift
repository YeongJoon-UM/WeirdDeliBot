//
//  MenuDescRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct MenuDescRow<ViewModel: OptionProtocol>: View {
    let viewModel: ViewModel
    let menu: Menu
    @State var itemAmount: Int = 1
    
    var body: some View {
        VStack(spacing: 0) {
            if menu.image != nil {
                AsyncImage(url: URL(string: "https://delibot.kro.kr/file/display?fileName=\(menu.image!)")) { image in
                    image
                        .resizable()
                        .frame(width: 120, height: 120)
                        .scaledToFit()
                } placeholder: {
                    HStack(spacing: 0) {
                        ProgressView()
                            
                    }.frame(width: 120, height: 120)
                }
            } else {
                ProgressView()
                    .frame(width: 120, height: 120)
            }
        
            CustomDivider(top: 14, bottom: 16)
            
            Text(menu.name)
                .sizeCustom(20, .bold)
                .foregroundColor(.myBlack)
                .padding(.bottom, 8)
            
            Text(menu.desc ?? "Description")
                .size16Regular()
                .foregroundColor(.myBlack)
                .frame(width: 250, height: 39, alignment: .top)
                .padding(.bottom, 16)
            
            ZStack {
                Text("\(menu.price)₩")
                    .sizeCustom(20, .bold)
                    .foregroundColor(.myBlack)
            
                HStack(spacing: 0) {
                    Spacer()
                    if itemAmount == 1 {
                        Image(systemName: "minus.circle.fill")
                            .imageSize(24)
                            .foregroundColor(.myGray.opacity(0.5))
                    } else {
                        Image(systemName: "minus.circle.fill")
                            .imageSize(24)
                            .foregroundColor(.basic)
                            .onTapGesture {
                                viewModel.subItemAmount()
                                itemAmount -= 1
                            }
                    }
                    
                    
                    Text("\(viewModel.getItemAmount() )")
                        .frame(width: 20)
                        .padding(.horizontal, 8)
                    
                   
                    if itemAmount >= 99 {
                        Image(systemName: "plus.circle.fill")
                            .imageSize(24)
                            .foregroundColor(.myGray.opacity(0.5))
                    } else {
                        Image(systemName: "plus.circle.fill")
                            .imageSize(24)
                            .foregroundColor(.basic)
                            .onTapGesture {
                                viewModel.addItemAmount()
                                itemAmount += 1
                            }
                    }
                }
                .padding(.trailing, 27)
                
            }
            
            
        }
        .onAppear() {
            itemAmount = viewModel.getItemAmount()
        }
    }
}

