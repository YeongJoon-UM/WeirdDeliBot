//
//  OrderRepository.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/23.
//

import Foundation
import Alamofire

class OrderRepository {
    static let storeCode: String = "STR-000000000001"
    
    static func sendOrder(order: Order, completion: @escaping (Result<OrderResponse, AFError>) -> Void) {
        //AF.request("\(url)/order/addOrderList", method: .put, parameters: order, encoder: .json(), headers: header)
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
    
    static func getOrderInfo(orderCode: String, completion: @escaping (Result<MenuResponse, AFError>) -> Void) {
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
}
