//
//  ToolBarSideMenu.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/12.
//

import SwiftUI

struct ToolBarSideMenu: ToolbarContent {
    @EnvironmentObject var sideBarViewModel: SideMenuViewModel
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action : {
                sideBarViewModel.toggleIsSideMenu()
            }){
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(.black)
            }
            
        }
    }
}
