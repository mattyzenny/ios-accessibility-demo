//
//  SwitchSwiftUI.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct SwitchSwiftUI: View {
    @State var isOn: Bool = false

    var body: some View {
        VStack {
            Text("Swift UI")
                .accessibilityAddTraits(.isLink)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text(
                "Swift UI uses native accessibility that is built into the framework"
            )
            .padding()
        }
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Toggle labels",
                subLabel:
                    "Toggle has a label by default. You can overwrite this label using `accessibilityLabel`.",
                examples: {
                    Toggle(isOn: $isOn) {
                        Label("Map View", systemImage: "mappin.and.ellipse")
                            .accessibilityLabel("Enable Map View")
                    }
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText:
                                "'Enable Map View, Switch button Off, Double tap to toggle setting.'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            Toggle("Map View", isOn: $isOn)
                            .accessibilityLabel("Enable Map View")
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Adjust value announcement",
                subLabel:
                    "Toggles usually announce their state automatically. Customizing the value is possible, but it may be redundant.",
                examples: {
                    Toggle("Enable Map View", isOn: $isOn)
                        .accessibilityValue(
                            isOn ? "View Map On" : "View Map Off"
                        )
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText:
                                "'Enable Map View, Switch button Off, Double tap to toggle setting.'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            Toggle("Enable Map View", isOn: $isOn)
                            .accessibilityValue(isOn ? "View Map On" : "View Map Off")
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}

#Preview {
    NavigationStack {
        SwitchSwiftUI()
    }
    .environment(GlobalFrameworkSettings())
}
