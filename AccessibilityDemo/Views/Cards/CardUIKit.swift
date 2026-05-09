//
//  CardContainerUIKit.swift
//  AccessibilityDemo
//
//  Created by OpenAI on 2026-05-04.
//

import SwiftUI
import UIKit

struct CardUIKit: View {
    var body: some View {
        CardContainerUIKitIntro()
        UIKitStaticGroupedCard()
        UIKitSingleActionCard()
        UIKitCustomActionCard()
        UIKitMultiActionCard()
    }
}

private struct CardContainerUIKitIntro: View {
    var body: some View {
        VStack {
            Text("UIKit")
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h2)
                .foregroundColor(.secondary)
                .font(.headline)
                .frame(maxWidth: .infinity)

            Text(
                "UIKit cards usually take one of two forms: a single accessible summary, or a container that exposes each child separately. Choose the pattern that matches the interaction."
            )
            .padding()
        }
    }
}

private struct UIKitStaticGroupedCard: View {
    var body: some View {
        VStack {
            DemoCard(
                icon: .voiceOver,
                label: "Grouped Summary Card",
                subLabel:
                    "Combine the card's children into one accessible summary.",
                examples: {
                    UIKitStaticExample()
                        .frame(
                            maxWidth: .infinity,
                            minHeight: 80,
                            alignment: .leading
                        )
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText:
                                "'Flight Delayed, Flight Number 1234, Initial Departure Time 11:00 AM, Updated Departure Time: 2:00 PM'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            let cardSummary = UIStackView(arrangedSubviews: [
                                topRowDetails,
                                bottomRowDetails,
                            ])
                            cardSummary.isAccessibilityElement = true
                            cardSummary.accessibilityLabel =
                                flightImage.accessibilityLabel! + flightNumber.accessibilityLabel!
                                + initialTime.accessibilityLabel! + updatedTime.accessibilityLabel!
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}

private struct UIKitSingleActionCard: View {
    var body: some View {
        VStack {
            DemoCard(
                icon: .voiceOver,
                label: "Single Action Card",
                subLabel:
                    "Expose the whole card as a single button-style element and hide the inner control from VoiceOver.",
                examples: {
                    UIKitSingleActionExample()
                        .frame(
                            maxWidth: .infinity,
                            minHeight: 80,
                            alignment: .leading
                        )
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText:
                                "'Flight Cancelled, Flight Number 1234, Status: Cancelled, Change Flight, Button'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            let changeFlightButton = UIButton(type: .system)
                            changeFlightButton.setTitle("Change Flight", for: .normal)
                            changeFlightButton.isAccessibilityElement = false

                            let cardSummary = UIStackView(arrangedSubviews: [
                                topRowDetails,
                                bottomRowDetails,
                            ])
                            cardSummary.isAccessibilityElement = true
                            cardSummary.accessibilityTraits = .button
                            cardSummary.accessibilityLabel =
                                flightImage.accessibilityLabel! + flightNumber.accessibilityLabel!
                                + statusLabel.text! + status.text! + changeFlightButton.titleLabel!.text!
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}

private struct UIKitMultiActionCard: View {
    var body: some View {
        VStack {
            DemoCard(
                icon: .voiceOver,
                label: "Multiple Interactives Card",
                subLabel:
                    "Expose individual buttons inside the card as separate UIKit elements.",
                examples: {
                    UIKitMultiActionExample()
                        .frame(
                            maxWidth: .infinity,
                            minHeight: 80,
                            alignment: .leading
                        )
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText:
                                "'Add to Wallet, button,  ...'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            let walletLabel = UILabel()
                            walletLabel.text = "Add to wallet"
                            walletLabel.isAccessibilityElement = false
                            let walletButton = UIButton()
                            walletButton.setImage(walletImage.image, for: .normal)
                            walletButton.accessibilityLabel = walletLabel.text

                            let flightNumber = UILabel()
                            flightNumber.text = "Your Trip is Booked!"
                            let changeFlightButton = UIButton(type: .system)

                            changeFlightButton.setTitle("View Flight Details", for: .normal)
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}

private struct UIKitCustomActionCard: View {
    var body: some View {
        VStack {
            DemoCard(
                icon: .voiceOver,
                label: "Custom Action Card",
                subLabel:
                    "Expose the whole card as one accessible summary and add a custom VoiceOver action for the secondary action.",
                examples: {
                    UIKitCustomActionExample()
                        .frame(
                            maxWidth: .infinity,
                            minHeight: 80,
                            alignment: .leading
                        )
                },
                sections: { icon in
                    CardSections(sectionHeading: "VoiceOver Output") {
                        VoiceOverRow(
                            icon: icon,
                            subText:
                                "'Your Trip is Booked! View Flight Details' Button, Swipe up or down to select a custom action, then double tap to activate.'"
                        )
                    }

                    Divider()

                    CardSections(sectionHeading: "Code") {
                        Text(
                            """
                            let actionLabel = UILabel()
                            actionLabel.text = "Add to wallet "

                            let walletButton = UIButton()
                            walletButton.setImage(walletImage.image, for: .normal)
                            walletButton.accessibilityLabel = actionLabel.text

                            let greeting = UILabel()
                            greeting.text = "Your Trip is Booked! "
                            let changeFlightButton = UIButton(type: .system)

                            changeFlightButton.setTitle("View Flight Details ", for: .normal)

                            let cardSummary = UIStackView(arrangedSubviews: [
                                topRowDetails,
                                bottomRowDetails,
                            ])

                            cardSummary.isAccessibilityElement = true
                            cardSummary.accessibilityTraits = .button

                            cardSummary.accessibilityCustomActions = [
                                UIAccessibilityCustomAction(name: "Add To Wallet") { _ in
                                    walletTapped()
                                    return true
                                }
                            ]
                            cardSummary.accessibilityLabel =
                                greeting.text!
                                + changeFlightButton.titleLabel!.text!
                            """
                        )
                        .codeBlockModifier()
                    }
                }
            )
        }
    }
}

private struct UIKitStaticExample: UIViewRepresentable {
    func makeUIView(context: Context) -> UIStackView {

        //Flight Image
        let flightStatus = "Flight Delayed, "
        let flightImage = UIImageView(
            image: UIImage(systemName: "clock.badge.airplane")
        )
        flightImage.accessibilityLabel = flightStatus
        flightImage.tintColor = .systemOrange
        flightImage.applyCardImageStyle()

        // Flight #
        let flightNumber = UILabel()
        flightNumber.text = "Flight # 1234"
        flightNumber.accessibilityLabel = "Flight Number: 1234, "
        flightNumber.applyTitleStyle()

        // StatusLabel:
        let statusLabel = UILabel()
        statusLabel.text = "Status:"
        statusLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        statusLabel.textColor = .secondaryLabel

        // Status
        let status = UILabel()
        status.text = "Delayed"
        status.font = UIFont.preferredFont(forTextStyle: .callout)
        status.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        status.textColor = .systemRed

        //Initial Time
        let initialTime = UILabel()
        initialTime.text = "11:00 AM"
        initialTime.accessibilityLabel = "Initial Departure Time: 11:00 AM, "
        initialTime.textColor = .systemRed
        initialTime.font = UIFont.preferredFont(forTextStyle: .footnote)

        // →
        let arrow = UILabel()
        arrow.text = "→"
        arrow.textColor = .secondaryLabel
        arrow.font = UIFont.preferredFont(forTextStyle: .title2)
        arrow.transform = CGAffineTransform(translationX: 0, y: 3)

        //Updated Time
        let updatedTime = UILabel()
        updatedTime.text = "2:00 PM"
        updatedTime.accessibilityLabel = "Updated Departure Time: 2:00 PM, "
        updatedTime.textColor = .systemGreen
        updatedTime.font = UIFont.preferredFont(forTextStyle: .headline)

        // Bottom Left
        // [StatusLabel] [Status]
        let bottomLeftDetails = UIStackView(arrangedSubviews: [
            statusLabel, status,
        ])
        bottomLeftDetails.applySectionGroupStyling()

        // Bottom Right
        // [Initial] [Updated]
        let bottomRightDetails = UIStackView(arrangedSubviews: [
            initialTime, arrow, updatedTime,
        ])
        bottomRightDetails.applySectionGroupStyling()

        // Bottom Row
        let bottomRowDetails = UIStackView(arrangedSubviews: [
            bottomLeftDetails,
            bottomRightDetails,
        ])
        bottomRowDetails.applySectionGroupStyling()
        bottomRowDetails.distribution = .equalSpacing

        // Top Row
        // [Flight Image] [Flight Title]
        let topRowDetails = UIStackView(arrangedSubviews: [
            flightImage, flightNumber,
        ])
        topRowDetails.applySectionGroupStyling()
        topRowDetails.distribution = .equalSpacing

        // Main Card Layout
        // Stacks both rows vertically
        let cardSummary = UIStackView(arrangedSubviews: [
            topRowDetails,
            bottomRowDetails,
        ])
        cardSummary.isAccessibilityElement = true
        cardSummary.accessibilityLabel =
            flightImage.accessibilityLabel! + flightNumber.accessibilityLabel!
            + initialTime.accessibilityLabel! + updatedTime.accessibilityLabel!

        cardSummary.applyCardStyle()
        return cardSummary
    }

    func updateUIView(_ uiView: UIStackView, context: Context) {
    }
}
private struct UIKitMultiActionExample: UIViewRepresentable {
    func makeUIView(context: Context) -> UIStackView {

        // walletLabel:
        let walletLabel = UILabel()
        walletLabel.text = "Add to wallet"
        walletLabel.isAccessibilityElement = false
        walletLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        walletLabel.textColor = .secondaryLabel

        //Wallet Image
        let walletImage = UIImageView(
            image: UIImage(systemName: "wallet.bifold.fill")
        )
        let walletButton = UIButton()
        walletButton.setImage(walletImage.image, for: .normal)
        walletButton.accessibilityLabel = walletLabel.text
        walletButton.addAction(
            UIAction { _ in
                walletTapped()
            },
            for: .touchUpInside
        )
        walletImage.applyCardImageStyle()

        // Flight #
        let flightNumber = UILabel()
        flightNumber.text = "Your Trip is Booked!"
        flightNumber.applyTitleStyle()

        //Custom Functions
        func buttonTapped() {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.6,
                initialSpringVelocity: 0.8
            ) {
                flightNumber.transform = CGAffineTransform(
                    scaleX: 1.05,
                    y: 1.05
                )
            } completion: { _ in
                flightNumber.transform = .identity
            }
        }
        func walletTapped() {
            walletLabel.text = "Added to Wallet"
            UIAccessibility.post(
                notification: .announcement,
                argument: "Added to Wallet"
            )
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.6,
                initialSpringVelocity: 0.8
            ) {
                walletLabel.transform = CGAffineTransform(
                    scaleX: 1.20,
                    y: 1.20
                )
            } completion: { _ in
                walletLabel.transform = .identity
            }
        }
        let changeFlightButton = UIButton(type: .system)
        let config = UIButton.Configuration.plain()
        changeFlightButton.configuration = config
        changeFlightButton.setTitle("View Flight Details", for: .normal)
        changeFlightButton.addAction(
            UIAction { _ in
                buttonTapped()
            },
            for: .touchUpInside
        )

        // Bottom Left
        // [StatusLabel] [Status]
        let bottomLeftDetails = UIStackView(arrangedSubviews: [
            walletLabel
        ])
        bottomLeftDetails.applySectionGroupStyling()

        // Bottom Right
        // [Initial] [Updated]
        let bottomRightDetails = UIStackView(arrangedSubviews: [
            changeFlightButton
        ])

        // Bottom Row
        let bottomRowDetails = UIStackView(arrangedSubviews: [
            bottomLeftDetails,
            bottomRightDetails,
        ])
        bottomRowDetails.applySectionGroupStyling()
        bottomRowDetails.distribution = .equalSpacing

        // Top Row
        // [Flight Image] [Flight Title]
        let topRowDetails = UIStackView(arrangedSubviews: [
            walletButton, flightNumber,
        ])
        topRowDetails.applySectionGroupStyling()
        topRowDetails.distribution = .equalSpacing

        // Stacks both rows vertically
        let cardSummary = UIStackView(arrangedSubviews: [
            topRowDetails,
            bottomRowDetails,
        ])

        cardSummary.applyCardStyle()
        return cardSummary
    }

    func updateUIView(_ uiView: UIStackView, context: Context) {
    }
}
private struct UIKitCustomActionExample: UIViewRepresentable {
    func makeUIView(context: Context) -> UIStackView {

        // Wallet Label:
        let actionLabel = UILabel()
        actionLabel.text = "Add to wallet "
        actionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        actionLabel.textColor = .secondaryLabel

        //Flight Image
        let walletImage = UIImageView(
            image: UIImage(systemName: "wallet.bifold.fill")
        )
        let walletButton = UIButton()
        walletButton.setImage(walletImage.image, for: .normal)
        walletButton.accessibilityLabel = actionLabel.text
        walletButton.addAction(
            UIAction { _ in
                walletTapped()
            },
            for: .touchUpInside
        )
        walletImage.applyCardImageStyle()

        // Flight #
        let greeting = UILabel()
        greeting.text = "Your Trip is Booked! "
        greeting.applyTitleStyle()

        //Custom Functions
        func buttonTapped() {
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.6,
                initialSpringVelocity: 0.8
            ) {
                greeting.transform = CGAffineTransform(
                    scaleX: 1.05,
                    y: 1.05
                )
            } completion: { _ in
                greeting.transform = .identity
            }
        }
        func walletTapped() {
            actionLabel.text = "Added to Wallet"
            UIAccessibility.post(
                notification: .announcement,
                argument: "Added to Wallet"
            )
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.6,
                initialSpringVelocity: 0.8
            ) {
                actionLabel.transform = CGAffineTransform(
                    scaleX: 1.20,
                    y: 1.20
                )
            } completion: { _ in
                actionLabel.transform = .identity
            }
        }
        let changeFlightButton = UIButton(type: .system)
        let config = UIButton.Configuration.plain()
        changeFlightButton.configuration = config
        changeFlightButton.setTitle("View Flight Details ", for: .normal)
        changeFlightButton.addAction(
            UIAction { _ in
                buttonTapped()
            },
            for: .touchUpInside
        )

        // Bottom Left
        // [StatusLabel] [Status]
        let bottomLeftDetails = UIStackView(arrangedSubviews: [
            actionLabel
        ])
        bottomLeftDetails.applySectionGroupStyling()

        // Bottom Right
        // [Initial] [Updated]
        let bottomRightDetails = UIStackView(arrangedSubviews: [
            changeFlightButton
        ])

        // Bottom Row
        let bottomRowDetails = UIStackView(arrangedSubviews: [
            bottomLeftDetails,
            bottomRightDetails,
        ])
        bottomRowDetails.applySectionGroupStyling()
        bottomRowDetails.distribution = .equalSpacing

        // Top Row
        // [Flight Image] [Flight Title]
        let topRowDetails = UIStackView(arrangedSubviews: [
            walletButton, greeting,
        ])
        topRowDetails.applySectionGroupStyling()
        topRowDetails.distribution = .equalSpacing

        // Stacks both rows vertically
        let cardSummary = UIStackView(arrangedSubviews: [
            topRowDetails,
            bottomRowDetails,
        ])

        cardSummary.isAccessibilityElement = true
        cardSummary.accessibilityTraits = .button

        cardSummary.accessibilityCustomActions = [
            UIAccessibilityCustomAction(name: "Add To Wallet") { _ in
                walletTapped()
                return true
            }
        ]
        cardSummary.accessibilityLabel =
            greeting.text!
            + changeFlightButton.titleLabel!.text!

        cardSummary.applyCardStyle()
        return cardSummary
    }

    func updateUIView(_ uiView: UIStackView, context: Context) {
    }
}
private struct UIKitSingleActionExample: UIViewRepresentable {
    func makeUIView(context: Context) -> UIStackView {

        //Flight Image
        let flightStatus = "Flight Cancelled, "
        let flightImage = UIImageView(
            image: UIImage(systemName: "xmark.circle.badge.airplane")
        )
        flightImage.accessibilityLabel = flightStatus
        flightImage.tintColor = .systemRed
        flightImage.applyCardImageStyle()

        // Flight #
        let flightNumber = UILabel()
        flightNumber.text = "Flight # 1234"
        flightNumber.accessibilityLabel = "Flight Number: 1234, "
        flightNumber.applyTitleStyle()

        // StatusLabel:
        let statusLabel = UILabel()
        statusLabel.text = "Status:"
        statusLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        statusLabel.textColor = .secondaryLabel

        // Status
        let status = UILabel()
        status.text = "Cancelled "
        status.font = UIFont.preferredFont(forTextStyle: .callout)
        status.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        status.textColor = .systemRed

        let changeFlightButton = UIButton(type: .system)
        let config = UIButton.Configuration.plain()
        changeFlightButton.configuration = config
        changeFlightButton.setTitle("Change Flight", for: .normal)
        changeFlightButton.isAccessibilityElement = false

        // Bottom Left
        // [StatusLabel] [Status]
        let bottomLeftDetails = UIStackView(arrangedSubviews: [
            statusLabel, status,
        ])
        bottomLeftDetails.applySectionGroupStyling()

        // Bottom Right
        // [Initial] [Updated]
        let bottomRightDetails = UIStackView(arrangedSubviews: [
            changeFlightButton
        ])

        // Bottom Row
        let bottomRowDetails = UIStackView(arrangedSubviews: [
            bottomLeftDetails,
            bottomRightDetails,
        ])
        bottomRowDetails.applySectionGroupStyling()
        bottomRowDetails.distribution = .equalSpacing

        // Top Row
        // [Flight Image] [Flight Title]
        let topRowDetails = UIStackView(arrangedSubviews: [
            flightImage, flightNumber,
        ])
        topRowDetails.applySectionGroupStyling()
        topRowDetails.distribution = .equalSpacing

        // Main Card Layout
        // Stacks both rows vertically
        let cardSummary = UIStackView(arrangedSubviews: [
            topRowDetails,
            bottomRowDetails,
        ])
        cardSummary.isAccessibilityElement = true
        cardSummary.accessibilityTraits = .button
        cardSummary.accessibilityLabel =
            flightImage.accessibilityLabel! + flightNumber.accessibilityLabel!
            + statusLabel.text! + status.text! + changeFlightButton.titleLabel!
            .text!

        cardSummary.applyCardStyle()
        return cardSummary
    }

    func updateUIView(_ uiView: UIStackView, context: Context) {
    }
}

// Card Style Helpers

extension UILabel {
    func applyTitleStyle() {
        font = .preferredFont(forTextStyle: .headline)
        numberOfLines = 0

    }
}

extension UIStackView {
    func applySectionGroupStyling() {
        axis = .horizontal
        alignment = .firstBaseline
        distribution = .fill
        spacing = 3
    }
    func applyCardStyle() {
        axis = .vertical
        spacing = 10
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        backgroundColor = .secondarySystemFill
        layer.cornerRadius = 10
        layer.borderWidth = 3
        layer.borderColor = UIColor.opaqueSeparator.cgColor
        clipsToBounds = true
    }
}

extension UIImageView {
    func applyCardImageStyle() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 24),
            heightAnchor.constraint(equalToConstant: 24),
        ])
    }
}

#Preview {
    CardUIKit()
}
