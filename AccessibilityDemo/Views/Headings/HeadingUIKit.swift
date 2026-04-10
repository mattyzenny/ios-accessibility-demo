//
//  HeadingUIKit.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/24/26.
//
import SwiftUI
import UIKit

struct HeadingUIKit: View {
    var body: some View {
        VStack {
            ExampleCard(
                icon: .voiceOver,
                label: "Generic Header",
                subLabel: "Add `accessibilityTraits` for assigning header roles.",
                examples: {
                    GenericHeader(title: "Parks")
                        .font(.title3)
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText: "'Parks, Heading'"
                        )
                    }
                    
                    Divider()
                    
                    CardSections(sectionHeading: "Code") {
                        Text("""
                            let label = UILabel()
                            label.text = "Parks"
                            label.accessibilityTraits.insert(.header)
                            """)
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}
    
    
    private struct GenericHeader: UIViewRepresentable {
        var title: String
        func updateUIView(_ uiView: UILabel, context: Context) {
        }
        
        func makeUIView(context: Context) -> UILabel {
            let label = UILabel()
            label.text = title
            label.accessibilityTraits.insert(.header)
            return label
        }
    }
    


#Preview {
    NavigationStack {
        HeadingUIKit()
    }
    .environment(GlobalFrameworkSettings())
}
