//
//  MenuListTab.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/03/21.
//


import SwiftUI

struct MenuListTab: View {
    @EnvironmentObject var viewModel: MenuViewModel
    @Binding var path: NavigationPath
    let category: String
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            //List(viewModel.menu ?? []){ menu in
            ForEach(viewModel.menu ?? [], id: \.self) { menu in
                if(menu.category == category) {
                    Button(action: {
                        path.append(menu)
                    }) {
                        MenuRow(menu: menu)
                    }
                    CustomDivider(top: 8, bottom: 8)
                    /*
                    ZStack {    //ZStack을 사용해 MenuRow와 NavigationLink를 겹치고NavigationLink를 투명하게해 화살표를 지움
                        MenuRow(menu: menu)
                        NavigationLink(destination:  OptionScreen(path: $path, menu: menu),
                                       label: {})
                        .opacity(0)
                    }*/
                }
            }
            .listSectionSeparatorTint(Color.basic)
            .listStyle(.plain)
        }
        .navigationDestination(for: Menu.self) { menu in
            OptionScreen(path: $path, menu: menu)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
