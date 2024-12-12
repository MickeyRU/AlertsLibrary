import SwiftUI

/// A utility enum that provides methods to retrieve the appropriate colors for an ``InformationAlertConfig``
/// based on the current `ColorScheme` (light or dark mode).
///
/// This enum helps in dynamically adjusting the background color, title color, and message color of the
/// `InformationAlert` to match the system’s theme, ensuring a consistent and visually appropriate UI.

enum InformationAlertColorProvider {
    
    /// Returns the background color for the ``InformationAlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``InformationAlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate background color (`lightModeBackgroundColor` or `darkModeBackgroundColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let backgroundColor = InformationAlertColorProvider.getBackgroundColor(config: informationAlertConfig, for: colorScheme)
    /// ```
    static func getBackgroundColor(config: InformationAlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeBackgroundColor : config.darkModeBackgroundColor
    }
    
    /// Returns the title color for the ``InformationAlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``InformationAlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate title color (`lightModeTitleColor` or `darkModeTitleColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let titleColor = InformationAlertColorProvider.getTitleColor(config: informationAlertConfig, for: colorScheme)
    /// ```
    static func getTitleColor(config: InformationAlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeTitleColor : config.darkModeTitleColor
    }
    
    /// Returns the message color for the ``InformationAlertConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``InformationAlertConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate message color (`lightModeMessageColor` or `darkModeMessageColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let messageColor = InformationAlertColorProvider.getMessageColor(config: informationAlertConfig, for: colorScheme)
    /// ```
    static func getMessageColor(config: InformationAlertConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeMessageColor : config.darkModeMessageColor
    }
}
