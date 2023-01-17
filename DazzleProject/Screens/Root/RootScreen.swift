//
//  ContentView.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/09/29.
//

import SwiftUI

struct RootScreen: View {
    @EnvironmentObject var locationViewModel : LocationViewModel
    var body: some View {
        NavigationView{
            VStack(spacing: 0) {
                
                
                Text("Dazzle Bot")
                    .sizeCustom(40, .bold)
                    .padding(.bottom, 150)
                    .padding(.top, 100)
                
                Image(systemName: "cup.and.saucer")
                    .resizable()
                    .frame(width: 150, height: 120)
                    .scaledToFit()
                
                Spacer()
                

                
                NavigationLink(destination: MenuListView()){
                    Text("주문하기")
                        .frame(width: 227, height: 50)
                        .size20Regular()
                        .foregroundColor(Color.white)
                        .background(Capsule().fill(Color.black))
                        .padding(.bottom, 20)
                }
                 
            }
        }
        .environmentObject(CartViewModel())
        .environmentObject(SideMenuViewModel())
        .environmentObject(LocationViewModel())
    }
    
}
