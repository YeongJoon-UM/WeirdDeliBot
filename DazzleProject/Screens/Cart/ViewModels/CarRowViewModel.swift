//
//  CarRowViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/26.
//

import Foundation
import SwiftUI
import Alamofire

class CartRowViewModel: ObservableObject {
    @Published var menuResponse: [Menu] = []
    @Published var optionResponse: [Option] = []
    @Published var status: Bool? = nil
    @Published var menu: Menu?
    @Published var option: Option?
    
    func getItemInfo(item: OrderItem, token: String) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        StoreRepository.getItemInfo(itemCode: item.id, token: header) { response in
            switch(response) {
            case .success(let value):
                self.menuResponse = value.result
                if(self.status != false) { self.status = true }
                self.setItemInfo()
                break
            case .failure(let error) :
                print(error)
                self.status = false
                break
            }
        }
    }
    

    
    func getOptionInfo(option: OrderItemOption, token: String) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        StoreRepository.getOptionInfo(optionCode: option.id, token: header) { response in
            switch(response) {
            case .success(let value):
                self.optionResponse = value.result
                if(self.status != false) { self.status = true }
                self.setOptionInfo()
                break
            case .failure(let error) :
                print(error)
                self.status = false
                break
            }
        }
    }
    
    func setItemInfo() {
        self.menu = self.menuResponse[0]
    }
    
    func setOptionInfo() {
        self.option = self.optionResponse[0]
    }
    
}
