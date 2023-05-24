//
//  MenuRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/03/20.
//

import SwiftUI

struct MenuRow: View {
    var menu: Menu
    
    var body: some View {
        HStack(spacing: 0) {
            Image(menu.image ?? "sample")
                .resizable()
                .frame(width: 90, height: 90)
                .scaledToFit()
            Spacer()
            VStack(alignment: .trailing, spacing: 0) {
                Text(menu.name)
                Text("\(menu.price)₩")
                    
            }
            .size18Regular()
            .foregroundColor(.myBlack)
            
        }
        .padding(.horizontal, 24)
        
    }
}
