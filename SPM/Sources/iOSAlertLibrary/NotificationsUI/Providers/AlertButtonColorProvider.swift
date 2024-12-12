import SwiftUI

/// A utility enum that provides methods to retrieve the appropriate background and title colors
/// for an ``AlertButtonConfig`` based on the current `ColorScheme` (light or dark mode).
///
/// This enum helps in dynamically adjusting button colors to match the system’s theme, ensuring
/// a consistent and visually appropriate UI for alert buttons.
public enum AlertButtonColorProvider {
    
    /// Returns the background color for the ``AlertButtonConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``AlertButtonConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate background color (`lightModeBackgroundColor` or `darkModeBackgroundColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    ///
    /// let backgroundColor = AlertButtonColorProvider.getBackgroundColor(config: buttonConfig, for: colorScheme)
    /// ```
    static func getBackgroundColor(config: AlertButtonConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeBackgroundColor : config.darkModeBackgroundColor
    }
    
    /// Returns the title color for the ``AlertButtonConfig`` based on the current `ColorScheme`.
    ///
    /// - Parameters:
    ///   - config: The ``AlertButtonConfig`` object that contains the colors for both light and dark modes.
    ///   - colorScheme: The current `ColorScheme` (either `.light` or `.dark`).
    /// - Returns: The appropriate title color (`lightModeTitleColor` or `darkModeTitleColor`).
    ///
    /// Example:
    /// ```swift
    /// @Environment(\.colorScheme) var colorScheme
    /// 
    /// let titleColor = AlertButtonColorProvider.getTitleColor(config: buttonConfig, for: colorScheme)
    /// ```
    static func getTitleColor(config: AlertButtonConfig, for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? config.lightModeTitleColor : config.darkModeTitleColor
    }
}
