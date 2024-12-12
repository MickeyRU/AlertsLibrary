import SwiftUI

/// A configuration for customizing alerts displayed on the Dynamic Island.
///
/// The `DynamicIslandAlertConfig` struct allows the customization of alerts that appear in the Dynamic Island,
/// including their icon, title, message, buttons, and colors for both light and dark modes. It also supports
/// an action triggered by a tap gesture.
public struct DynamicIslandAlertConfig {
    /// The name of the SF Symbol used as the alert icon, if any.
    let icon: String?
    
    /// The color of the icon in light mode, if an icon is provided.
    let lightModeIconColor: Color?
    
    /// The color of the icon in dark mode, if an icon is provided.
    let darkModeIconColor: Color?
    
    /// The title of the alert.
    let title: String
    
    /// The title color in light mode.
    let lightModeTitleColor: Color
    
    /// The title color in dark mode.
    let darkModeTitleColor: Color
    
    /// The message displayed in the alert, if any.
    let message: String?
    
    /// The message color in light mode, if a message is provided.
    let lightModeMessageColor: Color?
    
    /// The message color in dark mode, if a message is provided.
    let darkModeMessageColor: Color?
    
    /// The configuration for the primary action button, if any.
    let primaryButtonConfig: AlertButtonConfig?
    
    /// The configuration for the secondary action button, if any.
    let secondaryButtonConfig: AlertButtonConfig?
    
    /// The background color of the alert. Defaults to `.black`.
    let backgroundColor: Color = .black
    
    /// The action executed when the alert is tapped.
    let onTapGesture: () -> Void
    
    /// Creates a `DynamicIslandAlertConfig` with customizable content and actions.
    ///
    /// - Parameters:
    ///   - icon: The name of the SF Symbol used as the alert icon. Defaults to `"antenna.radiowaves.left.and.right"`.
    ///   - lightModeIconColor: The icon color in light mode. Defaults to `.green`.
    ///   - darkModeIconColor: The icon color in dark mode. Defaults to `.green`.
    ///   - title: The title of the alert. Defaults to `"Network Connection Disabled!"`.
    ///   - lightModeTitleColor: The title color in light mode. Defaults to `.black`.
    ///   - darkModeTitleColor: The title color in dark mode. Defaults to `.white`.
    ///   - message: The message displayed in the alert, if any. Defaults to a predefined message.
    ///   - lightModeMessageColor: The message color in light mode, if a message is provided. Defaults to `.gray`.
    ///   - darkModeMessageColor: The message color in dark mode, if a message is provided. Defaults to `.gray`.
    ///   - primaryButtonConfig: The configuration for the primary button. Defaults to an "OK" button.
    ///   - secondaryButtonConfig: The configuration for the secondary button. Defaults to a "Settings" button.
    ///   - onTapGesture: The action executed when the alert is tapped. Defaults to an empty closure.
    public init(
        icon: String? = "antenna.radiowaves.left.and.right",
        lightModeIconColor: Color? = .green,
        darkModeIconColor: Color? = .green,
        title: String = "Network Connection Disabled!",
        lightModeTitleColor: Color = .black,
        darkModeTitleColor: Color = .white,
        message: String? = "Please enable mobile data or connect to Wi-Fi to access data.",
        lightModeMessageColor: Color? = .gray,
        darkModeMessageColor: Color? = .gray,
        primaryButtonConfig: AlertButtonConfig? = AlertButtonConfig(title: "OK", action: {}),
        secondaryButtonConfig: AlertButtonConfig? = AlertButtonConfig(title: "Settings", action: {}),
        onTapGesture: @escaping () -> Void = {}
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
        
        self.primaryButtonConfig = primaryButtonConfig
        self.secondaryButtonConfig = secondaryButtonConfig
        self.onTapGesture = onTapGesture
    }
}
