//
//  ComponentCardCard.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/26/26.
//

import SwiftUI

struct ComponentCard<Destination: View>: View {
    let icon: Image
    let label: String
    let destination: Destination
    var accessibilityLabel: String? = nil

        
        var body: some View {
            NavigationLink {
                destination
            } label: {
                HStack {
                    icon
                        .cardIconStyle()
                    
                    Spacer()
                    
                    helperLabel
                }
            }
        }

    
    
    // MARK: - Supporting Views

    @ViewBuilder
    var helperLabel: some View {
        if let accessibilityLabel {
            Text(label)
                .foregroundColor(.accentColor)
                .accessibilityLabel(accessibilityLabel)
        } else {
            Text(label)
                .foregroundColor(.accentColor)
        }
    }
}
