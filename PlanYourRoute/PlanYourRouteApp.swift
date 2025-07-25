//
//  PlanYourRouteApp.swift
//  PlanYourRoute
//
//  Created by Nadiia Padalka on 25.07.2025.
//

import SwiftUI

@main
struct PlanYourRouteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
