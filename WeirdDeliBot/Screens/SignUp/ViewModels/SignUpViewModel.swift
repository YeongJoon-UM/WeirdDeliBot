//
//  SignUpViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/25.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var user: User = User(account: "", password: "", name: "", phone: "", address: "충남 천안시 동남구 충절로 1600", addressDesc: "", latitude: "", longitude: "")
    @Published var password: String = ""
    @Published var checkPassword: String = ""
    @Published var location: DropdownMenuOption?
    @Published var verfityCode: String = ""
    @Published var token: Token? = nil
    @Published var isCodeVerified: Bool? = nil
    
    func isEmailValid() -> Bool {
        if user.account.regexMatches(emailRegex) {
            return true
        } else {
            return false
        }
    }


    func isPasswordEqual() -> Bool {
        if !password.isEmpty && password == checkPassword{
            return true
        } else {
            return false
        }
    }
    
    func isPhoneValid() -> Bool {
        if user.phone.regexMatches(phoneRegex) {
            return true
        } else {
            return false
        }
    }
    
    func isSignUpValid() -> Bool {
        if isPasswordEqual() && isEmailValid() && !user.name.isEmpty && location != nil && isPhoneValid(){
            return true
        }
        else {
            return false
            
        }
    }
    
    func isCodeValid() -> Bool {
        if verfityCode.regexMatches(codeRegex) {
            return true
        } else {
            return false
        }
    }
    
    func setInfo() {
        user.password = password
        user.addressDesc = location?.id ?? ""
        user.latitude = location?.latitude ?? ""
        user.longitude = location?.longitude ?? ""
    }
    
    func signUp() {
        UserRepository.signUp(user: user) { result in
            switch(result) {
            case .success(let value):
                print(value)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func sendCode() {
        UserRepository.sendCode(account: user.account, verifyCode: verfityCode) { result in
            switch(result) {
            case .success(let value):
                self.isCodeVerified = value.resultCode == 200 ? true : false
                
                print(value)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func codeFieldColor() -> Color {
        if let isVerified = isCodeVerified {
                return isVerified ? Color.basic : Color.myRed
            } else {
                return Color.myGray.opacity(0.5)
            }
    }
    
    func logIn() {
        UserRepository.logIn(account: user.account, password: user.password!) { result in
            switch(result) {
            case .success(let value):
                if value.token != "" {
                    self.token = value
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
