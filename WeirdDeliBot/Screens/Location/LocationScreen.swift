//
//  LocationScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/24.
//

import SwiftUI
import MapKit

struct LocationScreen: View {
    @ObservedObject var viewModel : LocationViewModel = LocationViewModel()
    @EnvironmentObject var historyViewModel: OrderHistoryViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MapView(destination: CLLocationCoordinate2D(latitude: Double(historyViewModel.orderHistory.latitude) ?? 0, longitude: Double(historyViewModel.orderHistory.longitude) ?? 0), region: viewModel.region, lineCoordinates: viewModel.convertCoord(viewModel.coordinates))
                
            }
            OrderProgressView().environmentObject(historyViewModel)
        }
        .onAppear() {
            viewModel.getDestinLocation(latitude: Double(historyViewModel.orderHistory.latitude) ?? 0, longitude: Double(historyViewModel.orderHistory.longitude) ?? 0)
        }
        .customToolBar("Location", showCartButton: false, showInfoButton: false)
    }
}

struct MapView: UIViewRepresentable {
    let destination: CLLocationCoordinate2D
    let region: MKCoordinateRegion
    let lineCoordinates: [CLLocationCoordinate2D]
    
    // Create the MKMapView using UIKit.
    func makeUIView(context: Context) -> MKMapView {
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        let mapView = MKMapView()
        let annotation = MKPointAnnotation()
        mapView.delegate = context.coordinator
        mapView.region = region
        mapView.showsUserLocation = true
        
        annotation.title = "목적지"
        annotation.coordinate = destination
        //print(destination)
        mapView.addAnnotation(annotation)
        mapView.addOverlay(polyline)

        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {}
    
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
            renderer.strokeColor = UIColor(Color.basic)
            renderer.lineWidth = 6
            return renderer
        }
        return MKOverlayRenderer()
    }
}
