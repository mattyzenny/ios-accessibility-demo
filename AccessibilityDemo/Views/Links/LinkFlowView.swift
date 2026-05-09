//
//  LinkFlowView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct LinkFlowView: View {
    @Environment(GlobalFrameworkSettings.self) private var settings
    
    var body: some View {
        @Bindable var setting = settings
        
        VStack(spacing: 20) {
            FrameworkSelectorComponent()
            
            Form {
                switch setting.framework {
                case .swiftUI:
                    swiftUIGuidanceSection
                    LinkSwiftUI()
                    
                    
                case .uiKit:
                    uiKitGuidanceSection
                    LinkUIKit()
                    
                case .both:
                    genericGuidanceSection
                    LinkSwiftUI()
                    LinkUIKit()
                }
            }
            
        }
        .navigationTitle("Accessible Links")

    }
    
    
    private var genericGuidanceSection: some View {
        Section {
            Text(.init("""
            **Name:** Use a descriptive and visible label for links. An alternative label must be provided for icons only links. 
            """))
            
            Text(.init("""
            **Role:** Use a semantically appropraite Link, or for custom links provide the accessible trait of link.
            """))
            
            Text(.init("""
            **State:** Expose meaningful states like disabled.
            """))
            Text(.init("""
            **Behavior:** In native, links typically open a destination outside the current app context, such as a website, another app, or a system experience like the share sheet.
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
            **Name:** Native `Link` usually uses its label. Add `.accessibilityLabel(...)` only when needed.
            """))
            
            Text(.init("""
            **Role:** Native `Link` has a role of button and link. Use `.accessibilityRemoveTraits(.isButton)` for standalone links. For a custom link view, add `.accessibilityAddTraits(.isLink)`.
            """))
            
            Text(.init("""
            **State:** Use real state like `.disabled(true)`.
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
            **Name:** Native links typically use their visible text. Add `accessibilityLabel` only when needed.
            """))
            
            Text(.init("""
            **Role:** Native links already expose link semantics. Custom interactive views that behave like links need explicit accessibility configuration.
            """))
            
            Text(.init("""
            **State:** Use real control state so assistive technologies can announce it correctly.
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
        LinkFlowView()
    }
    .environment(GlobalFrameworkSettings())
}
