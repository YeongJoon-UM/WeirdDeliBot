//
//  MenuDescRow.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct MenuDescRow: View {
    var menu: Menu
    
    var body: some View {
        VStack{
            HStack {
                Image(menu.image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                
                VStack {
                    Text(menu.name)
                        .font(Font.system(size: 19, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 8)
                    Text(menu.desc)
                        .frame(maxWidth: .infinity, minHeight: 70 , alignment: .topLeading)
                    Text("\(menu.price)₩")
                        .font(Font.system(size: 19, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .padding(.top, 10)
                }

            }
            .padding(.bottom, 11)
            Divider()
                
        }
    }
}

