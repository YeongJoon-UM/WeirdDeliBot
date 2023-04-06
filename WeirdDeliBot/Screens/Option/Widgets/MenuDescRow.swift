//
//  MenuDescRow.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct MenuDescRow: View {
    var menu: Menu
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
<<<<<<< HEAD:WeirdDeliBot/Screens/Option/Widgets/MenuDescRow.swift
                Image(menu.image ?? "sample")
=======
                Image(menu.image)
>>>>>>> main:DazzleProject/Screens/MenuOption/Widgets/MenuDescRow.swift
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                    .padding(.trailing, 8)
                
                VStack(spacing: 0) {
                    Text(menu.name)
                        .size19Bold()
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 8)
                    Text(menu.desc ?? "Description")
                        .frame(maxWidth: .infinity, minHeight: 70 , alignment: .topLeading)
                    Text("\(menu.price)₩")
                        .size19Bold()
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .padding(.top, 10)
                }
                .padding(.leading, 8)
            }
            .padding(.bottom, 11)
            Divider()
                .padding(.bottom, 0)
                
        }
    }
}

