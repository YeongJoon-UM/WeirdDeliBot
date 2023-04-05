//
//  RootViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/02/16.
//

import Foundation
import SwiftUI
import Combine
import Alamofire

class RootViewModel: ObservableObject {
    //@Published var user: User = User()          // 유저 정보
    @Published var token: Token? = nil           // 토큰
    @Published var user: User?
    
    init() {
        //loadToken()
    }
    
    // 토큰 받아오기
    func setToken(token: Token, isSave: Bool) {
        self.token = token
        UserDefaults.standard.set(token.token, forKey: "token")
        loadUser()
        print(token)
        
        /*
        if(isSave) {
            UserDefaults.standard.set(token.token, forKey: "token")
            
        }
         */
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
        UserRepository.getUserInfo() { result in
            switch(result) {
            case .success(let value):
                self.user = value.result
                //print(value)
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func logOut() {
        self.token = nil
        UserDefaults.standard.removeObject(forKey: "token")
    }
    
    //TODO: getInfo root에 반환값 함수 만들기
}

