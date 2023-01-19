//
//  ViewController.swift
//  Dec16Map
//
//  Created by Ge Ding on 12/16/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var myInitLacation = CLLocationCoordinate2D(latitude: 37.330828, longitude: -122.007495)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: myInitLacation, span:span)
        mapView.setRegion(region, animated: true)
        
        createPolyline()
    }
}

extension ViewController: MKMapViewDelegate {
    func createPolyline() {
        let locations = [
            CLLocationCoordinate2D(latitude: 37.330828, longitude: -122.007495),
            CLLocationCoordinate2D(latitude: 37.336083, longitude: -122.007356),
            CLLocationCoordinate2D(latitude: 37.336901, longitude: -122.012345)
        ]
        
        let aPolyline = MKPolyline(coordinates: locations, count: locations.count)
        mapView.addOverlay(aPolyline)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let polyLineRender = MKPolylineRenderer(overlay: overlay)
            polyLineRender.strokeColor = UIColor.red.withAlphaComponent(0.5)
            polyLineRender.lineWidth = 5
            return polyLineRender
        }
        return MKOverlayRenderer()
    }
}
