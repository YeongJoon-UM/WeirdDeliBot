//
//  LocationScreen.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/10/24.
//

import SwiftUI
import MapKit

struct LocationScreen: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.7635507, longitude: 127.281751), span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
    @Environment(\.presentationMode) var presentation
    
        var body: some View {
            Map(coordinateRegion: $region)
                .frame(maxHeight: 400)
            Spacer()
                .navigationBarTitle(Text("현재 위치"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{ ToolBarBackButton(presentation: presentation) }
                .navigationBarBackButtonHidden()
        }
        
}

struct LocationScreen_Previews: PreviewProvider {
    static var previews: some View {
        LocationScreen()
    }
}
