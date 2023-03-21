//
//  MenuDescRow.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct MenuDescRow: View {
    var menu: Beverage
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(menu.image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                
                VStack(spacing: 0) {
                    Text(menu.name)
                        .size19Bold()
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 8)
                    Text(menu.desc)
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

