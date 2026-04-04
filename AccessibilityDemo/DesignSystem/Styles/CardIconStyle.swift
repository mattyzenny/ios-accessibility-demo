//
//  CardIconStyle.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/25/26.
//

import SwiftUI

extension Image {
    func cardIconStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(height: 20)
            .accessibilityHidden(true)
    }
}
