import SwiftUI

public final class iOSAlertLibary {
    private let presentationManager = AlertPresentationManager()
    
    public init() { }
    
    /// Presents a container (configured alert) conforming to `ContainerViewProtocol` on the screen.
    ///
    /// This method displays a SwiftUI `View` wrapped in a container on the screen.
    /// The container acts as a wrapper that provides configuration and behavior for the presented view.
    /// The alert will be displayed in a new overlay `UIWindow`.
    ///
    /// - Parameters:
    ///   - container: A container conforming to `ContainerViewProtocol` that wraps the view to be displayed and manages its presentation.
    ///
    /// - Note: Any SwiftUI `View` can be shown by wrapping it in a container conforming to `ContainerViewProtocol`.
    ///
    /// - Example:
    /// ```swift
    /// alertManager.show(container: myContainer, useOverlayWindow: true)
    /// ```
    @MainActor
    public func showAlert<Container: ContainerViewProtocol>(container: Container) {
        presentationManager.show(container: container)
    }
    
    /// Dismisses a container (alert) from the screen by its unique identifier.
    ///
    /// This method removes the container with the specified `id` from the screen.
    /// The `id` must match the unique identifier of the container used when the alert was presented.
    /// If no container with the given `id` exists, the method does nothing.
    ///
    /// - Parameter id: The unique identifier of the container to be dismissed.
    ///
    /// - Note: Use the same `id` that was specified when presenting the container.
    ///   This ensures the correct alert is dismissed.
    ///
    /// - Example:
    /// ```swift
    /// // Present a container(configured alert) with a specific ID
    /// alertManager.showAlert(container: myContainer)
    ///
    /// // Dismiss the container(configured alert) by its ID
    /// alertManager.dismissAlert(id: myContainer.config.id)
    /// ```
    @MainActor
    public func dismissAlert(id: String) {
        presentationManager.dismiss(id: id)
    }
}
