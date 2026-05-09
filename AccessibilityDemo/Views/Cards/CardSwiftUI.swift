//
//  CardContainerSwiftUI.swift
//  AccessibilityDemo
//
//  Created by OpenAI on 2026-05-04.
//

import SwiftUI

struct CardSwiftUI: View {
    var body: some View {
        CardContainerSwiftUIIntro()
        GroupedSummaryCard()
        SeparateElementsCard()
        InteractiveCard()
    }
}

private struct CardContainerSwiftUIIntro: View {
    var body: some View {
        VStack {
            Text("SwiftUI")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text("Cards can either read as a single summary or expose each child separately depending on the task.")
                .padding()
        }
    }
}

private struct GroupedSummaryCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Grouped Summary Card",
            subLabel: "Combine children when the card should be announced as one unit",
            examples: {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Flight DL 441")
                        .font(.headline)
                    Text("On time")
                        .foregroundStyle(.green)
                    Text("Gate A12")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
                .accessibilityElement(children: .combine)
            },
            sections: { icon in
                CardSections(sectionHeading: "VoiceOver Output") {
                    VoiceOverRow(
                        icon: icon,
                        subText: "'Flight DL 441, On time, Gate A12'"
                    )
                }

                Divider()

                CardSections(sectionHeading: "Code") {
                    Text("""
                        VStack {
                            Text("Flight DL 441")
                            Text("On time")
                            Text("Gate A12")
                        }
                        .accessibilityElement(children: .combine)
                        """)
                    .codeBlockModifier()
                }
            }
        )
    }
}

private struct SeparateElementsCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Detailed Card",
            subLabel: "Keep child elements separate when each item needs its own focus",
            examples: {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Order #1842")
                        .font(.headline)
                    Text("Arrives tomorrow")
                    Button("Track Package") {
                    }
                    .buttonModifier()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            },
            sections: { icon in
                CardSections(sectionHeading: "VoiceOver Output") {
                    VoiceOverRow(
                        icon: icon,
                        subText: "'Order #1842' then 'Arrives tomorrow' then 'Track Package, Button'"
                    )
                }

                Divider()

                CardSections(sectionHeading: "Code") {
                    Text("""
                        VStack {
                            Text("Order #1842")
                            Text("Arrives tomorrow")
                            Button("Track Package") { }
                        }
                        """)
                    .codeBlockModifier()
                }
            }
        )
    }
}

private struct InteractiveCard: View {
    var body: some View {
        DemoCard(
            icon: .voiceOver,
            label: "Interactive Card",
            subLabel: "Wrap a tappable card in a native control for one clear action",
            examples: {
                NavigationLink {
                    Text("Order details")
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Saved Address")
                                .font(.headline)
                            Text("123 Apple Park Way")
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundStyle(.tertiary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.secondarySystemBackground))
                    )
                }
                .buttonStyle(.plain)
            },
            sections: { icon in
                CardSections(sectionHeading: "VoiceOver Output") {
                    VoiceOverRow(
                        icon: icon,
                        subText: "'Saved Address, 123 Apple Park Way, Button'"
                    )
                }

                Divider()

                CardSections(sectionHeading: "Code") {
                    Text("""
                        NavigationLink {
                            DetailsView()
                        } label: {
                            cardContent
                        }
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
            CardSwiftUI()
        }
    }
}
