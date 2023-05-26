//
//  DropDownMenu.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/14.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isOptionsPresented: Bool = false
    
    @Binding var selectedOption: DropdownMenuOption?
    
    let placeholder: String
    let options: [DropdownMenuOption]
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    self.isOptionsPresented.toggle()
                }
            }) {
                HStack {
                    Text(selectedOption == nil ? placeholder : selectedOption!.option)
                        .size18Regular()
                        .foregroundColor(selectedOption != nil ? Color.myBlack : Color.myGray.opacity(0.5))
                    
                    Spacer()
                    
                    Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                        .fontWeight(.medium)
                        .foregroundColor(.myBlack)
                }
                .padding(.horizontal, 20)
                .frame(height: 63)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedOption != nil ? Color.basic : Color.myGray.opacity(0.5), lineWidth: 1)
            }
            
            ZStack {
                if self.isOptionsPresented {
                    DropdownMenuList(options: self.options) { option in
                        self.isOptionsPresented = false
                        self.selectedOption = option
                    }
                }
            }
        }
        .padding(.horizontal, 28)
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(
            selectedOption: .constant(nil),
            placeholder: "Select your birth month",
            options: DropdownMenuOption.locations
        )
    }
}
