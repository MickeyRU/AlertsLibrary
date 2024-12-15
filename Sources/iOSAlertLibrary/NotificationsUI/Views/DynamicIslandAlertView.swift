import SwiftUI

/// A view that displays a dynamic alert in the "Dynamic Island" style.
///
/// The `DynamicIslandAlertView` is a SwiftUI view designed to show an alert in the style of Apple's Dynamic Island, with a
/// customizable icon, title, message, and buttons. It is ideal for displaying brief notifications and alerts with
/// customizable behavior. The alert can include primary and secondary action buttons, and the appearance adjusts based on
/// the current color scheme (light or dark mode).
///
/// ### Usage Example:
/// ```swift
/// DynamicIslandAlertView(config: DynamicIslandAlertConfig(
///     icon: "star.circle",
///     title: "New Message",
///     message: "You have a new notification",
///     primaryButtonConfig: AlertButtonConfig(title: "OK", action: { print("OK clicked") }),
///     secondaryButtonConfig: AlertButtonConfig(title: "Cancel", action: { print("Cancel clicked") }),
///     onTapGesture: { print("Alert tapped") }
/// ))
/// ```
///
/// - Parameters:
///   - config: A ``DynamicIslandAlertConfig`` object containing the configuration for the dynamic island alert, including
///     the icon, title, message, button configurations, background color, and actions.
public struct DynamicIslandAlertView: View {
    
    /// The key window of the current application.
    let window = UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first { $0.isKeyWindow }
    
    /// The configuration object for the dynamic island alert view.
    let config: DynamicIslandAlertConfig
    
    /// The current color scheme of the environment (light or dark mode).
    @Environment(\.colorScheme) var colorScheme
    
    /// Initializes a new `DynamicIslandAlertView` with the given configuration.
    ///
    /// - Parameter config: A ``DynamicIslandAlertConfig`` object containing the configuration for the dynamic island alert.
    public init(config: DynamicIslandAlertConfig) {
        self.config = config
    }

    /// The body of the `DynamicIslandAlertView`. It constructs the layout of the dynamic island alert, including the icon,
    /// title, message, and buttons, and adjusts the appearance based on the current color scheme.
    public var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 15) {
                // Icon of the alert (optional)
                if let icon = config.icon {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(DynamicIslandAlertColorProvider.getIconColor(config: config, for: colorScheme))
                }

                // Title and message of the alert
                VStack(alignment: .leading, spacing: 2) {
                    Text(config.title)
                        .font(.headline)
                        .foregroundStyle(.white)

                    if let message = config.message {
                        Text(message)
                            .font(.subheadline)
                            .foregroundColor(DynamicIslandAlertColorProvider.getMessageColor(config: config, for: colorScheme))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.all, 10)
            .padding(.horizontal, 10)

            // Action buttons (primary and secondary)
            if let primaryButton = config.primaryButtonConfig {
                HStack {
                    AlertButton(config: primaryButton)
                    
                    if let secondaryButton = config.secondaryButtonConfig {
                        AlertButton(config: secondaryButton)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 15)
            }

        }
        .onTapGesture(perform: config.onTapGesture)
        .frame(width: ((window?.frame.width ?? 300) - 20), alignment: .top) // Fixed width for consistent appearance
        .padding(.top, 35)
        .background(config.backgroundColor)
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}
