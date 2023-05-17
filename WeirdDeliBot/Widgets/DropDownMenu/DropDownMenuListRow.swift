//
//  DropDownMenuListRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/14.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: DropdownMenuOption

    /// An action called when user select an action.
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void
    
    var body: some View {
        Button(action: {
            self.onSelectedAction(option)
        }) {
            HStack(spacing: 0) {
                Text(option.option)
                    .size18Regular()
                    .frame(height: 63, alignment: .leading)
                    .padding(.horizontal, 20)
                Spacer()
            }
        }
        .foregroundColor(.black)
        
    }
}


