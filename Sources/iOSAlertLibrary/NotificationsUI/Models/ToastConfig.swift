/// A configuration for displaying a toast message with customizable style, width, and expandability.
///
/// The `ToastConfig` struct is used to configure a toast message, including the message content, style,
/// width, and the action when the toast is closed. It also supports expandable toast configurations, which
/// provide additional information when expanded.
///
/// - Parameters:
///   - message: The content of the toast message. Default is "This is a success toast message."
///   - style: The style of the toast, defined by the ``ToastStyle`` enum. You can customize the appearance
///     based on the context of the message. Default is `.success`.
///   - maxWidth: The maximum width of the toast. Default is `.infinity` (full width).
///   - closeAction: The action to be executed when the toast is closed. Default is an empty closure.
///   - isExpandable: A flag indicating whether the toast can be expanded. Default is `true`.
///   - expandedToastConfig: The configuration for the expanded toast view, which appears when the toast
///     is expanded. Default is a new ``ExpandedToastConfig``.
///
/// For more details on available styles, refer to the ``ToastStyle`` enum documentation.
public struct ToastConfig {
    /// The content of the toast message.
    let message: String
    
    /// The style of the toast, defined by the ``ToastStyle`` enum.
    let style: ToastStyle
    
    /// The maximum width of the toast message.
    let maxWidth: Double
    
    /// The action to be executed when the toast is closed.
    let closeAction: () -> Void
    
    /// A flag indicating whether the toast is expandable.
    let isExpandable: Bool
    
    /// The configuration for the expanded toast view.
    let expandedToastConfig: ExpandedToastConfig?
    
    /// Initializes a new `ToastConfig` instance.
    ///
    /// - Parameters:
    ///   - message: The content of the toast message. Default is "This is a success toast message."
    ///   - style: The style of the toast, defined by the ``ToastStyle`` enum. Default is `.success`.
    ///   - maxWidth: The maximum width of the toast. Default is `.infinity`.
    ///   - closeAction: The action to be executed when the toast is closed. Default is an empty closure.
    ///   - isExpandable: A flag indicating whether the toast is expandable. Default is `true`.
    ///   - expandedToastConfig: The configuration for the expanded toast view. Default is a new ``ExpandedToastConfig``.
    public init(
        message: String = "This is a success toast message.",
        style: ToastStyle = .success,
        maxWidth: Double = .infinity,
        closeAction: @escaping () -> Void = {},
        isExpandable: Bool = true,
        expandedToastConfig: ExpandedToastConfig? = ExpandedToastConfig()
    ) {
        self.message = message
        self.style = style
        self.maxWidth = maxWidth
        self.closeAction = closeAction
        self.isExpandable = isExpandable
        self.expandedToastConfig = expandedToastConfig
    }
}
