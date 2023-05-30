//
//  CarRowViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/03/26.
//

import Foundation
import Alamofire

class CartRowViewModel: ObservableObject {
    @Published var menuResponse: [Menu] = []
    @Published var option: [Option] = []
    @Published var status: Bool? = nil
    @Published var menu: Menu?
    @Published var isOptionShow: Bool = false
    @Published var menuAmount: Int = 0
    
    func getItemInfo(itemCode: String, amount: Int) {
        StoreRepository.getItemInfo(itemCode: itemCode) { response in
            switch(response) {
            case .success(let value):
                self.menuResponse = value.result
                if(self.status != false) { self.status = true }
                self.setItemInfo(amount: amount)
                break
            case .failure(let error) :
                print("getItemInfo: \(error)")
                self.status = false
                break
            }
        }
    }
    
    func getOptionList(itemCode: String) {
        StoreRepository.getOptionList(itemCode: itemCode) { response in
            switch(response) {
            case .success(let value):
                self.option = value.result
                if(self.status != false) { self.status = true }
                break
            case .failure(let error) :
                print("getOptionList: \(error)")
                self.status = false
                break
            }
        }
    }
    
    func setItemInfo(amount: Int) {
        self.menu = self.menuResponse[0]
        self.menuAmount = amount
    }
    
    func isOptionShowToggle() {
        self.isOptionShow.toggle()
    }
}
