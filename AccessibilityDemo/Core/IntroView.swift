//
//  IntroView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/20/26.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                header
                    .padding(.top, 80)
                main
                Spacer()
                footer
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .padding(.bottom)
    }

    var header: some View {
        VStack(spacing: 20) {
            Image.swiftLogo
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .accessibilityHidden(true)
                .foregroundColor(.primary)
            Text("iOS Accessibility")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h1)
                .font(.title)
        }
    }

    var main: some View {
        VStack(spacing: 40) {
            Text("Explore practical iOS accessibility patterns in SwiftUI and UIKit.")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.primary.opacity(0.8))
        }
        .padding()
    }

    var footer: some View {
        NavigationLink("Get Started") {
            HomeView()
        }
    }
}

#Preview {
    NavigationStack {
        IntroView()
    }
    .environment(GlobalFrameworkSettings())
}
