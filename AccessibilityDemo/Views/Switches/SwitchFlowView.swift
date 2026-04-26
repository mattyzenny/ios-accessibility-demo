//
//  SwitchFlowView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct SwitchFlowView: View {
    @Environment(GlobalFrameworkSettings.self) private var settings

    var body: some View {
        @Bindable var setting = settings

        VStack(spacing: 20) {
            FrameworkSelectorComponent()

            Form {
                switch setting.framework {
                case .swiftUI:
                    swiftUIGuidanceSection
                    SwitchSwiftUI()

                case .uiKit:
                    uiKitGuidanceSection
                    SwitchUIKit()

                case .both:
                    genericGuidanceSection
                    SwitchSwiftUI()
                    SwitchUIKit()
                }
            }

        }
        .toolbar {
            ToolbarItem(placement: .title) {
                Text("Accessible Switches")
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
            **Role:** The role is automatically applied when using native elements.
            """))

            Text(.init("""
            **State:** Expose meaningful states like disabled, selected, or expanded.
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
            **Name:** Native `Toggle()` usually uses its label. Add `.accessibilityLabel(...)` only when needed.
            """))

            Text(.init("""
            **Role:** Native `Toggle()` already has switch semantics. For a custom toggle-like view, prefer a real `Toggle`; otherwise add the appropriate accessibility traits.
            """))

            Text(.init("""
            **State:** Use real binding state like `isOn` and let the system announce on/off. Only override the announcement when you need custom wording.
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
            **Name:** `UISwitch` requires an explicit label. Add `accessibilityLabel` that matches the visible label.
            """))

            Text(.init("""
            **Role:** `UISwitch` already has switch semantics. Custom interactive views need explicit accessibility configuration.
            """))

            Text(.init("""
            **State:** Use real control state such as `isOn = false` so assistive technologies can announce it correctly.
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
        SwitchFlowView()
    }
    .environment(GlobalFrameworkSettings())
}
