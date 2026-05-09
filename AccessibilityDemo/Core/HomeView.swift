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
        .navigationTitle("Components")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(removing: .title)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }


    var intro: some View {
        List {
            Section("Components") {

                GroupBox {
                    ComponentCard(
                        icon: .button,
                        label: "Buttons",
                        destination: ButtonFlowView(),
                        accessibilityLabel: "Buttons examples"
                    )
                }
                .groupBoxStyle(SectionCardStyle())
                .listRowSeparator(.hidden)

                GroupBox {
                    ComponentCard(
                        icon: .heading,
                        label: "Headings",
                        destination: HeadingFlowView(),
                        accessibilityLabel: "Headings examples"
                    )

                }
                .groupBoxStyle(SectionCardStyle())
                .listRowSeparator(.hidden)

                GroupBox {
                    ComponentCard(
                        icon: .link,
                        label: "Links",
                        destination: LinkFlowView(),
                        accessibilityLabel: "Link examples"
                    )

                }
                .groupBoxStyle(SectionCardStyle())
                .listRowSeparator(.hidden)

                GroupBox {
                    ComponentCard(
                        icon: .slider,
                        label: "Sliders & Steppers",
                        destination: SliderFlowView(),
                        accessibilityLabel: "Slider & Switch examples"
                    )

                }
                .groupBoxStyle(SectionCardStyle())
                .listRowSeparator(.hidden)

                GroupBox {
                    ComponentCard(
                        icon: .switcher,
                        label: "Switches",
                        destination: SwitchFlowView(),
                        accessibilityLabel: "Switch examples"
                    )

                }
                .groupBoxStyle(SectionCardStyle())
                .listRowSeparator(.hidden)

                GroupBox {
                    ComponentCard(
                        icon: .images,
                        label: "Images",
                        destination: ImageFlowView(),
                        accessibilityLabel: "Image examples"
                    )

                }
                .groupBoxStyle(SectionCardStyle())
                .listRowSeparator(.hidden)

                GroupBox {
                    ComponentCard(
                        icon: .containers,
                        label: "Cards & Custom Containers",
                        destination: CardContainerFlowView(),
                        accessibilityLabel: "Cards & Custom Containers examples"
                    )

                }
                .groupBoxStyle(SectionCardStyle())
                .listRowSeparator(.hidden)
            }
            Section("Web to Mobile") {
                GroupBox {
                    ComponentCard(
                        icon: .map,
                        label: "Accessible Trait Mapping",
                        destination: ConversionView()
                    )
                }
                .groupBoxStyle(SectionCardStyle())
                .listRowSeparator(.hidden)
            }
        }
        .groupBoxStyle(SectionCardStyle())
    }
    
}


#Preview {
    NavigationStack {
        HomeView()
    }
    .environment(GlobalFrameworkSettings())
}
