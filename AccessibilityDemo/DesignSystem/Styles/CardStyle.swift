//
//  CardStyle.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/25/26.
//

import SwiftUI

struct CardStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
                .font(.subheadline)
                .foregroundStyle(.secondary)

            configuration.content
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
            .fill(Color(.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color(.separator), lineWidth: 1))
            .shadow(color: .black.opacity(0.07), radius: 3, y: 2)
        )
    }
}
