//
//  MenuListScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//


import SwiftUI

struct MenuListView: View {
    @ObservedObject var viewModel: MenuViewModel
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var path: NavigationPath = .init()
    
    init() {
        self.viewModel = MenuViewModel()
        self.viewModel.getCatList()
        self.viewModel.getItemList()
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .top) {
                if(viewModel.category == nil || viewModel.menu == nil){
                    if(viewModel.status == nil) {
                        ProgressView(label: {
                            VStack(spacing : 0) {
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
                                MenuListTab(path: $path, category: category.name).tag(index)
                            }
                        }
                    }
                    .environmentObject(viewModel)
                    .padding(.top, 48)
                    .tabViewStyle(PageTabViewStyle.init(indexDisplayMode: .never))
                    .animation(.default, value: viewModel.currentTab)
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .customToolBar("Menu", showBackButton: false, path: $path)
        }
    }
}


struct TabBarView: View {
    @EnvironmentObject var viewModel: MenuViewModel
    @Binding var currentTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            ScrollViewReader { scrollReader in
                HStack(spacing: 4) {
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
            VStack(spacing: 0) { //MARK: 선택된 탭 띄워지는 정도
                Spacer()
                Text(tabBarItemName)
                    .size16Regular()
                    .foregroundColor((currentTab == tab) ? Color.myWhite : Color.myGray)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 9)
                    .background(Capsule().fill((currentTab == tab) ? Color.basic : Color.myWhite))
                
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}


