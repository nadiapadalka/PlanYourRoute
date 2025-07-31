//
//  PlanYourRouteApp.swift
//  PlanYourRoute
//
//  Created by Nadiia Padalka on 25.07.2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    //configurating firebase, database for saving all authentification data
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
            //adding environmental object(viewModel) to be accessible from anywhere in the app
              .environmentObject(viewModel)
      }
    }
  }
}
