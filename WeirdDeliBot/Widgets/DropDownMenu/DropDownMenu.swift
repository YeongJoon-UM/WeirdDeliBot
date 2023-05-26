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
            //.padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedOption != nil ? Color.basic : Color.myGray.opacity(0.5), lineWidth: 1)
            }
            
            ZStack {
                if self.isOptionsPresented {
                    //Spacer(minLength: 60)
                    DropdownMenuList(options: self.options) { option in
                        self.isOptionsPresented = false
                        self.selectedOption = option
                    }
                }
            }
            
            // We need to push views under drop down menu down, when options list is
            // open
            /*
             .padding(
             // Check if options list is open or not
             .bottom, self.isOptionsPresented
             // If options list is open, then check if options size is greater
             // than 300 (MAX HEIGHT - CONSTANT), or not
             ? CGFloat(self.options.count * 32) > 300
             // IF true, then set padding to max height 300 points
             ? 300 + 30 // max height + more padding to set space between borders and text
             // IF false, then calculate options size and set padding
             : CGFloat(self.options.count * 32) + 30
             // If option list is closed, then don't set any padding.
             : 0
             )*/
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
