//
//  OrderListResponse.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/18.
//

import Foundation

struct OrderHistoryResponse: Codable {
    let result: [OrderHistory]
    let resultCode: Int
    let resultMsg: String
}

struct OrderHistory: Codable {
    let orderCode: String
    let storeCode: String
    let orderName, orderID: String
    let orderDate, address, addressDesc, phone, orderReq: String
    let writeName, writeID, writeDate: String
    let latitude, longitude: String
    let orderState: Int
    let orderLog: [OrderLog]
    let orderList: [OrderInfo]
    
    enum CodingKeys: String, CodingKey {
        case orderCode, storeCode
        case orderName = "orderNm"
        case orderID = "orderId"
        case orderDate, address, addressDesc, phone, orderReq
        case writeName = "writeNm"
        case writeID = "writeId"
        case writeDate
        case latitude, longitude
        case orderState, orderLog
        case orderList
    }
    
}

struct OrderInfo: Codable {
    let itemCode, itemName: String
    let optionList: [OrderInfo]
    let count, price: Int
}

struct OrderLog: Codable {
    let orderCode: String
    let prevState, newState: Int
    let updateDate, updateNm, updateID: String

    enum CodingKeys: String, CodingKey {
        case orderCode, prevState, newState, updateDate, updateNm
        case updateID = "updateId"
    }
}
