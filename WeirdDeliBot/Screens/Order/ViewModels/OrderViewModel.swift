//
//  OrderViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/03.
//

import Foundation

import Foundation
import Alamofire

class OrderViewModel: ObservableObject {
    @Published var order: Order?
    @Published var isAddressEditable: Bool = false
    @Published var isPhoneEditable: Bool = false
    @Published var newAddress: String = ""
    @Published var newPhone: String = ""
    @Published var newRequest: String = ""
    @Published var orderCode: String = ""
    
    func setOrderList(orderList: [OrderItem]) {
        
        order?.orderList = orderList
        
    }
    
    func setOrderInfo(user: User?, orderList: [OrderItem]) {
        self.order = Order(account: user?.account ?? "", address: user?.address ?? "", addressDesc: user?.addressDesc ?? "", phone: user?.phone ?? "", orderReq: "", name: user?.name ?? "", storeCode: "STR-000000000001", orderList: orderList)
        /*
        order?.account = user?.account ?? ""
        order?.name = user?.name ?? ""
        order?.address = user?.address ?? ""
        order?.addressDesc = user?.addressDesc ?? ""
        order?.phone = user?.phone ?? ""
        */
    }
    
    func setNewAddress() {
        self.order?.addressDesc = self.newAddress
    }
    
    func setNewPhone() {
        self.order?.phone = self.newPhone
    }
    
    func setNewRequest() {
        self.order?.orderReq = self.newRequest
    }
    
    func sendOrder() {
        removeEmptyOption()
        
        OrderRepository.sendOrder(order: self.order!) { response in
            switch(response) {
            case .success(let value):
                self.orderCode = value.result
                print(value)
                break
            case .failure(let error) :
                print(error)
                break
            }
        }
    }
 
    
    func removeEmptyOption() {
        if !(self.order?.orderList.isEmpty ?? false) {
            self.order?.orderList[(self.order!.orderList.endIndex) - 1].options.removeAll { option in
                option.amount == 0
            }
        }
    }
}
