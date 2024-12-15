/// A configuration for an expanded toast message with additional information.
///
/// The `ExpandedToastConfig` struct is used to configure an expanded toast message, which displays a title,
/// a description with more detailed information, and a button to acknowledge the message. The style of the
/// toast (e.g., success, error, info) and the button's appearance are also customizable. See ``ToastStyle``
/// for more details on the available toast styles.
public struct ExpandedToastConfig {
    /// The title of the expanded toast message.
    let title: String 
    
    /// The detailed description of the expanded toast message.
    let description: String
    
    /// The style of the toast message, determining the background and button colors.
    /// For more information on available styles, refer to ``ToastStyle``.
    let style: ToastStyle
    
    /// The configuration of the button displayed in the expanded toast.
    let buttonConfig: AlertButtonConfig
    
    /// Creates a new `ExpandedToastConfig` with customizable content and button configuration.
    ///
    /// - Parameters:
    ///   - title: The title of the expanded toast message. Defaults to a sample title.
    ///   - description: The detailed description of the expanded toast message. Defaults to a sample description.
    ///   - style: The style of the toast (success, error, info, warning). Defaults to `.info`. See ``ToastStyle`` for available styles.
    ///   - buttonConfig: The configuration of the button displayed in the toast. Defaults to a button with the
    ///     title `"Ok, I got it!"` and a style of `.info`.
    public init(
        title: String = "This is an expanded toast message.",
        description: String = "This type of message is used to display more information about the toast. This type of message is used to display more information about the toast. This type of message is used to display more information about the toast. This type of message is used to display more information about the toast. This type of message is used to display more information about the toast. This type of message is used to display more information about the toast.",
        style: ToastStyle = .info,
        buttonConfig: AlertButtonConfig = AlertButtonConfig(title: "Ok, I got it!", style: .info, action: {})
    ) {
        self.title = title
        self.description = description
        self.style = style
        self.buttonConfig = buttonConfig
    }
}
