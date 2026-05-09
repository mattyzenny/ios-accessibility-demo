//
//  ImageUIKit.swift
//  AccessibilityDemo
//
//  Created by OpenAI on 2026-05-04.
//

import SwiftUI
import UIKit

struct ImageUIKit: View {
    var body: some View {
        UIKitImageIntro()
        UIKitDecorativeImageCard()
        UIKitInformativeImageCard()
        UIKitFunctionalImageCard()
    }
}

private struct UIKitImageIntro: View {
    var body: some View {
        VStack {
            Text("UIKit")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text("UIKit images use `UIImageView` accessibility properties directly to decide whether each image should be ignored, announced, or treated like a control.")
                .padding()
        }
    }
}

private struct UIKitDecorativeImageCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Decorative Images",
            subLabel: "Set decorative images to non-accessible so they are skipped",
            examples: {
                UIKitImageViewExample(
                    symbolName: "sparkles",
                    accessibilityLabel: nil,
                    isAccessibilityElement: false
                )
                .frame(height: 48)
            },
            sections: { icon in
                CardSections(sectionHeading: "VoiceOver Output") {
                    VoiceOverRow(
                        icon: icon,
                        subText: "'No announcement. VoiceOver skips the image.'"
                    )
                }

                Divider()

                CardSections(sectionHeading: "Code") {
                    Text("""
                        let imageView = UIImageView(image: UIImage(systemName: "sparkles"))
                        imageView.isAccessibilityElement = false
                        """)
                    .codeBlockModifier()
                }
            }
        )
    }
}

private struct UIKitInformativeImageCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Informative Images",
            subLabel: "Announce meaningful images with a concise label",
            examples: {
                UIKitImageViewExample(
                    symbolName: "wifi",
                    accessibilityLabel: "Strong Wi-Fi signal",
                    isAccessibilityElement: true
                )
                .frame(height: 48)
            },
            sections: { icon in
                CardSections(sectionHeading: "VoiceOver Output") {
                    VoiceOverRow(
                        icon: icon,
                        subText: "'Strong Wi-Fi signal, Image'"
                    )
                }

                Divider()

                CardSections(sectionHeading: "Code") {
                    Text("""
                        let imageView = UIImageView(image: UIImage(systemName: "wifi"))
                        imageView.isAccessibilityElement = true
                        imageView.accessibilityLabel = "Strong Wi-Fi signal"
                        """)
                    .codeBlockModifier()
                }
            }
        )
    }
}

private struct UIKitFunctionalImageCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Functional Images",
            subLabel: "Use a native button when the image performs an action",
            examples: {
                UIKitImageButtonExample()
                    .frame(height: 48)
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
                        let button = UIButton(type: .system)
                        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
                        button.accessibilityLabel = "Share"
                        """)
                    .codeBlockModifier()
                }
            }
        )
    }
}

private struct UIKitImageViewExample: UIViewRepresentable {
    let symbolName: String
    let accessibilityLabel: String?
    let isAccessibilityElement: Bool

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName: symbolName))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        imageView.isAccessibilityElement = isAccessibilityElement
        imageView.accessibilityLabel = accessibilityLabel
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = UIImage(systemName: symbolName)
        uiView.isAccessibilityElement = isAccessibilityElement
        uiView.accessibilityLabel = accessibilityLabel
    }
}

private struct UIKitImageButtonExample: UIViewRepresentable {
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.accessibilityLabel = "Share"
        button.tintColor = .systemBlue
        return button
    }

    func updateUIView(_ uiView: UIButton, context: Context) {
    }
}

#Preview {
    NavigationStack {
        Form {
            ImageUIKit()
        }
    }
}
