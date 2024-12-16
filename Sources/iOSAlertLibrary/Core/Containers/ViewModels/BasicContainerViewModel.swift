import SwiftUI
/// A view model for managing the behavior and interactions of a basic alert container.
///
/// This class handles gesture-based interactions, such as swipe and tap gestures, to determine whether an alert should be dismissed.
///
/// - Properties:
///   - `shouldDismiss`: A published Boolean value indicating whether the container should be dismissed.
///   - `gestureProcessor`: A private instance of `GestureProcessor`, responsible for handling configured gestures.
///
/// - Initializer:
///   - `gestures`: An array of `AlertGestureConfigEnum` values, defining the gestures supported by the container.
///
/// - Methods:
///   - `shouldDismissOnSwipe(value:)`: Determines if the container should be dismissed based on the provided swipe gesture.
///   - `shouldDismissOnTap()`: Checks if a tap gesture is configured for dismissal.
///
/// - Example:
/// ```swift
/// let viewModel = BasicContainerViewModel(gestures: [.swipe(direction: [.up]), .tap])
///
/// // Check dismissal logic
/// if viewModel.shouldDismissOnTap() {
///     // Handle tap dismissal
/// }
///
/// // Swipe dismissal example
/// let dragValue = DragGesture.Value(...) // gesture data
/// if viewModel.shouldDismissOnSwipe(value: dragValue) {
///     // Handle swipe dismissal
/// }
/// ```
public final class BasicContainerViewModel {
    private let gestureProcessor: GestureProcessor
    
    @Published var shouldDismiss: Bool = false
    
    init(gestures: [AlertGestureConfigEnum]) {
        self.gestureProcessor = GestureProcessor(gestures: gestures)
    }
    
    func shouldDismissOnSwipe(value: DragGesture.Value) -> Bool {
        gestureProcessor.shouldDismissOnSwipe(value: value)
    }
    
    func shouldDismissOnTap() -> Bool {
        gestureProcessor.hasTapGesture
    }
}
