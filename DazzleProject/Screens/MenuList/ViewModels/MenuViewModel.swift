//
//  MenuViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/05.
//

import Foundation

class MenuViewModel: ObservableObject {
    let coffee : [Menu] = [
        Menu(id: 1, image: "sample", name: "Americano", price: 3000, desc: "This is Americano"),
        Menu(id: 2, image: "sample", name: "Cafe Latte", price: 4500, desc: "This is Cafe Latte"),
        Menu(id: 3, image: "sample", name: "Caramel Macchiato", price: 4500, desc: "This is Caramel Macchiato")]
}
