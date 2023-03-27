//
//  StoreRepository.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/20.
//

import Foundation
import Alamofire

class StoreRepository {
    static let url: String = "https://delibot.kro.kr"
    static let storeCode: String = "STR-000000000001"
    
    static func getCatList(token: HTTPHeaders, completion: @escaping (Result<CatResponse, AFError>) -> Void) {
        AF.request("\(url)/store/getCatList", method: .post, parameters: StoreCode(storeCode: storeCode), encoder: .json(), headers: token)
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
    
    static func getItemList(token: HTTPHeaders, completion: @escaping (Result<MenuResponse, AFError>) -> Void) {
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
    static func getOptionList(itemCode: String, token:HTTPHeaders, completion: @escaping (Result<OptionResponse, AFError>) -> Void) {
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
    
    static func getItemInfo(itemCode: String, token:HTTPHeaders, completion: @escaping (Result<MenuResponse, AFError>) -> Void) {
        AF.request("\(url)/store/getItemList", method: .post, parameters: ItemCode(itemCode: itemCode), encoder: .json(), headers: token)
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
    
    static func getOptionInfo(optionCode: String, token:HTTPHeaders, completion: @escaping (Result<OptionResponse, AFError>) -> Void) {
        AF.request("\(url)/store/getOptionList", method: .post, parameters: OptionCode(optionCode: optionCode), encoder: .json(), headers: token)
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
