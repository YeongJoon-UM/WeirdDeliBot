//
//  OrderRepository.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/03/23.
//

import SwiftUI
import Alamofire

class OrderRepository {
    static let storeCode: String = "STR-000000000001"
    
    static func sendOrder(order: Order, completion: @escaping (Result<OrderResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "order/addOrderList", type: .put, parameters: order)
                .responseDecodable(of: OrderResponse.self) { response in
                    switch (response.result) {
                    case .success(let value):
                        completion(.success(value))
                        break
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    }
                }
    }
    
    static func getOrderHistory(account: String, completion: @escaping (Result<OrderHistoryResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "order/getOrderList", type: .post, parameters: Account(account: account))
                .responseDecodable(of: OrderHistoryResponse.self) { response in
                    switch (response.result) {
                    case .success(let value):
                        completion(.success(value))
                        break
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    }
                }
    }
    
    static func getOrderDetail(orderCode: String, completion: @escaping (Result<OrderHistoryResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "order/getOrderList", type: .post, parameters: OrderCode(orderCode: orderCode))
                .responseDecodable(of: OrderHistoryResponse.self) { response in
                    switch (response.result) {
                    case .success(let value):
                        completion(.success(value))
                        break
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    }
                }
    }
    
    static func getOrderItem(itemCode: String, completion: @escaping (Result<MenuResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "store/getItemList", type: .put, parameters: StoreCode(storeCode: storeCode))
                .responseDecodable(of: MenuResponse.self) { response in
                    switch (response.result) {
                    case .success(let value):
                        completion(.success(value))
                        break
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    }
                }
    }
    
    static func cancelOrder(orderCode: String, completion: @escaping (Result<OrderResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "order/updateOrderState", type: .put, parameters: OrderState(orderCode: orderCode, orderState: "-1"))
                .responseDecodable(of: OrderResponse.self) { response in
                    switch (response.result) {
                    case .success(let value):
                        completion(.success(value))
                        break
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    }
                }
    }
    
    static func getOrderRoute(orderCode: String = "ORD-000000000001", completion: @escaping (Result<LocationResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "order/getNowPosition", type: .post, parameters: OrderCode(orderCode: orderCode))
                .responseDecodable(of: LocationResponse.self) { response in
                    switch (response.result) {
                    case .success(let value):
                        completion(.success(value))
                        break
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    }
                }
    }
}
