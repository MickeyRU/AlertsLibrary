import SwiftUI

/// A view that displays a customizable alert with a title, message, and buttons.
///
/// The `AlertView` provides a UI component for showing alerts with customizable content, including an icon, title,
/// message, and actions. The appearance of the alert is dynamically adjusted for light and dark mode based on the
/// device's color scheme. You can customize the alert's appearance using the ``AlertConfig`` struct passed to the view.
///
/// ### Usage Example:
/// ```swift
/// AlertView(config: AlertConfig(title: "Alert!", message: "This is an important message.", icon: "exclamationmark.circle", dismissAction: {}))
/// ```
///
/// - Parameters:
///   - config: An ``AlertConfig`` object that contains the configuration for the alert, including the icon, title, message,
///     button configurations, and actions.

public struct AlertView: View {
    
    /// The configuration object for the alert view.
    let config: AlertConfig
    
    /// The current color scheme of the environment (light or dark mode).
    @Environment(\.colorScheme)
    var colorScheme
    
    /// Initializes a new `AlertView` with the given configuration.
    ///
    /// - Parameter config: An ``AlertConfig`` object containing the configuration for the alert.
    public init(config: AlertConfig) {
        self.config = config
    }
    
    /// The body of the `AlertView`. It constructs the layout of the alert, including the icon, title, message, and buttons,
    /// and adjusts the appearance based on the current color scheme.
    public var body: some View {
        VStack(spacing: 16) {
            // Row with icon and dismiss button
            HStack {
                Image(systemName: config.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(AlertColorProvider.getIconColor(config: config, for: colorScheme))
                    .frame(width: 45, height: 45)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                DismissButton(action: config.dismissAction)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            // Title of the alert
            Text(config.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(AlertColorProvider.getTitleColor(config: config, for: colorScheme))
                .frame(maxWidth: .infinity, alignment: .leading)

            // Message of the alert
            Text(config.message)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(AlertColorProvider.getMessageColor(config: config, for: colorScheme))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Action buttons (cancel and continue)
            HStack {
                if let cancelButtonConfig = config.cancelButtonConfig {
                    AlertButton(config: cancelButtonConfig)
                }
                AlertButton(config: config.continueButtonConfig)
            }
        }
        .padding(.all, 18)
        .background(AlertColorProvider.getBackgroundColor(config: config, for: colorScheme))
        .cornerRadius(25)
        .shadow(radius: 10)
        .padding(.horizontal)
    }
}
