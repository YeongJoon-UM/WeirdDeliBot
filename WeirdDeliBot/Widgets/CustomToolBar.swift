//
//  CustomToolBar.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/17.
//

import SwiftUI

struct CustomToolBar: ViewModifier {
    let title: String
    let showBackButton: Bool
    let showCartButton: Bool
    let showInfoButton: Bool
    @Environment(\.presentationMode) var presentationMode
    @Binding var path: NavigationPath

    
    init(title: String, showBackButton: Bool = true, showCartButton: Bool = false, showInfoButton: Bool = true, path: Binding<NavigationPath> = .constant(NavigationPath())) {
        self.title = title
        self.showBackButton = showBackButton
        self.showCartButton = showCartButton
        self.showInfoButton = showInfoButton
        _path = path
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                if showBackButton {
                    ToolBarBackButton(presentation: presentationMode)
                }
                if showCartButton {
                    ToolBarCart(path: $path)
                }
                if showInfoButton {
                    ToolBarInformation()
                }
                
            }
    }
}

extension View {
    func customToolBar(_ title: String, showBackButton: Bool = true, showCartButton: Bool = true, showInfoButton: Bool = true, path: Binding<NavigationPath> = .constant(NavigationPath())) -> some View {
        modifier(CustomToolBar(title: title, showBackButton: showBackButton, showCartButton: showCartButton, showInfoButton: showInfoButton, path: path))
    }
}

struct ToolBarCart: ToolbarContent {
    @EnvironmentObject var viewModel: CartViewModel
    @Binding var path: NavigationPath
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(destination: CartScreen(path: $path)){
                ZStack{ //ZStack을 사용해 장바구니 아이콘과 아이템이 장바구니에 담겼을 경우 알림을 뜨게 함
                    Image(systemName: "cart.fill")
                        .foregroundColor(.black)
                    if viewModel.userOrderList.count > 0 && viewModel.userOrderList.count < 10 {
                        Image(systemName: "\(viewModel.userOrderList.count).circle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .background(.black, in: Circle())
                            .frame(width: 14, height: 14, alignment: .bottomTrailing)
                            .padding(EdgeInsets(top: 11, leading: 16, bottom: 0, trailing: 0))
                    }
                    else if viewModel.userOrderList.count >= 10 {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .background(.black, in: Circle())
                            .frame(width: 14, height: 14, alignment: .bottomTrailing)
                            .padding(EdgeInsets(top: 11, leading: 16, bottom: 0, trailing: 0))
                    }
                }
            }
        }
    }
}

struct ToolBarBackButton: ToolbarContent {
    @Binding var presentation: PresentationMode
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action : {
                self.$presentation.wrappedValue.dismiss()
            }){
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
            }
            
        }
    }
}

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
