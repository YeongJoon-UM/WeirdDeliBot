//
//  LogInViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation
import UIKit


class LogInViewModel: NSObject, ObservableObject {
    @Published var account: String = ""
    @Published var password: String = ""
    @Published var isAutoLogIn: Bool = false
    @Published var isLogInFailed: Bool = false
    @Published var token: Token? = nil
    
    //account와 password가 비어있는지 확인.
    var isInfoNotEmpty: Bool {
        !account.isEmpty && !password.isEmpty
    }
    
    func logIn() {
        if(isInfoNotEmpty) {
            UserRepository.logIn(account: account, password: password) { result in
                switch(result) {
                case .success(let value):
                    if value.token != "" {
                        self.token = value
                        self.isLogInFailed = false
                    } else {
                        self.isLogInFailed = true
                    }
                    break
                case .failure(let error):
                    self.isLogInFailed = true
                    print(error)
                    break
                }
            }
        } else {
            // TODO: 모두 입력되지 않을 경우 에러 표시
        }
    }

}

