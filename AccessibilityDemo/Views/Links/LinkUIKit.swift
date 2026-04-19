//
//  LinkUIKitView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct LinkUIKit: View {
    var body: some View {
        VStack {
            Text("UI Kit")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text(
                "UIKit does not have a Link View. You should use Text or Button Views and customize them to act as links."
            )
            .padding()
        }
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Text Link",
                subLabel:
                    "Use UIButton but add `accessibilityTraits` of role Link",
                examples: {
                    CustomLink(
                    title: "View more",
                    icon: "",
                    url: URL(string: "https://developer.apple.com/documentation/uikit/accessibilitytraits")!
                    )
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
                            let link = UIButton()
                            link.setTitle("View more", for: .normal)
                            link.accessibilityTraits = .link
                            link.addAction(UIAction { _ in
                                UIApplication.shared.open(url)
                            }, for: .touchUpInside)
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
                label: "Image Only Links",
                subLabel:
                    "Use UIButton with UIImage, then add `accessibilityTraits` + `accessibilityLabel`",
                examples: {
                    CustomLink(
                    title: "",
                    icon: "square.and.arrow.up",
                    url: URL(string: "https://developer.apple.com/design/human-interface-guidelines")!
                    )
                    .accessibilityLabel("Share UI Guidelines")
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Share UI Guidelines, Link'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            let link = UIButton()
                            link.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
                            link.accessibilityTraits = .link
                            link.addAction(UIAction { _ in
                                UIApplication.shared.open(url)
                            }, for: .touchUpInside)
                            link.accessibilityLabel = "Share UI Guidelines"
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
                label: "Image + Text Links",
                subLabel:
                    "Combine text and image in UIButton, then add `accessibilityTraits`",
                examples: {
                    CustomLink(
                    title: "swift API",
                    icon: "text.page.badge.magnifyingglass",
                    url: URL(string: "https://developer.apple.com/documentation/uikit/link")!
                    )
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'uiKit API, Link'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            let link = UIButton()
                            link.setTitle("swift API", for: .normal)
                            link.setImage(UIImage(systemName: "text.page.badge.magnifyingglass"), for: .normal)
                            link.accessibilityTraits = .link
                            link.addAction(UIAction { _ in
                                UIApplication.shared.open(url)
                            }, for: .touchUpInside)
                            link.accessibilityLabel = "swift API"
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }

    }
}

// MARK: - UIKit Helpers

private struct CustomLink: UIViewRepresentable {
    let title : String?
    let icon : String?
    let url : URL
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> some UIView {
        let link = UIButton()
        link.accessibilityTraits = .link
        link.addAction(UIAction { _ in
            UIApplication.shared.open(url)
        }, for: .touchUpInside)
        link.setImage(UIImage(systemName: icon ?? ""), for: .normal)
        link.setAttributedTitle(
            NSAttributedString(
                string: title ?? "",
                attributes: [
                    .foregroundColor: UIColor.blue,
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ]
            ),
            for: .normal
        )
        
        return link
    }
}


#Preview {
    NavigationStack {
        LinkUIKit()
    }
    .environment(GlobalFrameworkSettings())
}
