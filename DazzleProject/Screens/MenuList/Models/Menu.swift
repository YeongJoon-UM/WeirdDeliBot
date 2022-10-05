//
//  Menu.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation

struct RepoResponse: Codable {
    let Menus: [Menu]
}

struct Menu: Identifiable, Codable, Hashable {
    var id: Int
    var image: String
    var name: String
    var price: Int
    var desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, image, price, id, desc
    }
}

struct Menus {
    var menu: [Menu]
}
