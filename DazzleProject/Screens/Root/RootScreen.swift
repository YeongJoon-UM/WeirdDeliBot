//
//  ContentView.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/09/29.
//

import SwiftUI

struct RootScreen: View {
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
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 216, height: 46, alignment: .center)
                        .background(.black, in: RoundedRectangle(cornerRadius: 8))
                }
                
            }
        }
        .environmentObject(CartViewModel())
    }
    
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen()
    }
}
