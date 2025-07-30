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
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            }
            else {
                LoginView()
            }
        }
    }
}
#Preview {
    ContentView()
}
 
