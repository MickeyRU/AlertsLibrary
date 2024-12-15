import SwiftUI

/// A view that displays a toast message with customizable configuration.
///
/// The `ToastView` provides a UI component for displaying toast messages in your app. It supports expandable and
/// collapsible states, allowing the toast to show more details when tapped. The appearance and behavior of the toast
/// are customizable through the `ToastConfig` struct passed to the view.
///
/// ### Usage Example:
/// ```swift
/// ToastView(config: ToastConfig(message: "This is a success toast!", style: .success))
/// ```
///
/// - Parameters:
///   - config: A `ToastConfig` object that contains the configuration for the toast message. It specifies the
///     message, style, expandability, and button configurations for the toast.
///
/// - See Also:
///   - ``ToastConfig``: The configuration struct for the toast message.

public struct ToastView: View {
    
    /// The configuration object for the toast view.
    let config: ToastConfig
    
    /// Namespace used for animating the expansion and collapse of the toast view.
    @Namespace private var namespace
    
    /// A state variable to manage the expanded/collapsed state of the toast.
    @State private var isExpanded: Bool = false
    
    /// Initializes a new `ToastView` with a given configuration.
    ///
    /// - Parameter config: A ``ToastConfig`` object that contains the configuration for the toast message.
    public init(config: ToastConfig) {
        self.config = config
    }
    
    /// The body of the `ToastView`. It switches between expanded and collapsed toast views based on the `isExpanded`
    /// state, and supports tap gestures to toggle between the two states.
    public var body: some View {
        VStack {
            // If the toast is expandable, display either the expanded or collapsed view based on `isExpanded`.
            if config.isExpandable {
                if isExpanded {
                    ExpandedToastView(config: config, isExpanded: $isExpanded, namespace: namespace)
                } else {
                    CollapsedToastView(config: config, isExpanded: $isExpanded, namespace: namespace)
                }
            } else {
                // If the toast is not expandable, always show the collapsed view.
                CollapsedToastView(config: config, isExpanded: $isExpanded, namespace: namespace)
            }
        }
        // On tap gesture, toggle the expansion state with an animation.
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.3)) {
                isExpanded.toggle()
            }
        }
    }
}
