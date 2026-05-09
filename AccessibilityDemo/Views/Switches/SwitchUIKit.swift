//
//  SwitchUIKit.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct SwitchUIKit: View {
    @State private var isOn: Bool = false
    private var textLabel = "Enable Map View"
    var body: some View {
        VStack {
            Text("UI Kit")
                .accessibilityAddTraits(.isLink)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text(
                "UIKit requires a visible UILabel, and an accessible label to describe the UI element, "
            )
            .padding()
        }
        VStack {
            DemoCard(
                icon: .voiceOver,
                label: "Add a visible label to UISwitch",
                subLabel:
                    "Switches need an explicit label in UIKit. Use `accessibilityLabel` on the control to match the explicit `UILabel`.",
                examples: {
                    Label(textLabel, systemImage: "mappin.and.ellipse")
                        .accessibilityHidden(true)
                    CustomToggle(
                        isOn: $isOn,
                        accessibilityLabel: textLabel
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
                            let label = UILabel()
                            label.text = "Enable Map View"
                            label.isAccessibilityElement = false
                            let toggle = UISwitch()
                            toggle.accessibilityLabel = label.text
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}

private struct CustomToggle: UIViewRepresentable {
    @Binding var isOn: Bool
    var accessibilityLabel: String

    func makeUIView(context: Context) -> UISwitch {
        let toggle = UISwitch()
        toggle.isOn = isOn
        toggle.accessibilityLabel = accessibilityLabel

        toggle.addAction(
            UIAction { _ in
                isOn = toggle.isOn
            },
            for: .valueChanged
        )

        return toggle

    }
    func updateUIView(_ uiView: UISwitch, context: Context) {
        uiView.isOn = isOn
    }
}

#Preview {
    NavigationStack {
        SwitchUIKit()
    }
    .environment(GlobalFrameworkSettings())
}
