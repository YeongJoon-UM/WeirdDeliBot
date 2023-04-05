//
//  ToolBarSideMenu.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/12.
//

import SwiftUI

struct ToolBarInformation: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(destination: InfoScreen()) {
                Image(systemName: "person.fill")
                    .foregroundColor(.black)
            }
        }
    }
}
