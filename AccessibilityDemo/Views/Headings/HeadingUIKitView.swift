//
//  HeadingUIKitView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/24/26.
//
import SwiftUI

struct HeadingUIKitView: View {
    var body: some View {
        VStack {
            Text("UIKit")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)

            VStack(spacing: 20) {
                Text("UIKit accessibility is different from SwiftUI because they have slightly different frameworks. UIKit has a more declarative API, but it also means that the SwiftUI API is limited in some ways. For example in UIButton, you use accessibilityLabel instead of .accessibilityLabel.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)

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
    HeadingUIKitView()
}
