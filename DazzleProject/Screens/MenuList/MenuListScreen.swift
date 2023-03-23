//
//  MenuListScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//


import SwiftUI

struct MenuListView: View {
    //@State var currentTab: Int = 0
    @StateObject var viewModel: MenuViewModel = MenuViewModel()
    @EnvironmentObject var rootViewModel: RootViewModel
  
    var body: some View {
        ZStack{
            NavigationView {
                ZStack(alignment: .top) {
                    if(viewModel.category == nil || viewModel.menu == nil){
                        if(viewModel.status == nil) {
                            ProgressView(label: {
                                VStack{
                                    Text("로딩 중..")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            ).progressViewStyle(CircularProgressViewStyle())
                        } else if viewModel.status == false { //로딩 실패 시 실패 메세지 출력.
                            Spacer()
                            Text("Loading Failed.")
                        }
                    } else {
                        TabBarView(currentTab: $viewModel.currentTab)
                            .environmentObject(viewModel)
                        TabView(selection: self.$viewModel.currentTab) {
                            if(viewModel.category != nil) {
                                ForEach(Array(zip(viewModel.category!.indices, viewModel.category!)), id: \.0) { index, category in
                                    MenuListTab(category: category.name).tag(index)
                                }
                            }
                        }
                        .environmentObject(viewModel)
                        .padding([.top], 40)
                        .tabViewStyle(PageTabViewStyle.init(indexDisplayMode: .never))
                        .animation(.default, value: viewModel.currentTab)
                    }
                }
                .navigationBarTitle(Text("Menu"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{ ToolBarSideMenu() }
                .toolbar{ ToolBarCart() }
                
            }
            .navigationBarBackButtonHidden()
            SideMenuScreen()
        }
        .onAppear(){
            viewModel.getCatList(token: rootViewModel.token?.token ?? "")
            viewModel.getItemList(token: rootViewModel.token?.token ?? "")
        }
    }
}


struct TabBarView: View {
    @EnvironmentObject var viewModel: MenuViewModel
    @Binding var currentTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            ScrollViewReader { scrollReader in
                HStack(spacing: 20) {
                    ForEach(Array(zip(viewModel.category!.indices, viewModel.category!)),
                            id: \.0,
                            content: {
                        index, category in
                        TabBarItem(currentTab: self.$currentTab,
                                   tabBarItemName: category.name,
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
            VStack(spacing: 5) { //MARK: 선택된 탭 띄워지는 정도
                Spacer()
                Text(tabBarItemName)
                    .foregroundColor((currentTab == tab) ? Color.main : Color.textMain)
                if currentTab == tab {
                    Color.main
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


