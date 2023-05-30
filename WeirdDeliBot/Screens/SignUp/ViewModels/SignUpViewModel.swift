//
//  SignUpViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/25.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var user: SignUpRequest = SignUpRequest(account: "", password: "", name: "", phone: "", address: "충남 천안시 동남구 충절로 1600", addressDesc: "", latitude: "", longitude: "")
    @Published var password: String = ""
    @Published var checkPassword: String = ""
    @Published var location: DropdownMenuOption?
    
    
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
    
    
    func setInfo() {
        user.password = password
        user.addressDesc = location?.option ?? ""
        user.latitude = location?.latitude ?? ""
        user.longitude = location?.longitude ?? ""
    }
    
    func resetInfo() {
        user = SignUpRequest(account: "", password: "", name: "", phone: "", address: "충남 천안시 동남구 충절로 1600", addressDesc: "", latitude: "", longitude: "")
        password = ""
        checkPassword = ""
        location = nil
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
    
}
