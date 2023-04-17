//
//  StoreRepository.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/03/20.
//

import Foundation
import Alamofire

class StoreRepository {
    static let storeCode: String = "STR-000000000001"
    
    static func getCatList(completion: @escaping (Result<CatResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "store/getCatList", type: .post, parameters: StoreCode(storeCode: storeCode))
                .responseDecodable(of: CatResponse.self) { response in
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
    
    static func getItemList(completion: @escaping (Result<MenuResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "store/getItemList", type: .post, parameters: StoreCode(storeCode: storeCode))
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
    static func getOptionList(itemCode: String, completion: @escaping (Result<OptionResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "store/getOptionList", type: .post, parameters: ItemCode(itemCode: itemCode))
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
    
    static func getItemInfo(itemCode: String, completion: @escaping (Result<MenuResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "store/getItemList", type: .post, parameters: ItemCode(itemCode: itemCode))
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
    
    static func getOptionInfo(optionCode: String, token: String, completion: @escaping (Result<OptionResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "user/getOptionList", type: .post, parameters: OptionCode(optionCode: optionCode))
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
