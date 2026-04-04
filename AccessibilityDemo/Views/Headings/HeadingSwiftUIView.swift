//
//  HeadingSwiftUIView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/24/26.
//
import SwiftUI

struct HeadingSwiftUIView: View {
    var body: some View {
        VStack {

            Text("Swift-UI")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)

            VStack(spacing: 20) {
                Text("swift-UI uses native accessibility that is built into the framework")

                Button("Hello world") {}
                    .buttonStyle(.glass)
                    .buttonBorderShape(.capsule)
                    .frame(maxWidth: .infinity, alignment: .center)

                DisclosureGroup("Show Code") {
                    Text("""
                    Button()
                        .accessibilityLabel and more text here
                    """)
                        .font(.system(size: 14, design: .monospaced))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.green)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
        }
    }
}

#Preview {
    HeadingSwiftUIView()
}
