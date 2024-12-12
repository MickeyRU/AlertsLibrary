import SwiftUI

/// A configuration for customizing the appearance and behavior of alert buttons.
///
/// The `AlertButtonConfig` struct provides options to define the title, colors, and action for buttons
/// used in alerts. It supports customization for both light and dark modes.
public struct AlertButtonConfig {
    /// The title of the button.
    let title: String

    /// The title color of the button in light mode.
    let lightModeTitleColor: Color

    /// The title color of the button in dark mode.
    let darkModeTitleColor: Color

    /// The background color of the button in light mode.
    let lightModeBackgroundColor: Color

    /// The background color of the button in dark mode.
    let darkModeBackgroundColor: Color

    /// The action executed when the button is tapped.
    let action: () -> Void

    /// Creates a new `AlertButtonConfig` with customizable properties.
    ///
    /// - Parameters:
    ///   - title: The title of the button. Defaults to `"Button"`.
    ///   - action: The action executed when the button is tapped. Defaults to an empty closure.
    ///   - lightModeTitleColor: The title color of the button in light mode. Defaults to `.white`.
    ///   - darkModeTitleColor: The title color of the button in dark mode. Defaults to `.white`.
    ///   - lightModeBackgroundColor: The background color of the button in light mode. Defaults to `.blue`.
    ///   - darkModeBackgroundColor: The background color of the button in dark mode. Defaults to `.blue`.
    public init(
        title: String = "Button",
        action: @escaping () -> Void = {},
        lightModeTitleColor: Color = .white,
        darkModeTitleColor: Color = .white,
        lightModeBackgroundColor: Color = .blue,
        darkModeBackgroundColor: Color = .blue
    ) {
        self.title = title
        self.action = action
        self.lightModeTitleColor = lightModeTitleColor
        self.darkModeTitleColor = darkModeTitleColor
        self.lightModeBackgroundColor = lightModeBackgroundColor
        self.darkModeBackgroundColor = darkModeBackgroundColor
    }
}

extension AlertButtonConfig {
    /// Creates a new `AlertButtonConfig` using a predefined ``ToastStyle``.
    ///
    /// This initializer maps the ``ToastStyle`` properties to the button's appearance, such as
    /// the title and background colors for light and dark modes.
    ///
    /// - Parameters:
    ///   - title: The title of the button. Defaults to `"Button"`.
    ///   - style: The ``ToastStyle`` used to define the button's colors.
    ///   - action: The action executed when the button is tapped. Defaults to an empty closure.
    public init(
        title: String = "Button",
        style: ToastStyle,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.action = action
        self.lightModeTitleColor = style.backgroundColor
        self.darkModeTitleColor = style.backgroundColor
        self.lightModeBackgroundColor = style.buttonColor
        self.darkModeBackgroundColor = style.buttonColor
    }
}

