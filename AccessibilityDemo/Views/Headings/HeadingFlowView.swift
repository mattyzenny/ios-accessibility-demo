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
            Text("Headings")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h1)

            FrameworkSelectorComponent()

            Form {
                Text("Native buttons should expose a clear name, role, and state.")
                Text(.init("**Name:** Use the visible button title when it is descriptive. If the title is not clear enough, provide a better spoken label with `setTitle` or `accessibilityLabel`."))
                Text(.init("**Role:** Native `UIButton` already announces itself as a button, so in most cases the role does not need extra work."))
                Text(.init("**State:** Make the current state obvious. For example, a disabled button can be represented with `button.isEnabled = false`."))
            }

            if setting.framework == .swiftUI || setting.framework == .both {
                HeadingSwiftUIView()
            }

            if setting.framework == .uiKit || setting.framework == .both {
                HeadingUIKitView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        HeadingFlowView()
    }
    .environment(GlobalFrameworkSettings())
}
