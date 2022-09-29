//
//  ContentView.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/09/29.
//

import SwiftUI

struct RootScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen()
    }
}
