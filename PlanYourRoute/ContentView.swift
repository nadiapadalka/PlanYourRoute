//
//  ContentView.swift
//  PlanYourRoute
//
//  Created by Nadiia Padalka on 25.07.2025.
//

import SwiftUI
import MapKit
import CoreData

struct ContentView: View {
    let locationManager = CLLocationManager()
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback:.automatic)
    var body: some View {
        Map(position: $cameraPosition){
            UserAnnotation()
        }
        .mapControls{
            MapUserLocationButton()}
        .onAppear(){
            locationManager.requestWhenInUseAuthorization()
        }
    }
}
#Preview {
    ContentView()
}
 
