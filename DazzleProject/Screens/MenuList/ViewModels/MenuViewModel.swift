//
//  MenuViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation
import Alamofire

class MenuViewModel: ObservableObject {
    @Published var menu: [Menu]? = []
    @Published var category: [Category]? = []
    
    func getCatList(token: String) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        StoreRepository.getCatList(token: header) { response in
            switch(response) {
            case .success(let value):
                self.category = value.result
                print(value)
                break
            case .failure(let error) :
                print(error)
                break
            }
        }
    }
    
    func getItemList(token: String) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        StoreRepository.getItemList(token: header) { response in
            switch(response) {
            case .success(let value):
                self.menu = value.result
                print(value)
                break
            case .failure(let error) :
                print(error)
                break
            }
        }
    }
}
