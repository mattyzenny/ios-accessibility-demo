//
//  ButtonFlowView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/23/26.
//

import SwiftUI

struct ButtonFlowView: View {
    @Environment(GlobalFrameworkSettings.self) private var settings
    
    var body: some View {
        @Bindable var setting = settings
        
        VStack(spacing: 20) {
            FrameworkSelectorComponent()
            
            Form {
                switch setting.framework {
                case .swiftUI:
                    swiftUIGuidanceSection
                    ButtonSwiftUI()
                    
                    
                case .uiKit:
                    uiKitGuidanceSection
                    ButtonUIKit()
                    
                case .both:
                    genericGuidanceSection
                    ButtonSwiftUI()
                    ButtonUIKit()
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .title) {
                Text("Accessible Buttons")
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityHeading(.h1)
            }
        }
    }
    
    
    private var genericGuidanceSection: some View {
        Section {
            Text(.init("""
            **Name:** Use a concise spoken label that matches the action.
            """))
            
            Text(.init("""
            **Role:** Expose the control as a button when it behaves like one.
            """))
            
            Text(.init("""
            **State:** Expose meaningful states like disabled, selected, or expanded.
            """))
            
            Text(.init("""
            **Behavior:** In native, buttons typically trigger an in-app action, such as submitting, toggling, confirming, or moving to another screen.
            """))
        } header: {
            Text("Generic Guidelines")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .frame(maxWidth: .infinity)
        }
    }
        
    private var swiftUIGuidanceSection: some View {
        Section {
            Text(.init("""
            **Name:** Native `Button()` usually uses its label. Add `.accessibilityLabel(...)` only when needed.
            """))
            
            Text(.init("""
            **Role:** Native `Button()` already has button semantics. For a custom tappable view, prefer a real `Button`; otherwise add `.accessibilityAddTraits(.isButton)`.
            """))
            
            Text(.init("""
            **State:** Use real state like `.disabled(true)`. If a fully custom control still does not expose state clearly, add extra accessibility state information as needed.
            """))
        } header: {
            Text("SwiftUI Guidance")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .frame(maxWidth: .infinity)
        }
    }
    
    private var uiKitGuidanceSection: some View {
        Section {
            Text(.init("""
            **Name:** `UIButton` usually uses its title. Add `accessibilityLabel` only when needed.
            """))
            
            Text(.init("""
            **Role:** `UIButton` already has button semantics. Custom interactive views need explicit accessibility configuration.
            """))
            
            Text(.init("""
            **State:** Use real control state such as `isEnabled = false` so assistive technologies can announce it correctly.
            """))
        } header: {
            Text("UIKit Guidance")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    NavigationStack {
        ButtonFlowView()
    }
    .environment(GlobalFrameworkSettings())
}
