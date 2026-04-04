//
//  AccessibilityDemoApp.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/20/26.
//

import SwiftUI

@main
struct AccessibilityDemoApp: App {

// Create a single shared instance of our global state (FrameworkSetting).
// Creates global object for all child views

   private let settings = GlobalFrameworkSettings()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                IntroView()
            }
            .environment(settings)
        }
    }
}
#Preview {
    NavigationStack {
        IntroView()
    }
    .environment(GlobalFrameworkSettings())
}
