//
//  ContentView.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/09/29.
//

import SwiftUI

struct RootScreen: View {
    @EnvironmentObject var locationViewModel : LocationViewModel
    @ObservedObject var viewModel: RootViewModel = RootViewModel()
    var body: some View {
        if(viewModel.token != nil && viewModel.user?.name != nil) {
            MenuListView()
                .environmentObject(viewModel)
                .environmentObject(CartViewModel())
                
        } else {
            LogInScreen()
                .environmentObject(viewModel)
                .onAppear() {
                    print("")
                }
        }
    }
    
}
