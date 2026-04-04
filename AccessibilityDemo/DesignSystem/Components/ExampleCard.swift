//
//  ExampleCard.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/30/26.
//

import SwiftUI

struct ExampleCard<Examples: View, Sections: View>: View {
    
    
    let icon: Image
    let label: String
    let subLabel: String
    
    @ViewBuilder let examples: () -> Examples
    @ViewBuilder let sections: (Image) -> Sections
    
    
    var body: some View {
        DisclosureGroup {
            VStack{
                
                Text("Example")
                    .exampleTextModifier()
                
                
                examples()
                Divider()
                sections(icon)
                
            }
        }
        label: {
            VStack(alignment: .leading) {
                Text(label)
                    .font(.callout.smallCaps().weight(.semibold))
                    .foregroundColor(.indigo)
                
                Text(subLabel)
                    .font(.caption)
                    .foregroundStyle(Color.primary)
                
                
                
            }
        }
        .exampleCardStyle()
        
    }
}

// MARK: - Supporting Views


struct CardSections<Content: View>: View {
    
    let sectionHeading: String
    
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        
        Text(sectionHeading)
            .font(.caption.bold())
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
        content()
    }
}
struct VoiceOverRow: View {
    let icon: Image
    let subText: String
    
    var body: some View {
        HStack{
            icon
                .iconModifier()
            Text(subText)
                .voiceOverTextModifier()
        }
        
    }
}

