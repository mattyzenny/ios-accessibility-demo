//
//  SliderSwiftUI.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/9/26.
//

import SwiftUI

struct SliderSwiftUI: View {

    @State private var value = 0
    @State private var sliderValue: Double = 0

    var body: some View {
        VStack {
            Text("Swift UI")
                .accessibilityAddTraits(.isLink)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text(
                """
                A Slider is a single element control with a ranged value.
                The slider has a hidden label, so add an explicit `Label` that matches the hidden label.
                A stepper is similar, but it uses 2 buttons that control increment and decrement actions.
                """
            )
            .padding()
        }
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Steppers and Sliders with visible labels",
                subLabel:
                    "Steppers combine the visible label with its increment/decrement buttons. Sliders require an explicit label.",
                examples: {
                    VStack {
                        Stepper(
                            "Ticket Purchase: \(value)",
                            value: $value,
                            in: 0...10
                        )
                        .padding()

                        Label(
                            "Day Passes: \(Int(sliderValue))",
                            systemImage: "calendar.badge"
                        )
                        .accessibilityHidden(true)
                        Slider(
                            value: $sliderValue,
                            in: 0...100,
                            step: 1,
                            label: { Text("Day Passes: \(Int(sliderValue))") }
                        )
                    }
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        HStack {
                            VoiceOverRow(
                                icon: icon,
                                subText:
                                    "'Ticket Purchase, 0, Decrement, 0, Button'"
                            )
                            VoiceOverRow(
                                icon: icon,
                                subText:
                                    "'Day Passes, 0, 0 %, adjustable, Swipe up or down with one finger to adjust value.'"
                            )
                        }
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            <Stepper>

                            Stepper(
                                "Ticket Purchase: \(value)",
                                value: $value,
                                in: 0...10
                            )

                            <Slider>

                            Label("Day Passes: \(Int(sliderValue))", systemImage: "calendar.badge")
                                .accessibilityHidden(true)

                            Slider(
                                value: $sliderValue,
                                in: 0...100,
                                step: 1,
                                label: { Text("Day Passes: \(Int(sliderValue))") },
                            )
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
                label: "Sliders with accessible label",
                subLabel:
                    "Use `accessibilityLabel` to overwrite default text labels for better accessibility. This does not work on Stepper, since Stepper is a composite widget combining both buttons and labels.",
                examples: {
                    VStack {
                        Stepper(
                            "Ticket Purchase: \(value)",
                            value: $value,
                            in: 0...10
                        )
                        .padding()
                        
                        Label("Day Passes \(Int(sliderValue))", systemImage: "calendar.badge")
                            .accessibilityHidden(true)
                        Slider(
                            value: $sliderValue,
                            in: 0...100,
                            step: 1,
                            label: { Text("Purchase Adult Day Passes \(Int(sliderValue))") }
                        )
                    }
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        HStack {
                            VoiceOverRow(
                                icon: icon,
                                subText:
                                    "'Ticket Purchase, 0, Decrement, 0, Button'"
                            )
                            VoiceOverRow(
                                icon: icon,
                                subText:
                                    "'Purchase Adult Day Passes, 0, 0 %, adjustable, Swipe up or down with one finger to adjust value.'"
                            )
                        }
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            <Stepper>

                            Stepper(
                                "Ticket Purchase: \(value)",
                                value: $value,
                                in: 0...10
                            )

                            *Slider*

                            Label("Day Passes: \(Int(sliderValue))", systemImage: "calendar.badge")
                                .accessibilityHidden(true)

                            Slider(
                                value: $sliderValue,
                                in: 0...100,
                                step: 1,
                                label: { Text("Purchase Adult Day Passes \(Int(sliderValue))") },
                            )
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
                label: "Steppers and Sliders with accessible values and hints",
                subLabel:
                    "Use `accessibilityValue` and `accessibilityHint` to improve the announcement of the value and accessibility of your controls.",
                examples: {
                    VStack {
                        Stepper(
                            "Ticket Purchase: \(value)",
                            value: $value,
                            in: 0...10
                        )
                        .accessibilityValue(Text("\(value) Tickets"))
                        .padding()

                        Label(
                            "Purchase Day Passes: \(Int(sliderValue))",
                            systemImage: "calendar.badge"
                        )
                        .accessibilityHidden(true)
                        Slider(
                            value: $sliderValue,
                            in: 0...100,
                            step: 1,
                            label: { Text("Purchase Day Passes") },
                            minimumValueLabel: {
                                Text("0")
                                    .accessibilityHidden(true)
                            },
                            maximumValueLabel: {
                                Text("100")
                                    .accessibilityHidden(true)
                            }
                        )
                        .accessibilityValue("\(Int(sliderValue)) Days")
                        .accessibilityHint("minimum 0, maximum 100")
                    }
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        HStack {
                            VoiceOverRow(
                                icon: icon,
                                subText:
                                    "'Ticket Purchase, 0, Decrement, 0 Tickets, Button'"
                            )
                            VoiceOverRow(
                                icon: icon,
                                subText:
                                    "'Purchase Day Passes, 0 Days, adjustable, minimum 0, maximum 100. Swipe up or down with one finger to adjust value.'"
                            )
                        }
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            *Stepper*

                            Stepper(
                                "Ticket Purchase: \(value)",
                                value: $value,
                                in: 0...10
                            )
                            .accessibilityValue(Text("\(value) Tickets"))


                            *Slider*

                            Label("Purchase Day Passes: \(Int(sliderValue))", systemImage: "calendar.badge")
                                .accessibilityHidden(true)

                            Slider(
                                value: $sliderValue,
                                in: 0...100,
                                step: 1,
                                label: { Text("Purchase Day Passes") },
                                minimumValueLabel: {
                                    Text("0")
                                        .accessibilityHidden(true)
                                },
                                maximumValueLabel: {
                                    Text("100")
                                        .accessibilityHidden(true)
                                }
                            )
                            .accessibilityValue("\(Int(sliderValue)) Days")
                            .accessibilityHint("minimum 0, maximum 100")
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

extension SliderSwiftUI {
    var maxValue: Int {
        100
    }
    var minValue: Int {
        0
    }

    private func increaseValue() {
        value += 1
    }
    private func decreaseValue() {
        value -= 1
    }

}

#Preview {
    NavigationStack {
        SliderSwiftUI()
    }
    .environment(GlobalFrameworkSettings())
}
