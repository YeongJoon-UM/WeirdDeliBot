//
//  OrderRepository.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/23.
//

import Foundation
import Alamofire

class OrderRepository {
    static let url: String = "https://delibot.kro.kr"
    static let storeCode: String = "STR-000000000001"
    
    static func sendOrder(order: Order, token: String, completion: @escaping (Result<OrderResponse, AFError>) -> Void) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        AF.request("\(url)/order/addOrderList", method: .put, parameters: order, encoder: .json(), headers: header)
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
    
    static func getOrderInfo(orderCode: String, token: HTTPHeaders, completion: @escaping (Result<MenuResponse, AFError>) -> Void) {
        AF.request("\(url)/store/getItemList", method: .post, parameters: StoreCode(storeCode: storeCode), encoder: .json(), headers: token)
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
    static func getOrderItem(itemCode: String, token:HTTPHeaders, completion: @escaping (Result<OptionResponse, AFError>) -> Void) {
        AF.request("\(url)/store/getOptionList", method: .post, parameters: ItemCode(itemCode: itemCode), encoder: .json(), headers: token)
                .responseDecodable(of: OptionResponse.self) { response in
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
