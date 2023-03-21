//
//  RootViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation
import SwiftUI
import Combine

class RootViewModel: ObservableObject {
    @Published var user: User = User()          // 유저 정보
    @Published var token: Token? = nil           // 토큰

    
    init() {
        loadToken()
    }
    
    // 토큰 받아오기
    func setToken(token: Token, isSave: Bool) {
        self.token = token
        if(isSave) {
            UserDefaults.standard.set(token.token, forKey: "token")
            print(self.token)
        }
    }
    
    // 토큰 불러오기
    func loadToken() {
        let token = UserDefaults.standard.string(forKey: "token")
        if(token != nil) {
            self.token = Token(token: token!)
            print(self.token)
        }
    }

    
    // 유저 정보 불러오기
    func loadUser() {
        
    }
    
    func logOut() {
        self.token = nil
        UserDefaults.standard.removeObject(forKey: "token")
    }
    

}

struct User {
    
}
