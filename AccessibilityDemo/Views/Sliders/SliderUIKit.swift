//
//  SliderUIKit.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct SliderUIKit: View {
    @State private var value = 0
    @State private var sliderValue: Float = 0

        var body: some View {
            VStack {
                Text("UIKit")
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityHeading(.h2)
                    .foregroundColor(.secondary)
                    .font(.headline)
                    .frame(maxWidth: .infinity)

                Text(
                    """
                    UIKit sliders are adjustable control elements. Steppers are a dual button component. Both need explicit accessibility consideration.
                    """
                )
                .padding()
            }
            VStack {
                ExampleCard(
                    icon: .voiceOver,
                    label: "Add a visible label to Steppers and Sliders",
                    subLabel:
                        "Steppers and Sliders need explicit labels in UIKit. Keep the `UILabel` hidden with `isAccessibilityElement` set to false and set `accessibilityLabel` on the control, to match the `UILabel`.",
                    examples: {
                        VStack {
                            Label("Ticket Purchase: \(value)", systemImage: "ticket")
                                .accessibilityHidden(true)
                            UIKitStepper(value: $value)
                                .accessibilityLabel("Ticket Purchase: \(value)")
                                .padding()

                            Label("Day Passes: \(Int(sliderValue))", systemImage: "calendar.badge")
                                .accessibilityHidden(true)
                            UIKitSlider(sliderValue: $sliderValue)
                                .accessibilityLabel("Day Passes: \(Int(sliderValue))")
                                .padding()
                        }
                    },
                    sections: { icon in
                        CardSections(sectionHeading: "VoiceOver Output") {
                            HStack {
                                VoiceOverRow(
                                    icon: icon,
                                    subText:
                                        "'Ticket Purchase: \(value), Decrement 0, Button'"
                                )
                                VoiceOverRow(
                                    icon: icon,
                                    subText:
                                        "'Day Passes, \(Int(sliderValue)), 0%, adjustable, Swipe up or down with one finger to adjust value.'"
                                )
                            }
                        }

                        Divider()

                        CardSections(sectionHeading: "Code") {
                            Text(
                                """
                                <Stepper>
                                
                                let label = UILabel()
                                label.text = "Ticket Purchase: \(value)"
                                label.isAccessibilityElement = false
                                let stepper = UIStepper()
                                stepper.minimumValue = 0
                                stepper.maximumValue = 10
                                stepper.accessibilityLabel = "Ticket Purchase: \(value)"
                                
                                <Slider>
                                
                                let label = UILabel()
                                label.text = "Day Passes: \(Int(sliderValue))"
                                label.isAccessibilityElement = false
                                let slider = UISlider()
                                slider.minimumValue = 0
                                slider.maximumValue = 10
                                slider.accessibilityLabel = "Day Passes: \(Int(sliderValue))"
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
                    label: "Sliders with descriptive value",
                    subLabel:
                        "Use `accessibilityValue` to improve the announcement of the increment/decrement values of the controls.",
                    examples: {
                        VStack {
                            Label("Ticket Purchase: \(value)", systemImage: "ticket")
                                .accessibilityHidden(true)
                            UIKitStepper(value: $value)
                                .accessibilityLabel("Ticket Purchase: \(value)")
                                .accessibilityValue("\(value) Tickets")
                                .padding()

                            Label("Day Passes: \(Int(sliderValue))", systemImage: "calendar.badge")
                                .accessibilityHidden(true)
                            UIKitSlider(sliderValue: $sliderValue)
                                .accessibilityLabel("Day Passes: \(Int(sliderValue))")
                                .accessibilityValue("\(Int(sliderValue)) Passes")
                                .padding()
                        }
                    },
                    sections: { icon in
                        CardSections(sectionHeading: "VoiceOver Output") {
                            HStack {
                                VoiceOverRow(
                                    icon: icon,
                                    subText:
                                        "'Ticket Purchase: \(value), Decrement \(value) Tickets, Button'"
                                )
                                VoiceOverRow(
                                    icon: icon,
                                    subText:
                                        "'Day Passes, \(Int(sliderValue)), \(Int(sliderValue)) Passes, adjustable, Swipe up or down with one finger to adjust value.'"
                                )
                            }
                        }

                        Divider()

                        CardSections(sectionHeading: "Code") {
                            Text(
                                """
                                <Stepper>
                                
                                let label = UILabel()
                                label.text = "Ticket Purchase: \(value)"
                                label.isAccessibilityElement = false
                                let stepper = UIStepper()
                                stepper.minimumValue = 0
                                stepper.maximumValue = 10
                                stepper.accessibilityLabel = "Ticket Purchase: \(value)"
                                stepper.accessibilityValue = "\(value) Tickets"

                                <Slider>
                                
                                let label = UILabel()
                                label.text = "Day Passes: \(Int(sliderValue))"
                                label.isAccessibilityElement = false
                                let slider = UISlider()
                                slider.minimumValue = 0
                                slider.maximumValue = 10
                                slider.accessibilityLabel = "Day Passes: \(Int(sliderValue))"
                                slider.accessibilityValue = "\(Int(sliderValue)) Passes"

                                """
                            )
                            .codeBlockModifier()
                        }
                    }
                )
            }
        }
    }

    // MARK: - Function Not needed

private struct UIKitSlider: UIViewRepresentable {
    @Binding var sliderValue: Float
    
    func makeUIView(context: Context) -> UIView {
        let slider = UISlider()
        slider.isContinuous = false
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.maximumValueImage = UIImage(systemName: "arrow.left.to.line.circle")
        slider.minimumValueImage = UIImage(systemName: "arrow.right.to.line.circle")
        slider.addAction(UIAction { _ in
            sliderValue = slider.value
        }, for: .valueChanged)

        return slider
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

struct UIKitStepper: UIViewRepresentable {
    @Binding var value: Int

    func makeUIView(context: Context) -> UIStepper {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = Double(value)
        stepper.addAction(UIAction { _ in
            value = Int(stepper.value)
        }, for: .valueChanged)

        return stepper
    }

    func updateUIView(_ uiView: UIStepper, context: Context) {
        uiView.value = Double(value)
    }
}

#Preview {
    NavigationStack {
        SliderUIKit()
    }
    .environment(GlobalFrameworkSettings())
}
