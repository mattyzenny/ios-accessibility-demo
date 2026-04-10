//
//  HeadingFlowView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/24/26.
//
import SwiftUI

struct HeadingFlowView: View {
    @Environment(GlobalFrameworkSettings.self) private var settings

    var body: some View {
        @Bindable var setting = settings

        VStack(spacing: 20) {

            FrameworkSelectorComponent()

            Form {
                    switch setting.framework {
                    case .swiftUI:
                        swiftUIGuidanceSection
                        HeadingSwiftUI()
                        
                        
                    case .uiKit:
                        uiKitGuidanceSection
                        HeadingUIKit()
                        
                    case .both:
                        genericGuidanceSection
                        HeadingSwiftUI()
                        HeadingUIKit()
                    }
            }
        }
        .toolbar {
            ToolbarItem(placement: .title) {
                Text("Accessible Headings")
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityHeading(.h1)
            }
        }
    }
}

private var genericGuidanceSection: some View {
    Section {
        Text(.init("""
        **Clarity:** Write headings that clearly describe the content it precedes.
        """))

        Text(.init("""
        **Structure:** In mobile apps, headings often group related content within a screen or section, not just the top of a page. Do not use headings for visual styling only.
        """))

        Text(.init("""
        **Hierarchy:** Use headings consistently across the screen. Avoid overusing headings.
        """))
    }
}

private var uiKitGuidanceSection: some View {
    Section {
        Text(.init("""
        **UILabel:** UIKit does not typically have heading levels. For this reason, all headings will have the same heirarchy.
        """))

        Text(.init("""
        **Traits:** Add `.header` to `accessibilityTraits` so VoiceOver announces the element as a heading instead of plain static text.
        """))
    }
}

private var swiftUIGuidanceSection: some View {
    Section {
        Text(.init("""
        **Text Views:** Use `Text` for headings whenever possible, then mark it with `.accessibilityAddTraits(.isHeader)` so assistive technologies treat it as a heading.
        """))

        Text(.init("""
        **Levels:** Add `.accessibilityHeading(.h1)` after `.accessibilityAddTraits() when the screen has a real heading hierarchy and the level matters.
        """))
    }
}


#Preview {
    NavigationStack {
        HeadingFlowView()
    }
    .environment(GlobalFrameworkSettings())
}
