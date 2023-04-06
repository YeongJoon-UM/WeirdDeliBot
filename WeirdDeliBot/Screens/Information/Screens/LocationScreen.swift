//
//  LocationScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/24.
//

import SwiftUI
import MapKit

struct LocationScreen: View {
    @StateObject var viewModel : LocationViewModel = LocationViewModel()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(spacing: 0) {
            MapView(start: viewModel.locationDazzle.locate, region: viewModel.region, lineCoordinates: viewModel.convertCoord(viewModel.coordinates))
            
        }
            .navigationBarTitle(Text("Location"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{ ToolBarBackButton(presentation: presentation) }
            .navigationBarBackButtonHidden()
    }
}

struct MapView: UIViewRepresentable {
    let start: CLLocationCoordinate2D
    let region: MKCoordinateRegion
    let lineCoordinates: [CLLocationCoordinate2D]
    
    // Create the MKMapView using UIKit.
    func makeUIView(context: Context) -> MKMapView {
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        let mapView = MKMapView()
        let annotation = MKPointAnnotation()
        mapView.delegate = context.coordinator
        mapView.region = region
        
        annotation.title = "Dazzle"
        annotation.coordinate = start
        mapView.addAnnotation(annotation)
        mapView.addOverlay(polyline)

        return mapView
    }
    
    // We don't need to worry about this as the view will never be updated.
    func updateUIView(_ view: MKMapView, context: Context) {}
    
    // Link it to the coordinator which is defined below.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView
    
    init(_ parent: MapView) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = UIColor(Color.main)
            renderer.lineWidth = 6
            return renderer
        }
        return MKOverlayRenderer()
    }
}
