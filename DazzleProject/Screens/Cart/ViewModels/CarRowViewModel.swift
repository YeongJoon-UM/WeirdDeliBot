//
//  CarRowViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/03/26.
//

import Foundation
import Alamofire

class CartRowViewModel: ObservableObject {
    @Published var menuResponse: [Menu] = []
    @Published var option: [Option] = []
    @Published var status: Bool? = nil
    @Published var menu: Menu?
    @Published var isOptionShow: Bool = false
    
    func getItemInfo(itemCode: String, token: String) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        StoreRepository.getItemInfo(itemCode: itemCode, token: header) { response in
            switch(response) {
            case .success(let value):
                self.menuResponse = value.result
                if(self.status != false) { self.status = true }
                self.setItemInfo()
                break
            case .failure(let error) :
                print(error)
                self.status = false
                break
            }
        }
    }
    
    func getOptionInfo(itemCode: String, token: String) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        StoreRepository.getOptionList(itemCode: itemCode, token: header) { response in
            switch(response) {
            case .success(let value):
                self.option = value.result
                if(self.status != false) { self.status = true }
                //self.setOptionInfo()
                break
            case .failure(let error) :
                print(error)
                self.status = false
                break
            }
        }
    }
    
    func getOptionList(itemCode: String ,token: String) {
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)"]
        StoreRepository.getOptionList(itemCode: itemCode, token: header) { response in
            switch(response) {
            case .success(let value):
                self.option = value.result
                if(self.status != false) { self.status = true }
                break
            case .failure(let error) :
                print(error)
                self.status = false
                break
            }
        }
    }
    
    func setItemInfo() {
        self.menu = self.menuResponse[0]
    }
    
    func setOptionInfo() {
        //self.option.append(self.optionResponse[0])
    }
    
    func isOptionShowToggle() {
        self.isOptionShow.toggle()
    }
}
