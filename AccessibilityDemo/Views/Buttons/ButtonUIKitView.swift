//
//  ButtonUIKitView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/23/26.
//

import SwiftUI
import UIKit

struct ButtonUIKitView: View {
    @State private var number = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Text("UIKit")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)
            
            Text("UIKit accessibility is configured directly on views such as UIButton using properties like accessibilityLabel.")
                .padding()
            
            ExampleCard(
                icon: .voiceOver,
                label: "Buttons with Accessible Text",
                subLabel: "Add `accessibilityLabel` for additional button label information",
                examples: {
                    UIKitButton(
                        setTitle: "Learn More",
                        accessibilityLabel: "Learn more about labels"
                    )
                    .uikitButtonModifier()
                    
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
                        let button = UIButton(type: .system)
                        button.setTitle("Learn More", for: .normal)
                        button.accessibilityLabel = "Learn more about labels"
                        """)
                        .codeBlockModifier()
                    }
                }
            )
            ExampleCard(
                icon: .voiceOver,
                label: "Buttons With an Accessible Hint",
                subLabel: "Use `accessibilityHint` to provide supplimental hints about the buttons purpose",
                examples: {
                    UIKitButton(
                        setTitle: "Learn More",
                        accessibilityHint: "this button adds a number on-tap \(number)",
                        action: { number = Int.random(in: 1...100)
                            UIAccessibility.post(
                                notification: .announcement,
                                argument: "\(number)"
                                )
                        }
                    )
                    .uikitButtonModifier()
                    
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Learn More, Button, this button changes colors on-tap'"
                        )
                    }
                    
                    Divider()
                    
                    CardSections(sectionHeading: "Code") {
                        Text("""
                        let button = UIButton(type: .system)
                        button.setTitle("Learn More", for: .normal)
                        button.accessibilityHint = "this button changes colors on-tap"
                        """)
                        .codeBlockModifier()
                    }
                }
            )
            ExampleCard(
                icon: .voiceOver,
                label: "Icon only Buttons",
                subLabel: "Requires `accessibilityLabel`",
                examples: {
                    UIKitButton(
                        accessibilityLabel: "Download",
                        image: UIImage(systemName: "square.and.arrow.down")
                    )
                    .uikitButtonModifier()
                    
                    
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
                        let button = UIButton(type: .system)
                        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
                        button.accessibilityLabel="Download"
                        """)
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}

private struct UIKitButton: UIViewRepresentable {
    
    let setTitle: String?
    let accessibilityLabel: String?
    let accessibilityHint: String?
    let image: UIImage?
    let action: (() -> Void)?
    
    init(
        setTitle: String = "",
        accessibilityLabel: String = "",
        accessibilityHint: String = "",
        image: UIImage? = nil,
        action: (() -> Void)? = nil
    ) {
        self.setTitle = setTitle.isEmpty ? nil : setTitle
        self.accessibilityLabel = accessibilityLabel.isEmpty ? nil : accessibilityLabel
        self.accessibilityHint = accessibilityHint.isEmpty ? nil : accessibilityHint
        self.image = image
        self.action = action
    }
    
    
    func makeUIView(context: Context) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.title = setTitle
        configuration.image = image
        configuration.cornerStyle = .capsule
        configuration.buttonSize = .small
        
        let button = UIButton(configuration: configuration)
        
        button.addAction(UIAction { _ in
            action?()
        }, for: .touchUpInside)
        
        applyProps(to: button)
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        applyProps(to: uiView)
    }
    
    private func applyProps(to button: UIButton) {
        button.configuration?.title = setTitle
        button.configuration?.image = image
        button.accessibilityLabel = accessibilityLabel
        button.accessibilityHint = accessibilityHint
    }
}

#Preview {
    ButtonUIKitView()
}
