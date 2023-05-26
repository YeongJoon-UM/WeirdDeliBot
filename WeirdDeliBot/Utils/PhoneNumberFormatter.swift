//
//  PhoneNumberFormatter.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/16.
//

import SwiftUI

struct PhoneNumberFormatter: View {
    @Binding var text: String
    
    init(placeholder: String, text: Binding<String>) {
        _text = text
    }
    
    var body: some View {
        let formattedText = Binding<String>(get: {
            self.formatPhoneNumber(self.text)
        },
        set: {
            self.text = $0
        })
        TextField("", text: formattedText)
            .keyboardType(.phonePad)
            .accentColor(.myBlack)
    }
    
    private func formatPhoneNumber(_ text: String) -> String {
        let cleanedText = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var formattedText = ""
        var index = cleanedText.startIndex
        let phoneNumberLength = min(cleanedText.count, 11)
        
        for i in 0..<phoneNumberLength {
            if i == 3 || i == 7 { 
                formattedText += "-"
            }
            formattedText += String(cleanedText[index])
            
            index = cleanedText.index(after: index)
        }

        return formattedText
    }
}
