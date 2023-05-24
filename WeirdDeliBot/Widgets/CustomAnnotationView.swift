//
//  CustomAnnotationView.swift
//  WeirdDeliBot
//
//  Created by 정영준 on 2023/05/24.
//

import Foundation
import MapKit

class CustomAnnotationView: MKAnnotationView {
    
    static let identifier = "CustomAnnotationView"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?){
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        centerOffset = CGPoint(x: 0, y: 0)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
    }
    
}


class CustomAnnotation: NSObject, MKAnnotation {
    let image: String?
    let coordinate: CLLocationCoordinate2D
    
    init(
        image: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.image = image
        self.coordinate = coordinate
        
        super.init()
    }
    
}
