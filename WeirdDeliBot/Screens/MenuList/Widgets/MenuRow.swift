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
            if menu.image != nil {
                AsyncImage(url: URL(string: "https://delibot.kro.kr/file/display?fileName=\(menu.image!)")) { image in
                    image
                        .resizable()
                        .frame(width: 90, height: 90)
                        .scaledToFit()
                } placeholder: {
                    HStack(spacing: 0) {
                        ProgressView()
                    }
                    .frame(width: 90, height: 90)
                }
            } else {
                ProgressView()
                    .frame(width: 90, height: 90)
            }

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
