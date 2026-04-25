//
//  ButtonUIKit.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/23/26.
//

import SwiftUI
import UIKit

struct ButtonUIKit: View {
    
    var body: some View {
        ButtonIntro()
        AccessibleText()
        AccessibilityHint()
        AccessibilityIconButton()
        AccessibilityDisabledButton()
        AccessibilityCustomButton()
    }
    
    
    // NOTE: This works in SwiftUI, but UIKit does not announce group accessibility labels the same way.
    //            ExampleCard(
    //                icon: .voiceOver,
    //                label: "Grouped Buttons",
    //                subLabel: "Use `UIStackView` and assign `isAccessibilityElement` + `accessibilityLabel` to give the group a unified VoiceOver label",
    //                examples: {
    //                        StackedButtons(titles:
    //                                        ["Florida", "California", "Paris"]
    //                            )
    //                        .accessibilityElement(children: .contain)
    //                        .accessibilityLabel("Choose a Park")
    //                            .padding()
    //                    },
    //                sections: { icon in
    //                    CardSections(sectionHeading: "VoiceOver Output") {
    //                        VoiceOverRow(
    //                            icon: icon,
    //                            subText: "'Download, Button'"
    //                        )
    //                    }
    //
    //                    Divider()
    //
    //                    CardSections(sectionHeading: "Code") {
    //                        Text("""
    //                        let button = UIButton(type: .system)
    //                        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
    //                        button.accessibilityLabel="Download"
    //                        """)
    //                        .codeBlockModifier()
    //                    }
    //                }
    //            )
    
    //        }
    //    }
    //}
    
    //private struct StackedButtons: UIViewRepresentable {
    //    let titles: [String]
    //
    //    func makeUIView(context: Context) -> UIStackView {
    //        let stack = UIStackView()
    //        stack.axis = .horizontal
    //        stack.distribution = .fillEqually
    //        stack.spacing = 1
    //
    //        for title in titles {
    //            let button = UIButton(type: .system)
    //            button.setTitle(title, for: .normal)
    //            stack.addArrangedSubview(button)
    //        }
    //        stack.shouldGroupAccessibilityChildren = true
    //        stack.accessibilityLabel = "Choose a Park"
    //
    //
    //        return stack
    //    }
    //
    //    func updateUIView(_ uiView: UIStackView, context: Context) {
    //
    //    }
    //}
    
    
    private struct ButtonIntro: View {
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
            }
        }
    }
    
    private struct AccessibleText: View {
        var body: some View {
            VStack{
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
            }
        }
    }
    
    private struct AccessibilityHint: View {
        @State private var number = Int.random(in: 1...100)
        
        var body: some View {
            VStack{
                ExampleCard(
                    icon: .voiceOver,
                    label: "Buttons With an Accessible Hint",
                    subLabel: "Use `accessibilityHint` to provide supplemental hints about the button's purpose",
                    examples: {
                        UIKitButton(
                            setTitle: "Learn More",
                            accessibilityHint: "this button adds a number on-tap, \(number)",
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
                                subText: "'Learn More, Button, this button adds a number on-tap, \(number)'"
                            )
                        }
                        
                        Divider()
                        
                        CardSections(sectionHeading: "Code") {
                            Text("""
                                let button = UIButton(type: .system)
                                button.setTitle("Learn More", for: .normal)
                                button.accessibilityHint = "this button adds a number on-tap \(number)"
                                """)
                            .codeBlockModifier()
                        }
                    }
                )
            }
        }
    }
    
    private struct AccessibilityIconButton: View {
        var body: some View {
            VStack{
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
                                button.accessibilityLabel = "Download"
                                """)
                            .codeBlockModifier()
                        }
                    }
                )
                
            }
        }
    }
    
    private struct AccessibilityDisabledButton: View {
        var body: some View {
            VStack{
                ExampleCard(
                    icon: .voiceOver,
                    label: "Disabled Buttons",
                    subLabel: "Set `isEnabled` to false to disable buttons",
                    examples: {
                        UIKitButton(
                            setTitle: "Learn More",
                        )
                        .disabled(true)
                        .uikitButtonModifier()
                        
                        
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
                                let button = UIButton(type: .system)
                                button.setTitle("Learn More", for: .normal)
                                button.isEnabled = false
                                """)
                            .codeBlockModifier()
                        }
                    }
                )
                
            }
        }
    }
    
    private struct AccessibilityCustomButton: View {
        var body: some View {
            VStack{
                ExampleCard(
                    icon: .voiceOver,
                    label: "Custom buttons",
                    subLabel: "Requires `isAccessibilityElement`, `accessibilityTraits`. All styling and button functionality must be coded.",
                    examples: {
                        CustomButton(
                            title: "Custom",
                            image: UIImage(systemName: "square.and.arrow.down")
                        )
                        .uikitButtonModifier()
                    },
                    sections: { icon in
                        CardSections(sectionHeading: "VoiceOver Output") {
                            VoiceOverRow(
                                icon: icon,
                                subText: "'Custom Download, Button'"
                            )
                        }
                        
                        Divider()
                        
                        CardSections(sectionHeading: "Code") {
                            Text("""
                                let button = UIControl()
                                button.isAccessibilityElement = true
                                button.accessibilityTraits = .button
                                button.accessibilityLabel = "custom download"
                                """)
                            .codeBlockModifier()
                        }
                    }
                )
                
            }
        }
    }
    
    
    
    // MARK: - UIKit Helpers

    private struct CustomButton: UIViewRepresentable {
        var title: String
        let image: UIImage?
        func updateUIView(_ uiView: UIViewType, context: Context) {}
        
        
        
        func makeUIView(context: Context) -> some UIControl {
            let label = UILabel()
            let button = UIControl()
            let imageView = UIImageView()
            imageView.image = image
            imageView.tintColor = .white
            label.text = title
            label.textColor = .systemBlue
            label.font = .systemFont(ofSize: 14, weight: .medium)
            button.backgroundColor = .systemBlue
            button.addSubview(label)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            button.addSubview(imageView)
            button.layer.cornerRadius = 12
            button.isAccessibilityElement = true
            button.accessibilityTraits = .button
            button.accessibilityLabel = "\(title) download"
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 20),
                imageView.heightAnchor.constraint(equalToConstant: 20)
            ])
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.rightAnchor.constraint(equalTo: button.leftAnchor),
                label.centerYAnchor.constraint(equalTo: button.topAnchor)
            ])
            return button
            
            
        }
    }
    
    private struct UIKitButton:
        UIViewRepresentable {
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
}
#Preview {
    ButtonUIKit()
}
