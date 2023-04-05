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
    @StateObject var viewModel : LocationViewModel = LocationViewModel()
    @Environment(\.presentationMode) var presentation
    
        var body: some View {
            Map(coordinateRegion: $region, annotationItems: viewModel.locations){ location in
                MapMarker(coordinate: location.locate)
            }
            .onAppear {
                if viewModel.locations .isEmpty {
                    viewModel.setLocationDazzle()
                }
                print(viewModel.locations)
            }
            .frame(maxHeight: 400)
            HStack(spacing: 0) {
                Button(action: viewModel.setLocation2Gong) {
                    Text("2공학관")
                }
                Button(action: viewModel.setLocationDamhun) {
                    Text("담헌실학관")
                }
                Button(action: viewModel.setLocationDomitory) {
                    Text("기숙사동")
                }
            }
            Spacer()
                .navigationBarTitle(Text("현재 위치"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{ ToolBarBackButton(presentation: presentation) }
                .navigationBarBackButtonHidden()
        }
}

struct Locate: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


