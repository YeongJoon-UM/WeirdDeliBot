//
//  ContentView.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/09/29.
//

import SwiftUI

struct RootScreen: View {
    @ObservedObject var viewModel: RootViewModel
    
    init() {
        self.viewModel = RootViewModel()
    }
    
    var body: some View {
        MenuListView()
            .environmentObject(viewModel)
            .environmentObject(CartViewModel())
            .environmentObject(SideMenuViewModel())
        /*if(viewModel.token != nil) {
            MenuListView()
                .environmentObject(viewModel)
                .environmentObject(CartViewModel())
                .environmentObject(SideMenuViewModel())
        } else {
            LogInScreen()
                .environmentObject(viewModel)
                .environmentObject(CartViewModel())
                .environmentObject(SideMenuViewModel())
        }*/
    }
}
