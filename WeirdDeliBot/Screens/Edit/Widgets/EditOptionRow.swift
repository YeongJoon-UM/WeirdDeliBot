//
//  EditOptionRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/03/28.
//

import SwiftUI

struct EditOptionRow : View {
    @EnvironmentObject var viewModel: EditViewModel
    var option: Option
    
    var body: some View {
        EmptyView()
        /*
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("\(option.name)")
                    .frame(width: 100)
                    .font(.system(size: 16))
                    .padding(.leading, 8)
        
                HStack(spacing: 0) {
                    if(viewModel.tempOrderItem?.options[viewModel.tempOrderItem?.options.firstIndex(where: { $0.id == option.id })! ?? <#default value#>].amount != 0) {
                        Text("+\(option.price * viewModel.userOptionList[viewModel.userOptionList.firstIndex(where: { $0.id == option.id })!].amount)₩")
                            .font(.system(size: 16))
                    }
                }.frame(width: 170, height: 50)
                
                HStack(spacing: 0) {
                    if(viewModel.userOptionList[viewModel.userOptionList.firstIndex(where: { $0.id == option.id })!].amount >= option.maxCount) {
                        Image(systemName: "plus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "plus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.addOptionAmount(option: option)
                            }
                    }
                }
                .frame(width: 20)
                        
                
                Text("\(viewModel.userOptionList[viewModel.userOptionList.firstIndex(where: { $0.id == option.id })!].amount)")
                    .frame(width: 20)
                
                HStack(spacing: 0) {
                    if(viewModel.userOptionList[viewModel.userOptionList.firstIndex(where: { $0.id == option.id })!].amount == option.minCount) {
                        Image(systemName: "minus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: "minus.square")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .onTapGesture {
                                viewModel.subOptionAmount(option: option)
                            }
                    }
                }
                .frame(width: 20)
                .padding(.trailing, 8)
            }
        }*/
    }
}



