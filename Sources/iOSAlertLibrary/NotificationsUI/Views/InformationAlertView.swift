import SwiftUI

/// A view that displays an informational alert with a customizable title and message.
///
/// The `InformationAlertView` is a SwiftUI view that presents a simple alert with a title, message, and dismiss button.
/// The appearance of the alert can be customized based on the current color scheme (light or dark mode). The alert
/// includes a horizontal divider separating the title and message, and it supports a dismiss action when the user taps
/// the dismiss button.
///
/// ### Usage Example:
/// ```swift
/// InformationAlertView(config: InformationAlertConfig(
///     title: "Important Information",
///     message: "Here is a message providing more details.",
///     closeAction: { print("Alert dismissed") }
/// ))
/// ```
///
/// - Parameters:
///   - config: An ``InformationAlertConfig`` object containing the configuration for the information alert, including
///     the title, message, background color, and close action.
public struct InformationAlertView: View {
    
    /// The configuration object for the information alert view.
    let config: InformationAlertConfig
    
    /// The current color scheme of the environment (light or dark mode).
    @Environment(\.colorScheme) var colorScheme
    
    /// Initializes a new `InformationAlertView` with the given configuration.
    ///
    /// - Parameter config: An ``InformationAlertConfig`` object containing the configuration for the information alert.
    public init(config: InformationAlertConfig) {
        self.config = config
    }
    
    /// The body of the `InformationAlertView`. It constructs the layout of the information alert, including the title,
    /// message, and dismiss button, and adjusts the appearance based on the current color scheme.
    public var body: some View {
        VStack(spacing: 16) {
            HStack {
                // Title of the alert
                Text(config.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(InformationAlertColorProvider.getTitleColor(config: config, for: colorScheme))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Dismiss button
                DismissButton(action: config.closeAction)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            // Divider between the title and message
            Rectangle()
                .fill(Color(white: colorScheme == .dark ? 0.3 : 0.8))
                .frame(height: 1)
            
            // Message of the alert
            Text(config.message)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(InformationAlertColorProvider.getMessageColor(config: config, for: colorScheme))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.all, 18)
        .background(InformationAlertColorProvider.getBackgroundColor(config: config, for: colorScheme))
        .cornerRadius(25)
        .shadow(radius: 10)
        .padding(.horizontal)
    }
}
