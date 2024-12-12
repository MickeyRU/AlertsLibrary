import SwiftUI

/// A configuration for displaying an informational alert with a title and message.
///
/// The `InformationAlertConfig` struct is used to display an informational alert with a customizable title,
/// message, background color, text color, and an action to close the alert. The background and text colors
/// adjust according to the light or dark mode settings. This alert is designed to provide users with important
/// information that they can dismiss by triggering the `closeAction`.
public struct InformationAlertConfig {
    /// The title of the informational alert.
    let title: String
    
    /// The message content of the informational alert.
    let message: String
    
    /// The background color for the alert in light mode.
    let lightModeBackgroundColor: Color
    
    /// The background color for the alert in dark mode.
    let darkModeBackgroundColor: Color
    
    /// The title color for the alert in light mode.
    let lightModeTitleColor: Color
    
    /// The title color for the alert in dark mode.
    let darkModeTitleColor: Color
    
    /// The message text color for the alert in light mode.
    let lightModeMessageColor: Color
    
    /// The message text color for the alert in dark mode.
    let darkModeMessageColor: Color
    
    /// The action to perform when the alert is closed.
    let closeAction: () -> Void
    
    /// Creates a new `InformationAlertConfig` with customizable title, message, colors, and close action.
    ///
    /// - Parameters:
    ///   - title: The title of the informational alert. Defaults to `"Information"`.
    ///   - message: The message content of the informational alert. Defaults to a sample message.
    ///   - lightModeBackgroundColor: The background color for the alert in light mode. Defaults to `.white`.
    ///   - darkModeBackgroundColor: The background color for the alert in dark mode. Defaults to a dark color.
    ///   - lightModeTitleColor: The title color for the alert in light mode. Defaults to `.black`.
    ///   - darkModeTitleColor: The title color for the alert in dark mode. Defaults to `.white`.
    ///   - lightModeTextColor: The message text color for the alert in light mode. Defaults to `.secondary`.
    ///   - darkModeTextColor: The message text color for the alert in dark mode. Defaults to a light gray color.
    ///   - buttonAction: The action to perform when the alert is closed. Defaults to an empty action.
    public init(
        title: String = "Information",
        message: String =
        """
        Some information about something.

        You can add more text here.
        """,
        lightModeBackgroundColor: Color = .white,
        darkModeBackgroundColor: Color = Color(white: 0.15),
        lightModeTitleColor: Color = .black,
        darkModeTitleColor: Color = .white,
        lightModeTextColor: Color = .secondary,
        darkModeTextColor: Color = Color(white: 0.8),
        buttonAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.message = message
        self.lightModeBackgroundColor = lightModeBackgroundColor
        self.darkModeBackgroundColor = darkModeBackgroundColor
        self.lightModeTitleColor = lightModeTitleColor
        self.darkModeTitleColor = darkModeTitleColor
        self.lightModeMessageColor = lightModeTextColor
        self.darkModeMessageColor = darkModeTextColor
        self.closeAction = buttonAction
    }
}
