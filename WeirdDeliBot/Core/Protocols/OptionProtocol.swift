//
//  OptionProtocol.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/04/14.
//

import Foundation

protocol OptionProtocol: ObservableObject {

    func addItemAmount()
    func subItemAmount()
    func getItemAmount() -> Int
    func isOptionSelected(option: Option) -> Bool
    func addOptionAmount(option: Option)
    func subOptionAmount(option: Option)
    func totalPrice() -> Int
}
