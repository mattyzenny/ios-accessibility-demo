//
//  HomeView.swift
//  AccessibilityDemo
//
//  Created by Matty Zenny on 3/23/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            intro
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var intro: some View {
        List {
            Section("Components"){
                
                GroupBox {
                    ComponentCard(
                        icon: .button,
                        label: "Buttons",
                        destination: ButtonFlowView(),
                        accessibilityLabel: "Buttons examples"
                    )
                }
                .groupBoxStyle(CardStyle())
                .listRowSeparator(.hidden)
                
                GroupBox {
                    ComponentCard(
                        icon: .heading,
                        label: "Headings",
                        destination: HeadingFlowView(),
                         accessibilityLabel: "Headings examples")
                    
                }
                .groupBoxStyle(CardStyle())
                .listRowSeparator(.hidden)
                
                GroupBox {
                    ComponentCard(
                        icon: .link,
                        label: "Links",
                        destination: LinkFlowView(),
                        accessibilityLabel: "Link examples")
                    
                }
                .groupBoxStyle(CardStyle())
                .listRowSeparator(.hidden)
                
                GroupBox {
                    ComponentCard(
                        icon: .slider,
                        label: "Sliders & Steppers",
                        destination: SliderFlowView(),
                        accessibilityLabel: "Slider & Switch examples")
                    
                }
                .groupBoxStyle(CardStyle())
                .listRowSeparator(.hidden)
                
                GroupBox {
                    ComponentCard(
                        icon: .switcher,
                        label: "Switches",
                        destination: SwitchFlowView(),
                        accessibilityLabel: "Switch examples")
                    
                }
                .groupBoxStyle(CardStyle())
                .listRowSeparator(.hidden)
            }
            Section("Web to Mobile"){
                GroupBox {
                    ComponentCard(
                        icon: .map,
                        label: "Accessible Trait Mapping",
                        destination: ConversionView()
                    )
                }
                .groupBoxStyle(CardStyle())
                .listRowSeparator(.hidden)
            }
        }
        .groupBoxStyle(CardStyle())
    }
}


#Preview {
    NavigationStack {
        HomeView()
    }
    .environment(GlobalFrameworkSettings())
}

