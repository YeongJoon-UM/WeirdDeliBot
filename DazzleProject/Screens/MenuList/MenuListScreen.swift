//
//  MenuListScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//


import SwiftUI

struct MenuListView: View {
    @State var currentTab: Int = 0
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        ZStack{
            NavigationView {
                ZStack(alignment: .top) {
                    TabBarView(currentTab: $currentTab)
                    TabView(selection: self.$currentTab) {
                        CoffeeTab().tag(0)
                        TeaBottleTab().tag(1)
                        JuiceAdeTab().tag(2)
                        SmoothieFrapTab().tag(3)
                        BubbleLatteTab().tag(4)
                        BakeryTab().tag(5)
                    }
                    .padding([.top], 40)
                    .tabViewStyle(PageTabViewStyle.init(indexDisplayMode: .never))
                    .animation(.default, value: currentTab)
                }
                .navigationBarTitle(Text("주문하기"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{ ToolBarBackButton(presentation: presentation) }
                .toolbar{ ToolBarSideMenu() }
                .toolbar{ ToolBarCart() }
                
            }
            .navigationBarBackButtonHidden()
            SideMenuScreen()
        }
    }
}


struct TabBarView: View {
    @StateObject var viewModel = MenuListViewModel()
    @Binding var currentTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            ScrollViewReader { scrollReader in
                HStack(spacing: 20) {
                    ForEach(Array(zip(viewModel.topicList.indices, viewModel.topicList)),
                            id: \.0,
                            content: {
                        index, name in
                        TabBarItem(currentTab: self.$currentTab,
                                   tabBarItemName: name,
                                   tab: index)
                    })
                    .onChange(of: currentTab){ value in
                        withAnimation{ scrollReader.scrollTo(value, anchor: .center) }
                    }
                }
               
            }
        }
        .padding(.horizontal)
        .frame(height: 30)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.black
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}


