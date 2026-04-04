//
//  ExampleCardStyles.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/30/26.
//

import SwiftUI




struct ExampleCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.secondarySystemBackground))
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.separator), lineWidth: 1))
            )
    }
}

private struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.glassProminent)
            .controlSize(.small)
            .buttonBorderShape(.capsule)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

private struct UIButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 24)
            .frame(height: 24)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

private struct CodeBlockModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, design: .monospaced))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.black)
            .foregroundColor(.green)
            .cornerRadius(8)
    }
}

// MARK: - View & Modifier Extensions



extension View {
    func exampleCardStyle() -> some View {
        modifier(ExampleCardStyle())
    }
    
    func buttonModifier() -> some View {
        modifier(ButtonModifier())
    }
    
    func uikitButtonModifier() -> some View {
        modifier(UIButtonModifier())
    }
    
    func codeBlockModifier() -> some
    View {
        modifier(CodeBlockModifier())
    }
    
    
}
extension Text {
    func exampleTextModifier() -> some View {
        self
            .font(Font.callout)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func voiceOverTextModifier() -> some View {
        self
            .foregroundColor(.secondary)
            .font(.callout.bold())
            .frame(maxWidth: .infinity)
    }
}

extension Image {
    func iconModifier() -> some View {
        self
            .symbolRenderingMode(.palette)
            .foregroundStyle(.green, .indigo)
            .accessibilityHidden(true)
    }
}



