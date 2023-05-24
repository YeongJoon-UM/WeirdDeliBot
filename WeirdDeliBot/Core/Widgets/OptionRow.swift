//
//  MenuDescRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct OptionRow<ViewModel: OptionProtocol>: View {
    let viewModel: ViewModel
    let option: Option
    @State var isSelected: Bool = false

    init(viewModel: ViewModel, option: Option) {
        self.viewModel = viewModel
        self.option = option
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(option.name)")
                .size16Regular()
                .foregroundColor(.myBlack)
                
            Spacer()
            
            Text("\(option.price)₩")
                .size16Regular()
                .foregroundColor(.myBlack)
                .frame(width: 60, alignment: .trailing)
                .padding(.trailing, 24)
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .imageSize(24)
                    .foregroundColor(.basic)
                    .onTapGesture() {
                        viewModel.subOptionAmount(option: option)
                        isSelected.toggle()
                    }
            } else {
                Image(systemName: "circle.fill")
                    .imageSize(24)
                    .foregroundColor(.myGray.opacity(0.5))
                    .onTapGesture() {
                        viewModel.addOptionAmount(option: option)
                        isSelected.toggle()
                    }
            }

        }
        .padding(.bottom, 14)
        .onAppear() {
            isSelected = viewModel.isOptionSelected(option: option)
        }
    }
}
