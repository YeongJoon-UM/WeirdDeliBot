//
//  MenuOptionViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation
import SwiftUI
import Alamofire

class OptionViewModel: ObservableObject {
    @Published var option: [Option]? = nil
    @Published var status: Bool? = nil
    @Published var selectedMenu: Menu?
    @Published var userOptionList: [OrderItemOption] = []
    @Published var userMenu: OrderItem?
    
    func getSelectedMenu(menu: Menu) {
        self.selectedMenu = menu
    }
    
    func getOptionList() {
        StoreRepository.getOptionList(itemCode: self.selectedMenu!.id) { response in
            switch(response) {
            case .success(let value):
                self.option = value.result
                if(self.status != false) { self.status = true }
                self.getUserOptionList()
                self.getUserMenu()
                break
            case .failure(let error) :
                print(error)
                self.status = false
                break
            }
        }
    }
    
    func getUserOptionList() {
        for option in self.option! {
            self.userOptionList.append(OrderItemOption(id: option.id, amount: 0))
        }
    }
    
    func getUserMenu() {
        self.userMenu = OrderItem(id: selectedMenu!.id, amount: 1, options: self.userOptionList)
    }
    
    func setUserOption() {
        self.userMenu?.options = self.userOptionList
    }
    
    func addItemAmount() {
        self.userMenu?.amount += 1
    }
    
    func subItemAmount() {
        if(self.userMenu?.amount ?? 0 > 1) {
            self.userMenu?.amount -= 1
        }
    }
    
    func addOptionAmount(option: Option) {
        let index = self.userOptionList.firstIndex(where: { $0.id == option.id })
        self.userOptionList[index!].amount += 1
    }
    
    func subOptionAmount(option: Option) {
        let index = self.userOptionList.firstIndex(where: { $0.id == option.id })
        self.userOptionList[index!].amount -= 1
    }

    
    func totalPrice() -> Int {
        let itemPrice: Int = (selectedMenu?.price ?? 0)
        var optionPrice: Int = 0
        if(self.option != nil) {
            for option in self.option! {
                let price: Int = option.price * self.userOptionList[self.userOptionList.firstIndex(where: { $0.id == option.id }) ?? 0].amount
                optionPrice += price
            }
        }
        return (itemPrice + optionPrice) * (userMenu?.amount ?? 0)
    }
}
