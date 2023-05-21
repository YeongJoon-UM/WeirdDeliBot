//
//  MenuViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation
import Alamofire

class MenuViewModel: ObservableObject {
    @Published var menu: [Menu]? = nil
    @Published var category: [Category]? = nil
    @Published var status: Bool? = nil
    @Published var currentTab: Int = 0
    
    func getCatList() {
        StoreRepository.getCatList() { response in
            switch(response) {
            case .success(let value):
                self.category = value.result
                if(self.status != false) { self.status = true }
                break
            case .failure(let error) :
                print(error)
                self.status = false
                break
            }
        }
    }
    
    func getItemList() {
        StoreRepository.getItemList() { response in
            switch(response) {
            case .success(let value):
                self.menu = value.result
                if(self.status != false) { self.status = true }
                break
            case .failure(let error) :
                print(error)
                self.status = false
                break
            }
        }
    }
}
