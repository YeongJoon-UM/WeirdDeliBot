//
//  UserRepository.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation
import Alamofire

class UserRepository {
    static func logIn(account: String, password: String, completion: @escaping (Result<Token, AFError>) -> Void) {
        ApiFactory.getApi(url: "user/login", type: .post, parameters: LogInRequest(account: account, password: password))
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
    
    static func signUp(user: SignUpRequest, completion: @escaping (Result<StringResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "user/addUserList", type: .put, parameters: user)
                .responseDecodable(of: StringResponse.self) { response in
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
    
    static func sendCode(account: String, verifyCode: String, completion: @escaping (Result<StringResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "user/checkMailCode", type: .post, parameters: VerifyCodeRequest(userID: account, verifyCode: verifyCode))
                .responseDecodable(of: StringResponse.self) { response in
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
    
    static func getUserInfo(completion: @escaping (Result<UserResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "user/getUserInfo", type: .post)
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
    
    static func updateUserInfo(addressDesc: String, latitude: String, longitude: String, phone: String, completion: @escaping (Result<UserResponse, AFError>) -> Void) {
        ApiFactory.getApi(url: "user/updateUserInfo", type: .put, parameters: UpdateInfo(addressDesc: addressDesc, latitude: latitude, longitude: longitude, phone: phone))
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
