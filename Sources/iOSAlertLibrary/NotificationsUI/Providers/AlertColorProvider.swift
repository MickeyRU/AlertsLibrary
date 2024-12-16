import SwiftUI

/// A utility enum that provides methods to retrieve the appropriate colors for an ``AlertConfig``
/// based on the current `ColorScheme` (light or dark mode).
///
/// This enum helps in dynamically adjusting the alert's icon, background, title, and message colors
/// to match the system’s theme, ensuring a consistent and visually appropriate UI for alerts.
public enum AlertColorProvider {
    
    /// Returns the icon color for the ``AlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``AlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate icon color (`lightModeIconColor` or `darkModeIconColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let iconColor = AlertColorProvider.getIconColor(config: alertConfig, for: colorScheme)
    /// ```
    static func getIconColor(config: AlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeIconColor : config.darkModeIconColor
    }
    
    /// Returns the background color for the ``AlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``AlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate background color (`lightModeBackgroundColor` or `darkModeBackgroundColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let backgroundColor = AlertColorProvider.getBackgroundColor(config: alertConfig, for: colorScheme)
    /// ```
    static func getBackgroundColor(config: AlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeBackgroundColor : config.darkModeBackgroundColor
    }
    
    /// Returns the title color for the ``AlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``AlertConfig``object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate title color (`lightModeTitleColor` or `darkModeTitleColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let titleColor = AlertColorProvider.getTitleColor(config: alertConfig, for: colorScheme)
    /// ```
    static func getTitleColor(config: AlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeTitleColor : config.darkModeTitleColor
    }
    
    /// Returns the message color for the ``AlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``AlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate message color (`lightModeMessageColor` or `darkModeMessageColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let messageColor = AlertColorProvider.getMessageColor(config: alertConfig, for: colorScheme)
    /// ```
    static func getMessageColor(config: AlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeMessageColor : config.darkModeMessageColor
    }
}
