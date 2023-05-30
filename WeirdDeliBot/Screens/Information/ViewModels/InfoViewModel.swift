//
//  InfoViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/05.
//

import Foundation

class InfoViewModel: ObservableObject {
    @Published var orderHistories: [OrderHistory] = []
    
    func getOrderHistory(account: String) {
        OrderRepository.getOrderHistory(account: account) { response in
            switch(response) {
            case .success(let value):
                self.orderHistories = value.result
                break
            case .failure(let error) :
                
                print("getOrderHistory: \(error)")
                break
            }
        }
    }
}
