//
//  OrderHistoryViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/18.
//

import Foundation

class OrderHistoryViewModel: ObservableObject {
    let orderHistory: OrderHistory

    
    init(orderHistory: OrderHistory) {
        self.orderHistory = orderHistory
    }
    
    
    func getEstimatedTime() -> String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
        if let date = dateFormatter.date(from: orderHistory.orderDate) {
                let modifiedDate = Calendar.current.date(byAdding: .minute, value: 40, to: date)
                
                if let modifiedDate = modifiedDate {
                    return dateFormatter.string(from: modifiedDate)
                }
            }
            
            return ""
    }
    
    func getTimeDifference() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let estimatedTime = getEstimatedTime()

        guard let currentTime = Calendar.current.date(byAdding: .hour, value: 9, to: Date()),
              let estimatedTime = Calendar.current.date(byAdding: .hour, value: 9, to: dateFormatter.date(from: estimatedTime)!) else {
            return ""
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: currentTime, to: estimatedTime) //MARK: 남은 시간에서 현재 시간을 뺌
        
        guard let hour = components.hour, let minute = components.minute else {
            return ""
        }
        var timeDifference: String
        if hour < 0 || minute < 0 {
            timeDifference = "곧 도착"
        } else if hour > 0 {
            timeDifference = String(format: "%02d시간%02d분", hour, minute)
        } else {
            timeDifference = String(format: "%02d분", minute)
        }
        return timeDifference
    }
    
    
    func isStateStep(state: Int) -> Bool {
        return (orderHistory.orderState != -1 && orderHistory.orderState >= state)
    }
    
    func getStepTime(state: Int) -> String {
        if let log = orderHistory.orderLog.first(where: { $0.newState == state }) {
            return hourFormatter(log.updateDate)
        } else {
            return "-- : --"
        }
        
    }
    
    func getTotalPrice() -> Int {
        var totalPrice: Int = 0
        for index in 0..<orderHistory.orderList.count {
            var itemPrice: Int = 0
            itemPrice += orderHistory.orderList[index].price / orderHistory.orderList[index].count
            if !orderHistory.orderList[index].optionList.isEmpty {
                for index2 in 0..<orderHistory.orderList[index].optionList.count {
                    itemPrice += orderHistory.orderList[index].optionList[index2].price
                }
            }
            itemPrice *= orderHistory.orderList[index].count
            totalPrice += itemPrice
        }
        
        return totalPrice
    }
}
