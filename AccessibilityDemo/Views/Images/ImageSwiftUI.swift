//
//  ImageSwiftUI.swift
//  AccessibilityDemo
//
//  Created by OpenAI on 2026-05-04.
//

import SwiftUI

struct ImageSwiftUI: View {
    var body: some View {
        ImageIntro()
        DecorativeImageCard()
        InformativeImageCard()
        FunctionalImageCard()
    }
}

private struct ImageIntro: View {
    var body: some View {
        VStack {
            Text("SwiftUI")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text("SwiftUI makes decorative and informative images easy to model with `Image`, `Label`, and accessibility modifiers.")
                .padding()
        }
    }
}

private struct DecorativeImageCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Decorative Images",
            subLabel: "Hide purely visual images so VoiceOver skips them",
            examples: {
                HStack(spacing: 12) {
                    Image(systemName: "sparkles")
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                        .accessibilityHidden(true)

                    Text("The sparkles are decorative and are hidden from assistive technologies.")
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
            },
            sections: { icon in
                CardSections(sectionHeading: "VoiceOver Output") {
                    VoiceOverRow(
                        icon: icon,
                        subText: "'The sparkles are decorative and are hidden from assistive technologies.'"
                    )
                }

                Divider()

                CardSections(sectionHeading: "Code") {
                    Text("""
                        Image(systemName: "sparkles")
                            .accessibilityHidden(true)
                        """)
                    .codeBlockModifier()
                }
            }
        )
    }
}

private struct InformativeImageCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Informative Images",
            subLabel: "Provide a clear label when the image adds meaning",
            examples: {
                HStack(spacing: 12) {
                    Image(systemName: "wifi")
                        .font(.title)
                        .accessibilityLabel("Strong Wi-Fi signal")

                    Text("Status icon describing the current connection strength.")
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
            },
            sections: { icon in
                CardSections(sectionHeading: "VoiceOver Output") {
                    VoiceOverRow(
                        icon: icon,
                        subText: "'Strong Wi-Fi signal'"
                    )
                }

                Divider()

                CardSections(sectionHeading: "Code") {
                    Text("""
                        Image(systemName: "wifi")
                            .accessibilityLabel("Strong Wi-Fi signal")
                        """)
                    .codeBlockModifier()
                }
            }
        )
    }
}

private struct FunctionalImageCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Functional Images",
            subLabel: "Prefer a real button when an image triggers an action",
            examples: {
                Button {
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                }
                .buttonModifier()
                .accessibilityLabel("Share")
            },
            sections: { icon in
                CardSections(sectionHeading: "VoiceOver Output") {
                    VoiceOverRow(
                        icon: icon,
                        subText: "'Share, Button'"
                    )
                }

                Divider()

                CardSections(sectionHeading: "Code") {
                    Text("""
                        Button {
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .accessibilityLabel("Share")
                        """)
                    .codeBlockModifier()
                }
            }
        )
    }
}

#Preview {
    NavigationStack {
        Form {
            ImageSwiftUI()
        }
    }
}
