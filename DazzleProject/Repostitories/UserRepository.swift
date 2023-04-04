//
//  UserRepository.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation
import Alamofire

class UserRepository {
    static let url: String = "https://delibot.kro.kr"
    static func logIn(account: String, password: String, completion: @escaping (Result<Token, AFError>) -> Void) {
        AF.request("\(url)/user/login", method: .post, parameters: LogInRequest(account: account, password: password), encoder: .json())
                .responseDecodable(of: Token.self) { response in
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
    
    static func getUserInfo(token: String, completion: @escaping (Result<UserResponse, AFError>) -> Void) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        AF.request("\(url)/user/getUserInfo", method: .post, headers: header)
                .responseDecodable(of: UserResponse.self) { response in
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
