//
//  Location.swift
//  DazzleProject
//
//  Created by 정영준 on 2023/04/05.
//

import Foundation

import Foundation
import CoreLocation

struct Location: Identifiable {
    var id: UUID
    var name: String
    var locate: CLLocationCoordinate2D
}
