//
//  ToolBarBackButton.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct ToolBarBackButton: ToolbarContent {
    @Binding var presentation: PresentationMode
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action : {
                self.$presentation.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
            }
            
        }
    }
}
