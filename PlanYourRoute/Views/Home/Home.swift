//
//  Untitled.swift
//  PlanYourRoute
//
//  Created by Nadiia Padalka on 29.07.2025.
//

import SwiftUI
import MapKit

struct HomeView: View {
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

 
