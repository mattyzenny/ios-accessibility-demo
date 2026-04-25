//
//  LinkSwiftUI.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct LinkSwiftUI: View {
    var body: some View {
        LinkIntro()
        TextLinks()
        ImageLinks()
        IconTextLinks()
    }
}

private struct LinkIntro: View {
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
    }
}
private struct TextLinks: View {
    var body: some View {
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Text Links",
                subLabel:
                    "Use `accessibilityRemoveTraits` to remove the inherited role of button",
                examples: {
                    VStack {
                        Link(
                            "View more",
                            destination: URL(
                                string:
                                    "https://developer.apple.com/documentation/swiftui/accessibilitytraits"
                            )!
                        )
                        .accessibilityRemoveTraits(.isButton)
                        .padding()
                        Link(
                            "Default Link, example",
                            destination: URL(
                                string:
                                    "https://developer.apple.com/documentation/swiftui/accessibilitytraits"
                            )!
                        )
                    }
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'View more, Link'"
                        )
                    }
                    
                    Divider()
                    
                    CardSections(sectionHeading: "Code") {
                        Text(
                        """
                        Link("View more"),destination: URL(string:"developer.apple.com/documentation/swiftui/accessibilitytraits")!)
                            .accessibilityRemoveTraits(.isButton)
                        """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}
private struct ImageLinks: View {
    var body: some View {
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Image Only Links",
                subLabel: "Requires `accessibilityLabel`",
                examples: {
                    Link(
                        destination: URL(
                            string:
                                "https://developer.apple.com/design/human-interface-guidelines"
                        )!
                    ) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .accessibilityLabel("Share UI Guidelines")

                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Share UI Guidelines, Button, Link'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            Link(destination: URL(string:"developer.apple.com/documentation/swiftui/accessibilitytraits")!)
                            { 
                            Image(systemName: "square.and.arrow.up")
                            }
                            .accessibilityLabel="Share")
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }

    }
}
private struct IconTextLinks: View {
    var body: some View {
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Icon + Text Links",
                subLabel:
                    "Combine text and images into one interactive View",
                examples: {
                    Link(
                        destination: URL(
                            string:
                                "https://developer.apple.com/documentation/swiftui/link"
                        )!
                    )
                    {
                        Label(
                            "swift API",
                            systemImage: "text.page.badge.magnifyingglass"
                        )
                    }
                    .accessibilityRemoveTraits(.isButton)
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'swift API, Link'"
                        )
                    }
                    
                    Divider()
                    
                    CardSections(sectionHeading: "Code") {
                        Text(
                    """
                    Link(
                    destination: URL(
                    string:"https://developer.apple.com/documentation/swiftui/link")!) {
                    Label(
                    "swift API",
                    systemImage:"text.page.badge.magnifyingglass")
                    }
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
        LinkSwiftUI()
    }
    .environment(GlobalFrameworkSettings())
}
