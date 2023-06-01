//
//  VerifyCodeViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/29.
//

import Foundation

class VerifyCodeViewModel: ObservableObject {
    @Published var user: SignUpRequest
    @Published var verfityCode: String = ""
    @Published var isCodeVerified: Bool? = nil
    
    init(user: SignUpRequest) {
        self.user = user
    }
    
    func resetInfo() {
        verfityCode = ""
        isCodeVerified = nil
    }
    
    func isCodeValid() -> Bool {
        if verfityCode.regexMatches(codeRegex) {
            return true
        } else {
            return false
        }
    }

    func signUp() {
        UserRepository.signUp(user: user) { result in
            switch(result) {
            case .success(let value):
                break
            case .failure(let error):
                print(self.user)
                print("signUp: \(error)")
                break
            }
        }
    }
    
    func sendCode() {
        UserRepository.sendCode(account: user.account, verifyCode: verfityCode) { result in
            switch(result) {
            case .success(let value):
                self.isCodeVerified = value.resultCode == 200 ? true : false
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    
    
}
