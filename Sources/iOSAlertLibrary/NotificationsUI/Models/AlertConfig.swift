import SwiftUI

/// A configuration for customizing the appearance and behavior of alerts.
///
/// The `AlertConfig` struct defines the properties for the visual and functional elements of an alert,
/// including the icon, title, message, background colors, and buttons. It supports light and dark mode customizations.
public struct AlertConfig {
    /// The name of the SF Symbol used as the alert icon.
    let icon: String

    /// The color of the icon in light mode.
    let lightModeIconColor: Color

    /// The color of the icon in dark mode.
    let darkModeIconColor: Color

    /// The title of the alert.
    let title: String

    /// The title color in light mode.
    let lightModeTitleColor: Color

    /// The title color in dark mode.
    let darkModeTitleColor: Color

    /// The message displayed in the alert.
    let message: String

    /// The message color in light mode.
    let lightModeMessageColor: Color

    /// The message color in dark mode.
    let darkModeMessageColor: Color

    /// The background color of the alert in light mode.
    let lightModeBackgroundColor: Color

    /// The background color of the alert in dark mode.
    let darkModeBackgroundColor: Color

    /// The action executed when the alert is dismissed.
    let dismissAction: () -> Void

    /// The configuration for the cancel button, if present.
    ///
    /// If `nil`, the alert will only display a continue button.
    let cancelButtonConfig: AlertButtonConfig?

    /// The configuration for the continue button.
    let continueButtonConfig: AlertButtonConfig

    /// Creates an `AlertConfig` with both cancel and continue buttons.
    ///
    /// - Parameters:
    ///   - icon: The name of the SF Symbol used as the alert icon. Defaults to `"exclamationmark.circle"`.
    ///   - lightModeIconColor: The icon color in light mode. Defaults to `.red`.
    ///   - darkModeIconColor: The icon color in dark mode. Defaults to `.orange`.
    ///   - title: The title of the alert. Defaults to `"Caution"`.
    ///   - lightModeTitleColor: The title color in light mode. Defaults to `.black`.
    ///   - darkModeTitleColor: The title color in dark mode. Defaults to `.white`.
    ///   - message: The message displayed in the alert. Defaults to `"Are you sure you want to continue?"`.
    ///   - lightModeMessageColor: The message color in light mode. Defaults to `.gray`.
    ///   - darkModeMessageColor: The message color in dark mode. Defaults to `.gray`.
    ///   - lightModeBackgroundColor: The background color of the alert in light mode. Defaults to `.white`.
    ///   - darkModeBackgroundColor: The background color of the alert in dark mode. Defaults to a dark gray.
    ///   - dismissAction: The action executed when the alert is dismissed. Defaults to an empty closure.
    ///   - cancelButtonConfig: The configuration for the cancel button. Defaults to a predefined `AlertButtonConfig`.
    ///   - continueButtonConfig: The configuration for the continue button. Defaults to a predefined `AlertButtonConfig`.
    public init(
        icon: String = "exclamationmark.circle",
        lightModeIconColor: Color = .red,
        darkModeIconColor: Color = .orange,
        title: String = "Caution",
        lightModeTitleColor: Color = .black,
        darkModeTitleColor: Color = .white,
        message: String = "Are you sure you want to continue?",
        lightModeMessageColor: Color = .gray,
        darkModeMessageColor: Color = .gray,
        lightModeBackgroundColor: Color = .white,
        darkModeBackgroundColor: Color = Color(white: 0.15),
        dismissAction: @escaping () -> Void = {},
        cancelButtonConfig: AlertButtonConfig = AlertButtonConfig(
            title: "Cancel",
            action: {},
            lightModeTitleColor: .black,
            darkModeTitleColor: .white,
            lightModeBackgroundColor: .gray.opacity(0.2),
            darkModeBackgroundColor: Color(white: 0.35)
        ),
        continueButtonConfig: AlertButtonConfig = AlertButtonConfig(
            title: "Continue",
            action: {},
            lightModeTitleColor: .white,
            darkModeTitleColor: .black,
            lightModeBackgroundColor: .red,
            darkModeBackgroundColor: .orange
        )
    ) {
        self.icon = icon
        self.lightModeIconColor = lightModeIconColor
        self.darkModeIconColor = darkModeIconColor
        self.title = title
        self.lightModeTitleColor = lightModeTitleColor
        self.darkModeTitleColor = darkModeTitleColor
        self.message = message
        self.lightModeMessageColor = lightModeMessageColor
        self.darkModeMessageColor = darkModeMessageColor
        self.lightModeBackgroundColor = lightModeBackgroundColor
        self.darkModeBackgroundColor = darkModeBackgroundColor
        self.dismissAction = dismissAction
        self.cancelButtonConfig = cancelButtonConfig
        self.continueButtonConfig = continueButtonConfig
    }

    /// Creates an `AlertConfig` with only a continue button.
    ///
    /// - Parameters:
    ///   - icon: The name of the SF Symbol used as the alert icon. Defaults to `"questionmark.circle"`.
    ///   - lightModeIconColor: The icon color in light mode. Defaults to `.blue`.
    ///   - darkModeIconColor: The icon color in dark mode. Defaults to `.blue`.
    ///   - title: The title of the alert. Defaults to `"Caution"`.
    ///   - lightModeTitleColor: The title color in light mode. Defaults to `.black`.
    ///   - darkModeTitleColor: The title color in dark mode. Defaults to `.white`.
    ///   - message: The message displayed in the alert. Defaults to `"Are you sure you want to continue?"`.
    ///   - lightModeMessageColor: The message color in light mode. Defaults to `.gray`.
    ///   - darkModeMessageColor: The message color in dark mode. Defaults to the primary color.
    ///   - lightModeBackgroundColor: The background color of the alert in light mode. Defaults to `.white`.
    ///   - darkModeBackgroundColor: The background color of the alert in dark mode. Defaults to a dark gray.
    ///   - dismissAction: The action executed when the alert is dismissed. Defaults to an empty closure.
    ///   - cancelButtonConfig: nil, as there is no cancel button.
    ///   - continueButtonConfig: The configuration for the continue button. Defaults to a predefined `AlertButtonConfig`.
    public init(
        icon: String = "questionmark.circle",
        lightModeIconColor: Color = .blue,
        darkModeIconColor: Color = .blue,
        title: String = "Caution",
        lightModeTitleColor: Color = .black,
        darkModeTitleColor: Color = .white,
        message: String = "Are you sure you want to continue?",
        lightModeMessageColor: Color = .gray,
        darkModeMessageColor: Color = .primary,
        lightModeBackgroundColor: Color = .white,
        darkModeBackgroundColor: Color = Color(white: 0.15),
        dismissAction: @escaping () -> Void = {},
        cancelButtonConfig: AlertButtonConfig? = nil,
        continueButtonConfig: AlertButtonConfig = AlertButtonConfig(
            title: "Continue",
            action: {},
            lightModeTitleColor: .white,
            darkModeTitleColor: .black,
            lightModeBackgroundColor: .red,
            darkModeBackgroundColor: .orange
        )
    ) {
        self.icon = icon
        self.lightModeIconColor = lightModeIconColor
        self.darkModeIconColor = darkModeIconColor
        self.title = title
        self.lightModeTitleColor = lightModeTitleColor
        self.darkModeTitleColor = darkModeTitleColor
        self.message = message
        self.lightModeMessageColor = lightModeMessageColor
        self.darkModeMessageColor = darkModeMessageColor
        self.lightModeBackgroundColor = lightModeBackgroundColor
        self.darkModeBackgroundColor = darkModeBackgroundColor
        self.dismissAction = dismissAction
        self.cancelButtonConfig = nil
        self.continueButtonConfig = continueButtonConfig
    }
}
