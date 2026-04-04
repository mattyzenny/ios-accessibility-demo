//
//  GlobalFrameworkSettings.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/24/26.
//
import SwiftUI

@Observable
class GlobalFrameworkSettings {
    var framework: FrameworkOption = .both
}

enum FrameworkOption {
    case swiftUI, uiKit, both
}
