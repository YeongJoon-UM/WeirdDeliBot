//
//  LocationScreen.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/10/24.
//

import SwiftUI
import MapKit

struct LocationScreen: View {
    @StateObject var viewModel: LocationViewModel = LocationViewModel()
    @EnvironmentObject var historyViewModel: OrderHistoryViewModel
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack {
            if viewModel.route.isEmpty {
                ProgressView()
                    .task {
                        self.viewModel.getOrderRoute()
                    }
            } else {
                VStack(spacing: 0) {
                    MapView(route: viewModel.route, nowPosition: viewModel.nowPosition)
                    
                }
            }
            OrderProgressView().environmentObject(historyViewModel)
        }
        .customToolBar("Location", showCartButton: false, showInfoButton: false)
    }
}

struct MapView: UIViewRepresentable {

    let route: [CLLocationCoordinate2D]
    let nowPosition: [CLLocationCoordinate2D]
    private let mapZoomEdgeInsets = UIEdgeInsets(top: 30.0, left: 30.0, bottom: 30.0, right: 30.0)
    // Create the MKMapView using UIKit.
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        if !route.isEmpty {
            let destination = CustomAnnotation(image: "Destination", coordinate: route[route.endIndex - 1])
            mapView.addAnnotation(destination)
        }
        if !nowPosition.isEmpty {
            let nowLocation = CustomAnnotation(image: "Logo", coordinate: nowPosition[nowPosition.endIndex - 1])
            mapView.addAnnotation(nowLocation)
            mapView.region = MKCoordinateRegion(
                center: nowPosition[nowPosition.endIndex - 1],
                span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
            )
        } else {
            mapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.7663, longitude: 127.2816),
                                                span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))
        }
        
        mapView.delegate = context.coordinator
        
        mapView.showsUserLocation = true
        
        
       

        let routeLine = MKPolyline(coordinates: route, count: route.count)
        routeLine.color = UIColor(Color.basic)
        mapView.addOverlay(routeLine)
        
        let nowPositionLine = MKPolyline(coordinates: nowPosition, count: nowPosition.count)
        nowPositionLine.color = UIColor(Color.gray)
        mapView.addOverlay(nowPositionLine)

        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        //updateOverlays(from: view)
    }
    
    private func updateOverlays(from mapView: MKMapView) {

        mapView.removeOverlays(mapView.overlays)
        let routeLine = MKPolyline(coordinates: route, count: route.count)
        routeLine.color = UIColor(Color.basic)
        mapView.addOverlay(routeLine)
        
        let nowPositionLine = MKPolyline(coordinates: nowPosition, count: nowPosition.count)
        nowPositionLine.color = UIColor(Color.myGray)
        mapView.addOverlay(nowPositionLine)
        setMapZoomArea(map: mapView, polyline: routeLine, edgeInsets: mapZoomEdgeInsets, animated: true)
        
    }
    
    private func setMapZoomArea(map: MKMapView, polyline: MKPolyline, edgeInsets: UIEdgeInsets, animated: Bool = false) {
        map.setVisibleMapRect(polyline.boundingMapRect, edgePadding: edgeInsets, animated: animated)
    }
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
        
        if let overlay_ = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = overlay_.color
            renderer.lineWidth = 6
            return renderer
        }
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? CustomAnnotation else {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: CustomAnnotationView.identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: CustomAnnotationView.identifier)
            annotationView?.canShowCallout = false
            annotationView?.contentMode = .scaleAspectFit
            
        } else {
            annotationView?.annotation = annotation
        }
        
        let pinImage: UIImage
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContext(size)
        
        pinImage = UIImage(named: annotation.image ?? "")!
        pinImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        annotationView?.image = resizedImage
        
        return annotationView
    }
}

extension MKPolyline {
    struct ColorHolder {
        static var _color: UIColor?
    }
    var color: UIColor? {
        get {
            return ColorHolder._color
        }
        set(newValue) {
            ColorHolder._color = newValue
        }
    }
}
