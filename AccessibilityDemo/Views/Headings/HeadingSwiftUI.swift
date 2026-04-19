//
//  HeadingSwiftUI.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/24/26.
//
import SwiftUI

struct HeadingSwiftUI: View {
    var body: some View {
        VStack {
            Text("Swift UI")
                .accessibilityAddTraits(.isHeader)
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
                label: "Generic Header",
                subLabel: "Use `accessibilityAddTraits` to assigning header roles.",
                examples: {
                    Text("Parks")
                        .accessibilityAddTraits(.isHeader)
                        .font(.title3)
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Parks, Heading'"
                        )
                    }
                    
                    Divider()
                    
                    CardSections(sectionHeading: "Code") {
                        Text("""
                            Text("Parks")
                            .accessibilityAddTraits(.isHeader)
                            """)
                        .codeBlockModifier()
                    }
                }
            )
        }
        VStack{
            ExampleCard(
                icon: .voiceOver,
                label: "Assign heading level",
                subLabel: "Add `accessibilityAddTraits` + `accessibilityHeading` in order to overwrite the default generic isHeader trait.",
                examples: {
                    Text("Parks")
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityHeading(.h3)
                        .font(.title3)

                        
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Parks, Heading level 3'"
                        )
                    }
                    
                    Divider()
                    
                    CardSections(sectionHeading: "Code") {
                        Text("""
                            Text("Parks")
                            .accessibilityAddTraits(.isHeader)
                            .accessibilityHeading(.h3)
                            """)
                        .codeBlockModifier()
                    }
                }
            )
            
        }
    }
}

#Preview {
    HeadingSwiftUI()
}
