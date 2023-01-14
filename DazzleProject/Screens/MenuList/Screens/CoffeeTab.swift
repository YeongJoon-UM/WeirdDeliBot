//
//  CoffeeScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import SwiftUI

struct CoffeeTab: View {
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        List(viewModel.coffee) { coffee in
            ZStack {    //ZStack을 사용해 MenuRow와 NavigationLink를 겹치고NavigationLink를 투명하게해 화살표를 지움
                MenuRow(menu: coffee)
                    
                NavigationLink(destination:  MenuOptionScreen(menu: coffee),
                               label: {})
                .opacity(0)
            }
            .listRowSeparator(.hidden)
        }
        
        .listStyle(.plain)
        
    }
}

struct CoffeeScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeTab()
    }
}
