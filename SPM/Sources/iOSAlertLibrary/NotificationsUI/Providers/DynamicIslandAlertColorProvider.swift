import SwiftUI

/// A utility enum that provides methods to retrieve the appropriate colors for a ``DynamicIslandAlertConfig``
/// based on the current `ColorScheme` (light or dark mode).
///
/// This enum helps in dynamically adjusting the dynamic island alert's icon, title, and message colors
/// to match the system’s theme, ensuring a consistent and visually appropriate UI for the dynamic island alert.
enum DynamicIslandAlertColorProvider {
    
    /// Returns the icon color for the ``DynamicIslandAlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``DynamicIslandAlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate icon color (`lightModeIconColor` or `darkModeIconColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let iconColor = DynamicIslandAlertColorProvider.getIconColor(config: dynamicIslandAlertConfig, for: colorScheme)
    /// ```
    static func getIconColor(config: DynamicIslandAlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? (config.lightModeIconColor ?? .green)
            : (config.darkModeIconColor ?? .green)
    }
    
    /// Returns the title color for the ``DynamicIslandAlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``DynamicIslandAlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate title color (`lightModeTitleColor` or `darkModeTitleColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let titleColor = DynamicIslandAlertColorProvider.getTitleColor(config: dynamicIslandAlertConfig, for: colorScheme)
    /// ```
    static func getTitleColor(config: DynamicIslandAlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeTitleColor : config.darkModeTitleColor
    }
    
    /// Returns the message color for the ``DynamicIslandAlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``DynamicIslandAlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate message color (`lightModeMessageColor` or `darkModeMessageColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let messageColor = DynamicIslandAlertColorProvider.getMessageColor(config: dynamicIslandAlertConfig, for: colorScheme)
    /// ```
    static func getMessageColor(config: DynamicIslandAlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? (config.lightModeMessageColor ?? .gray)
            : (config.darkModeMessageColor ?? .gray)
    }
}
