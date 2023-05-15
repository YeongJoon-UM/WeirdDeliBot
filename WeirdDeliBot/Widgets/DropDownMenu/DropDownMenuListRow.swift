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
            Text(option.option)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}


