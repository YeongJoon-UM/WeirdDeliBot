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
            VStack{
                
                Text("App Name")
                    .font(.system(size: 40, weight: .bold))
                    .padding(EdgeInsets(top: 100, leading: 8, bottom: 8, trailing: 8))
                
                Spacer()
                
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                
                Spacer()
                

                
                NavigationLink(destination: MenuListView()){
                    Text("주문하기")
                        .frame(width: 227, height: 50)
                        .font(Font.system(size: 20))
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
