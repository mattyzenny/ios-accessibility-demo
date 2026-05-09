//
//  ImageFlowView.swift
//  AccessibilityDemo
//
//  Created by OpenAI on 2026-05-04.
//

import SwiftUI

struct ImageFlowView: View {
    @Environment(GlobalFrameworkSettings.self) private var settings

    var body: some View {
        @Bindable var setting = settings

        VStack(spacing: 20) {
            FrameworkSelectorComponent()

            Form {
                switch setting.framework {
                case .swiftUI:
                    swiftUIGuidanceSection
                    ImageSwiftUI()

                case .uiKit:
                    uiKitGuidanceSection
                    ImageUIKit()

                case .both:
                    genericGuidanceSection
                    ImageSwiftUI()
                    ImageUIKit()
                }
            }
        }
        .navigationTitle("Accessible Images")
    }

    private var genericGuidanceSection: some View {
        Section {
            Text(.init("""
            **Purpose:** Decide whether the image is decorative, informative, or functional before adding accessibility metadata.
            """))

            Text(.init("""
            **Name:** Informative and functional images need a concise spoken label that matches what the image communicates.
            """))

            Text(.init("""
            **Noise:** Hide decorative images from assistive technologies so they do not create extra stops.
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
            **Decorative:** Use `.accessibilityHidden(true)` when the image adds visual polish but no meaning.
            """))

            Text(.init("""
            **Informative:** Add `.accessibilityLabel(...)` when the image communicates content that is not already announced nearby.
            """))

            Text(.init("""
            **Functional:** If the image is tappable, prefer a real `Button` or `Label` so role and action are exposed automatically.
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
            **Decorative:** Set `isAccessibilityElement = false` for images that do not convey meaning.
            """))

            Text(.init("""
            **Informative:** Set `isAccessibilityElement = true` and provide an `accessibilityLabel` for meaningful images.
            """))

            Text(.init("""
            **Functional:** If the image behaves like a control, use a native control or configure the view's traits and action clearly.
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
        ImageFlowView()
    }
    .environment(GlobalFrameworkSettings())
}
