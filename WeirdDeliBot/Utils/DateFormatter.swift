//
//  DateFormatter.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/18.
//

import Foundation

func dotDateFormatter(_ date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.date(from: date)
    
    let dotDateFormatter = DateFormatter()
    dotDateFormatter.dateFormat = "yyyy. MM. dd  HH:mm"
    return date.map { dotDateFormatter.string(from: $0) } ?? ""
    
}

func slashDateFormatter(_ date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.date(from: date)
    
    let dotDateFormatter = DateFormatter()
    dotDateFormatter.dateFormat = "yyyy / MM / dd  HH : mm"
    return date.map { dotDateFormatter.string(from: $0) } ?? ""
    
}

func hourFormatter(_ date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.date(from: date)
    
    let dotDateFormatter = DateFormatter()
    dotDateFormatter.dateFormat = "HH : mm"
    return date.map { dotDateFormatter.string(from: $0) } ?? ""
    
}
