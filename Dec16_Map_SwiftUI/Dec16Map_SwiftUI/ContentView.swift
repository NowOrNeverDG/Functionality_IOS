//
//  ContentView.swift
//  Dec16Map_SwiftUI
//
//  Created by Ge Ding on 12/16/22.
//

import SwiftUI
import MapKit



struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.334803, longitude:  -122.008965), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    @State private var lineCoordinates = [
        CLLocationCoordinate2D(latitude: 37.330828, longitude: -122.007495),
        CLLocationCoordinate2D(latitude: 37.336083, longitude: -122.007356),
        CLLocationCoordinate2D(latitude: 37.336901, longitude: -122.012345)
      ];
    

    var body: some View {
        MapView(region: region, lineCoordinates: lineCoordinates)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
