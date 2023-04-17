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
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("\(option.name)")
                    .frame(width: 100)
                    .font(.system(size: 16))
                    .padding(.leading, 8)

                HStack(spacing: 0) {
                    if isSelected {
                        Text("+\(option.price)₩")
                            .font(.system(size: 16))
                    }
                }.frame(width: 170, height: 50)

                ZStack {
                    Circle()
                        .fill(Color.base)
                        .frame(width: 20, height: 20)
                        .onTapGesture() {
                            if !isSelected {
                                viewModel.addOptionAmount(option: option)
                                isSelected.toggle()
                            }
                        }
                    if viewModel.isOptionSelected(option: option) {
                        Circle()
                            .fill(Color.main)
                            .frame(width: 15, height: 15)
                            .onTapGesture() {
                                viewModel.subOptionAmount(option: option)
                                isSelected.toggle()
                            }
                    }
                }
            }
        }
        .onAppear() {
            isSelected = viewModel.isOptionSelected(option: option)
        }
    }
}
