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
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(menu.image ?? "sample")
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
