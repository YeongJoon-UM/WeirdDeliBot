//
//  MenuListTab.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/21.
//


import SwiftUI

struct MenuListTab: View {
    @EnvironmentObject var viewModel: MenuViewModel
    let category: String
    
    var body: some View {
        List(viewModel.menu ?? []){ menu in
            if(menu.category == category) {
                ZStack {    //ZStack을 사용해 MenuRow와 NavigationLink를 겹치고NavigationLink를 투명하게해 화살표를 지움
                    MenuRow(menu: menu)
                    NavigationLink(destination:  OptionScreen(menu: menu),
                                   label: {})
                    .opacity(0)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}
