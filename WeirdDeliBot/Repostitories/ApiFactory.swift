//
//  ApiFactory.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/05.
//

import Foundation
import Alamofire

class ApiFactory {
    static let host: String = "https://delibot.kro.kr/"

    static func getApi<T: Encodable>(url: String, type: HTTPMethod, parameters: T = EmptyParameters()) -> DataRequest {
        var header: HTTPHeaders = []
        let token: String? = UserDefaults.standard.string(forKey: "token")

        if(token != nil) {
            header.add(name: "Authorization", value: "Bearer \(token ?? "")")
        }

        return AF.request("\(host)\(url)", method: type, parameters: parameters, encoder: JSONParameterEncoder.default, headers: header)
    }
}
