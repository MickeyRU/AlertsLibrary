import SwiftUI

/// A protocol defining the structure and behavior of a container view used for presenting alerts.
///
/// Conforming types represent views that can display alerts with customizable configuration, gestures, and dismissal logic.
///
/// - Associated Types:
///   - `Content`: The type of the SwiftUI view displayed inside the container.
///
/// - Properties:
///   - `config`: The configuration of the container, provided via `ContainerConfig`, which includes settings for id, position, animation, gestures, and duration.
///   - `onDismiss`: An optional closure that is triggered when the container is dismissed.
///   - `viewModel`: The view model (`BasicContainerViewModel`) managing the container's gestures and dismissal state.
///
/// - Example:
/// ```swift
/// struct MyCustomContainer: ContainerViewProtocol {
///     var config: ContainerConfig
///     var onDismiss: (() -> Void)?
///     var viewModel: BasicContainerViewModel
///
///     var body: some View {
///         Text("Custom Alert")
///             .onTapGesture {
///                 onDismiss?()
///             }
///     }
/// }
/// ```
public protocol ContainerViewProtocol: View {
    associatedtype Content: View
    
    var config: ContainerConfig { get }
    var onDismiss: (() -> Void)? { get set }
    var viewModel: BasicContainerViewModel { get }
}
