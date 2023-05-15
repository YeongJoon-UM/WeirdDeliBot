//
//  OptionProtocol.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/14.
//

import Foundation

protocol OptionProtocol: ObservableObject {
    //var isOptionSelected: Bool { get set }
    //var option: [Option]? { get set }
    //var status: Bool? { get set }
    //var selectedMenu: Menu? { get set }
    //var userOptionList: [OrderItemOption] { get set }
    //var userMenu: OrderItem? { get set }

    //func getSelectedMenu(menu: Menu)
    //func getOptionList()
    //func getUserOptionList()
    //func getUserMenu()
    //func setUserOption()
    func addItemAmount()
    func subItemAmount()
    func isOptionSelected(option: Option) -> Bool
    func addOptionAmount(option: Option)
    func subOptionAmount(option: Option)
    func totalPrice() -> Int
}
