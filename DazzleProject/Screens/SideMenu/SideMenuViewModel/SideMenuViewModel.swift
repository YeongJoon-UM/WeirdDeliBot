//
//  SideMenuViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/12.
//

import Foundation

class SideMenuViewModel: ObservableObject {
    @Published var isSideMenu: Bool = false

    func toggleIsSideMenu() {
        isSideMenu = !isSideMenu
    }
}
