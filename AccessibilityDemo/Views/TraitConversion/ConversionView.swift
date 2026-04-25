//
//  TableView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 4/20/26.
//

import SwiftUI

struct TraitGroup: Identifiable {
    let id = UUID()
    let trait: String
    let web: String
    let mobile: String
    let description: String
}

struct ConversionView: View {
    private let group = [
        TraitGroup(
            trait: "Accessibility Label",
            web: "aria-label",
            mobile: "accessibilityLabel",
            description: "Defines the accessible name of an element"
        ),
        TraitGroup(
            trait: "Accessibility Hint",
            web: "aria-describedby",
            mobile: "accessibilityHint",
            description: "Provides additional context or instructions"
        ),
        TraitGroup(
            trait: "Accessibility Role",
            web: "role",
            mobile: "accessibilityTraits",
            description: "Defines the type or purpose of an element"
        ),
        TraitGroup(
            trait: "Group (Container Semantics)",
            web: "role=group",
            mobile: "accessibilityElement(children: .combine)",
            description: "Groups related elements into a single accessible unit"
        ),
        TraitGroup(
            trait: "Heading",
            web: "role=heading + aria-level",
            mobile: "accessibilityAddTraits(.isHeader) + accessibilityHeading",
            description: "Defines a heading structure for navigation"
        ),
        TraitGroup(
            trait: "Hidden (Visibility)",
            web: "aria-hidden",
            mobile: "accessibilityHidden(true)",
            description: "Removes an element from the accessibility tree"
        ),
        TraitGroup(
            trait: "Custom Actions",
            web: "onclick / keyboard events",
            mobile: "accessibilityAction",
            description: "Defines custom actions available to assistive technologies"
        )
    ]

    /*
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                // Header
                HStack {
                    headerCell("Trait")
                    headerCell("Web")
                    headerCell("Mobile")
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Columns: Trait, Web, Mobile")
                .padding(.bottom, 4)

                Divider()

                // Rows
                ForEach(rows) { row in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment: .top) {
                            cell(row.trait, font: .headline)
                            cell(row.web)
                            cell(row.mobile)
                        }
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("\(row.trait), Web, \(row.web), Mobile, \(row.mobile)")
                    .accessibilityValue("")

                    Divider()
                        .padding(.vertical, 4)
                }
            }
            .padding()
        }
        .navigationTitle("Traits")
    }
    */

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(group) { row in
                    VStack(alignment: .leading, spacing: 12) {

                        // Title (Trait)
                        Text(row.trait)
                            .font(.title2)
                            .fontWeight(.bold)

                        Divider()

                        // Web
                        HStack {
                            Text("Web")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Spacer()
                            Text(row.web)
                                .font(.body)
                                .fontDesign(.monospaced)
                        }

                        // Mobile
                        HStack {
                            Text("Mobile")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Spacer()
                            Text(row.mobile)
                                .font(.body)
                                .fontDesign(.monospaced)
                        }

                        // Description
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Description")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            Text(row.description)
                                .font(.body)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("\(row.trait)")
                    .accessibilityValue("Web \(row.web), Mobile \(row.mobile), Description \(row.description)")
                }
            }
            .padding()
        }
        .navigationTitle("Traits")
    }
}

#Preview {
    NavigationStack {
        ConversionView()
    }
}
