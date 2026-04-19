//
//  SwitchUIKit.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct SwitchUIKit: View {
    var body: some View {
        VStack {
            Text("UI Kit")
                .accessibilityAddTraits(.isLink)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text("Swift UI uses native accessibility that is built into the framework")
                .padding()
        }
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Buttons with Accessible Text",
                subLabel: "Add `accessibilityLabel` for additional button label information",
                examples: {
                    Button("Learn More") {}
                        .buttonModifier()
                        .accessibilityLabel("Learn more about labels")
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Learn more about labels, Button'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text("""
                        Button("Learn More") {}
                            .accessibilityLabel("Learn more about labels")
                        """)
                        .codeBlockModifier()
                    }
                }
            )
        }

        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Image Only Buttons",
                subLabel: "Requires `accessibilityLabel`",
                examples: {
                    Button {
                    } label: {
                        Image.download
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                    }
                    .accessibilityLabel("download")
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Download, Button'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text("""
                        Button {
                        } label: {
                            Image.download
                        }
                        .accessibilityLabel("Download")
                        """)
                        .codeBlockModifier()
                    }
                }
            )
        }
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Disabled Buttons",
                subLabel: "Add `disabled` to change the button state",
                examples: {
                    Button("Learn More") {}
                        .disabled(true)
                        .buttonModifier()
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Learn More, dimmed, Button'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text("""
                        VStack {
                            Text("Learn More")
                        }
                        .accessibilityAddTraits(.isButton)
                        .buttonModifier()
                        """)
                        .codeBlockModifier()
                    }
                }
            )
        }
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Grouped Buttons",
                subLabel: "Use `GroupBox` to group buttons and assign `accessibilityElement` + `accessibilityLabel` to the group container",
                examples: {
                    GroupBox {
                        HStack {
                            Button("Florida") {}
                            Button("California") {}
                            Button("Paris") {}
                        }
                        .buttonModifier()
                    }
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Choose a Park")
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "Choose a Park"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text("""
                        GroupBox {
                            HStack {
                                Button("Florida") {}
                                Button("California") {}
                                Button("Paris") {}
                            }
                            .buttonModifier()
                        }
                        .accessibilityElement(children: .contain)
                        .accessibilityLabel("Choose a Park")
                        """)
                        .codeBlockModifier()
                    }
                }
            )
        }
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Custom Buttons",
                subLabel: "Requires `accessibilityAddTraits`. All styling and button functionality must be handled independently.",
                examples: {
                    VStack {
                        Text("Learn More")

                    }
                    .accessibilityAddTraits(.isButton)

                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Learn More, Button'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text("""
                        VStack {
                            Text("Learn More")
                            }
                        .accessibilityAddTraits(.isButton)
                        """)
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}

#Preview {
    NavigationStack {
        SwitchUIKit()
    }
    .environment(GlobalFrameworkSettings())
}
