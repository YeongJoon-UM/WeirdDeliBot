//
//  LocationResponse.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/22.
//

import Foundation

struct LocationResponse: Codable {
    var result: OrderRoute
    var resultCode: Int
    var resultMsg: String
}


struct OrderRoute: Codable {
    var orderCode, startLatitude, startLongitude, address: String
    var goalLatitude, goalLongitude: String
    var route, nowPosition: [Position]?
}


struct Position: Codable {
    var robotCode: String?
    var longitude, latitude: String
    var writeDate: String?
}

