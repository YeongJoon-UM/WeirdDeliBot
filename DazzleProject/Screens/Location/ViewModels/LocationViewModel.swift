//
//  LocationViewModel.swift
//  DazzleProject
//
//  Created by 정영준 on 2022/11/01.
//

import Foundation
import CoreLocation

class LocationViewModel: ObservableObject {
    let locationDazzle = UserLocation(id: UUID(), name: "Dazzle", locate: CLLocationCoordinate2D(latitude: 36.7632, longitude: 127.2812))
    let location2Gong = UserLocation(id: UUID(), name: "2공학관", locate: CLLocationCoordinate2D(latitude: 36.7666, longitude: 127.2819))
    let locationDamhun = UserLocation(id: UUID(), name: "담헌실학관", locate: CLLocationCoordinate2D(latitude: 36.7659, longitude: 127.2825))
    let locationDomitory = UserLocation(id: UUID(), name: "기숙사동", locate: CLLocationCoordinate2D(latitude: 36.7618, longitude: 127.2835))
    let locationBot = UserLocation(id: UUID(), name: "BOT", locate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
    
    var locations = [UserLocation]()
    
    func setLocationDazzle() {
        locations.append(locationDazzle)
    }
    
    func setLocation2Gong() {
        locations[0] = location2Gong
        print(locations)

    }
    
    func setLocationDamhun() {
        locations[0] = locationDamhun
        print(locations)

    }
    
    func setLocationDomitory() {
        locations[0] = locationDomitory
        print(locations)
    }
    
    func getBotLocation() {
        //TODO: get BOT GPS API
    }
    
    func setBotLocation() {
        if locations.count < 2 {
            locations.append(locationBot)
        } else {
            locations[1] = locationBot
        }
    }
}
