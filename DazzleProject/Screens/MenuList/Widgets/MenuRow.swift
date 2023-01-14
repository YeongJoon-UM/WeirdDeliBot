//
//  MenuRow.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct MenuRow: View {
    var menu: Beverage
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(menu.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                VStack(spacing: 0) {
                    Text(menu.name)
                        .font(Font.system(size: 18))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.vertical, 10)
                    Text("\(menu.price)₩")
                        .font(Font.system(size: 18))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.vertical, 10)
                }

            }
        }
    }
}
