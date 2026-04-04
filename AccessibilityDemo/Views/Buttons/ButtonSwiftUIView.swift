//
//  ButtonSwiftUIView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/23/26.
//

import SwiftUI

struct ButtonSwiftUIView: View {
    var body: some View {
        VStack {
            Text("Swift UI")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)
            
            Text("Swift UI uses native accessibility that is built into the framework")
                .padding()
            
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
                    CardSections(sectionHeading: "VoiceOver Output"){
                        VoiceOverRow(icon: icon,
                                     subText: "'Learn more about labels, Button'")
                    }
                    Divider()
                    CardSections(sectionHeading: "Code") {
                        Text("""
                    Button("Learn More"){}
                        .accessibilityLabel(Learn more about labels
                    """)
                        .codeBlockModifier()
                    }
                }
            )
            ExampleCard(
                icon: .voiceOver,
                label: "Buttons with an Accessible Hint",
                subLabel: "Use `accessibilityHint` to provide supplimental hints about the buttons purpose",
                examples: {
                    Button("Learn More"){}
                        .buttonModifier()
                        .accessibilityHint("this button has no on-tap action")
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output"){
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Learn more, Button, this button has no on-tap action'")
                    }
                    Divider()
                    CardSections(sectionHeading: "Code") {
                        Text("""
                    Button("Learn More"){}
                        .accessibilityHint(this button has no on-tap action
                    """).codeBlockModifier()
                    }
                }
            )
            ExampleCard(
                icon: .voiceOver,
                label: "Image Only Buttons ",
                subLabel: "Requires `accessibilityLabel`",
                examples: {
                    Button {}
                    label: {
                        Image.download
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                    }
                    .accessibilityLabel("download")
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output"){
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Download, Button'")
                    }
                    Divider()
                    CardSections(sectionHeading: "Code") {
                        Text("""
                    Button(){}
                    label {
                        .accessibilityLabel(Download)
                    }
                    """).codeBlockModifier()
                    }
                }
            )
        }
    }
}




#Preview {
    NavigationStack {
        ButtonSwiftUIView()
    }.environment(GlobalFrameworkSettings())
}
