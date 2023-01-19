//
//  MapView.swift
//  Dec16Map_SwiftUI
//
//  Created by Ge Ding on 12/16/22.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    
    let region: MKCoordinateRegion
    let lineCoordinates: [CLLocationCoordinate2D]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.region = region
        
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        mapView.addOverlay(polyline)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView
    
    init(parent: MapView) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routerPolyLine = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routerPolyLine)
            renderer.strokeColor = UIColor.systemBlue
            renderer.lineWidth = 0
            return renderer
        }
        return MKOverlayRenderer()
    }
}
