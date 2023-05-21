//
//  LocationViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2022/11/01.
//

import Foundation
import CoreLocation
import MapKit

class LocationViewModel: NSObject ,ObservableObject {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.7635507, longitude: 127.281751),
        span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
    )
    let locationDazzle = Location(id: UUID(), name: "Dazzle", locate: CLLocationCoordinate2D(latitude: 36.7632, longitude: 127.2812))
    var destination = Location(id: UUID(), name: "목적지", locate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
    private let locationManager = CLLocationManager()
        
    @Published var userLocation: Location = Location(id: UUID(), name: "내 위치", locate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        
        override init() {
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    
    var coordinates = [[127.281351, 36.763353],[127.281184, 36.763492], [ 127.280887, 36.76374 ], [ 127.281166, 36.763964 ], [ 127.281637, 36.764344 ], [ 127.281862, 36.764528 ], [ 127.281984, 36.764594 ], [ 127.282084, 36.764666 ], [ 127.282159, 36.764722 ], [ 127.282625, 36.765073 ], [ 127.282373, 36.765279 ], [ 127.281819, 36.765719 ], [ 127.281701, 36.765812 ], [ 127.28153, 36.765949 ], [ 127.281363, 36.766082 ], [ 127.281539, 36.766218 ], [ 127.28158, 36.766249 ]]
    
    func convertCoord(_ coordinates: [[Double]]) -> [CLLocationCoordinate2D] {
        return coordinates.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]) }
    }
    

    
    
    
    func getBotLocation() {
        //TODO: get BOT GPS API
    }
    
    func getDestinLocation(latitude: Double, longitude: Double) {
        region.center.latitude = latitude
        region.center.longitude = longitude
        destination.locate.latitude = latitude
        destination.locate.longitude = longitude
    }
    

}


extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation.locate = location.coordinate
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
