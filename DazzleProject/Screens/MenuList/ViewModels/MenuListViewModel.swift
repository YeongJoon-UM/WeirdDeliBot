//
//  MenuListViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation

class MenuListViewModel: ObservableObject {
    //TODO: topicList는 서버에서 API로 가져와야함.
    let topicList: [String] = ["Coffee", "Tea/Bottle", "Juice/Ade", "Smoothie/Frappuccino", "Bubble/Latte", "Bakery"]
}
