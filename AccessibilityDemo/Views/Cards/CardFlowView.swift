//
//  CardContainerFlowView.swift
//  AccessibilityDemo
//
//  Created by OpenAI on 2026-05-04.
//

import SwiftUI

struct CardContainerFlowView: View {
    @Environment(GlobalFrameworkSettings.self) private var settings

    var body: some View {
        @Bindable var setting = settings

        VStack(spacing: 20) {
            FrameworkSelectorComponent()

            Form {
                switch setting.framework {
                case .swiftUI:
                    swiftUIGuidanceSection
                    CardSwiftUI()

                case .uiKit:
                    uiKitGuidanceSection
                    CardUIKit()

                case .both:
                    genericGuidanceSection
                    CardSwiftUI()
                    CardUIKit()
                }
            }
        }
        .navigationTitle("Accessible Cards")
    }

    private var genericGuidanceSection: some View {
        Section {
            Text(.init("""
            **Grouping:** Decide whether the card should be announced as one summary or as separate elements based on what helps the user most.
            """))

            Text(.init("""
            **Order:** Make sure reading order follows the visual hierarchy and the most important information comes first.
            """))

            Text(.init("""
            **Interactivity:** If the entire card is tappable, expose a single clear action instead of many competing accessibility stops.
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
            **Grouping:** Use `.accessibilityElement(children: .combine)` when the card should read as one component.
            """))

            Text(.init("""
            **Labels:** Add a custom `.accessibilityLabel(...)` only when combining children does not produce a good announcement.
            """))

            Text(.init("""
            **Actions:** Prefer wrapping tappable cards in `Button` or `NavigationLink` so role and activation behavior stay native.
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
            **Grouping:** Use container views like `UIStackView` to organize content, then decide whether the container or its children should be accessible.
            """))

            Text(.init("""
            **Labels:** For a single announced card, set `isAccessibilityElement = true` on the container and provide a combined `accessibilityLabel`.
            """))

            Text(.init("""
            **Actions:** If the card is interactive, use a control or add the correct traits and activation handling explicitly.
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
        CardContainerFlowView()
    }
    .environment(GlobalFrameworkSettings())
}
