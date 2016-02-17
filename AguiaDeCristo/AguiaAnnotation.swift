//
//  AguiaAnnotation.swift
//  AguiaDeCristo
//
//  Created by Thiago Tosetti Lopes on 10/02/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit
import MapKit

class AguiaAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(
        coordinate: CLLocationCoordinate2D,
        title: String? = nil,
        subtitle: String? = nil
        ) {
            self.coordinate = coordinate
            self.title = title
            self.subtitle = subtitle
    }
    
    func annotationView() -> MKAnnotationView {
        let view = MKAnnotationView(annotation: self, reuseIdentifier: "AguiaAnnotation")
        view.image = UIImage(named: "AguiaPin")
        
        // ajustar offset do pino e imagem
        
        return view
        
    }
}
