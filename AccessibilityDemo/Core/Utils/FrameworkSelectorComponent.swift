//
//  FrameworkSelectorComponent.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/23/26.
//
import SwiftUI

struct FrameworkSelectorComponent: View {
    
    // Access the shared GlobalFrameworkSettings instance from the environment.
    // Retrieves the setting injected at the App level.
    @Environment(GlobalFrameworkSettings.self) private var settings
    
    
    var body: some View {
        @Bindable var setting = settings

        VStack {
            Picker("Framework", selection: $setting.framework) {
                Text("SwiftUI").tag(FrameworkOption.swiftUI)
                Text("UIKit").tag(FrameworkOption.uiKit)
                Text("Both").tag(FrameworkOption.both)
            }
            .accessibilityLabel("Select a Framework")
            .pickerStyle(.segmented)
        }
        .padding()
    }
}
#Preview {
    FrameworkSelectorComponent()
        .environment(GlobalFrameworkSettings())
}
