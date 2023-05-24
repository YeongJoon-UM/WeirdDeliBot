//
//  LocationViewModel.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/22.
//

import Foundation
import CoreLocation

class LocationViewModel: ObservableObject {
    @Published var route: [CLLocationCoordinate2D] = []
    @Published var nowPosition: [CLLocationCoordinate2D] = []
    
    func getOrderRoute() {
        OrderRepository.getOrderRoute { response in
            switch(response) {
            case .success(let value):
                self.saveRoute(orderRoute: value.result)
                
                break
            case .failure(let error) :
                print(error)
                break
            }
        }
    }
    
    func saveRoute(orderRoute: OrderRoute) {
        if orderRoute.route != nil {
            self.route = (orderRoute.route?.map { CLLocationCoordinate2D(latitude: Double($0.latitude) ?? 0.0, longitude: Double($0.longitude) ?? 0.0) })!
        }
        if orderRoute.nowPosition != nil {
            self.nowPosition = (orderRoute.nowPosition?.map { CLLocationCoordinate2D(latitude: Double($0.latitude) ?? 0.0, longitude: Double($0.longitude) ?? 0.0) })!
        }
        
    }
}
