//
//  OrderViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/03.
//

import Foundation

class OrderViewModel: ObservableObject {
    @Published var order: Order?
    @Published var isAddressEditable: Bool = false
    @Published var isPhoneEditable: Bool = false
    @Published var newAddress: String = ""
    @Published var newPhone: String = ""
    @Published var newRequest: String = ""
    @Published var orderCode: String = ""
    @Published var orderDetail: OrderHistory?
    @Published var newLocation: DropdownMenuOption?
    @Published var isOrderSuccess: Bool = false
    
    func setOrderList(orderList: [OrderItem]) {
        order?.orderList = orderList
    }
    
    func setOrderInfo(user: User?, orderList: [OrderItem]) {
        self.order = Order(account: user?.account ?? "", address: user?.address ?? "", addressDesc: user?.addressDesc ?? "", phone: user?.phone ?? "", orderReq: "", name: user?.name ?? "", storeCode: "STR-000000000001", latitude: "", longitude: "", orderList: orderList)
        if let selectedOption = DropdownMenuOption.locations.first(where: { $0.option == (user?.addressDesc ?? "") }) {
            order?.latitude = selectedOption.latitude
            order?.longitude = selectedOption.longitude
            }
    }
    
    func setNewAddress() {
        self.order?.addressDesc = self.newAddress
    }

    func setNewRequest() {
        self.order?.orderReq = self.newRequest
    }
    
    func setNewLocation() {
        if newLocation != nil && order?.addressDesc != newLocation?.id {
            order?.addressDesc = newLocation!.option
            order?.latitude = newLocation!.latitude
            order?.longitude = newLocation!.longitude
        }
    }
    
    func sendOrder() {
        removeEmptyOption()
        OrderRepository.sendOrder(order: self.order!) { response in
            switch(response) {
            case .success(let value):
                print(self.order)
                self.orderCode = value.result
                self.getOrderDetail(orderCode: value.result)
                self.isOrderSuccess = true
                break
            case .failure(let error) :
                print(self.order)
                print("sendOrder: \(error)")
                break
            }
        }
    }
 
    
    func removeEmptyOption() {
        if !(order?.orderList.isEmpty ?? false) {
            for index in 0..<(order?.orderList.count)! {
                order?.orderList[index].options.removeAll { option in
                    option.amount == 0
                }
            }
        }
    }
    
    func getOrderDetail(orderCode: String) {
        OrderRepository.getOrderDetail(orderCode: orderCode) { response in
            switch(response) {
            case .success(let value):
                self.orderDetail = value.result[0]
                break
            case .failure(let error) :
                print("getOrderDetail: \(error)")
                break
            }
        }
    }
}
