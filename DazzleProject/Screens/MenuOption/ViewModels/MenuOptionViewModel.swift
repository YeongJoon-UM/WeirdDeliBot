//
//  MenuOptionViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation
import SwiftUI

class MenuOptionViewModel: ObservableObject {
    @Published var shot = Option(id: "1", name: "샷 추가", price: 500, amount: 0)
    @Published var cream = Option(id: "2", name: "휘핑 크림 추가", price: 500, amount: 0)
    @Published var sizeUp = Option(id: "3", name: "사이즈 업", price: 1000, amount: 0)
    @Published var selectedMenu: Menu?
    
    func getSelectedMenu(meus: [Menu], id: String) {
        for menu in meus {
            if(menu.id == id) {
                selectedMenu = menu
            }
        }
    }
    
    func addToCart() {
        
    }
    
    func addOptionAmount(option: inout Option) {
        option.amount += 1
    }
    
    func subOptionAmount(option: inout Option) {
        option.amount -= 1
    }
    
    func totalOptionPrice() -> Int {
        return (shot.price * shot.amount) + (cream.price * cream.amount) + (sizeUp.price * sizeUp.amount)
    }
}
