import SwiftUI
/// Defines the gestures supported for dismissing an alert.
///
/// This enumeration specifies the types of gestures that can be configured for dismissing an alert.
/// These gestures are used in combination with the container's view to provide an interactive way to close the alert.
///
/// - Cases:
///   - `swipe(direction: [SwipeDirection], threshold: CGFloat)`: A swipe gesture with specified directions and a threshold distance.
///     - `direction`: The allowed swipe directions (`left`, `right`, `up`, `down`).
///     - `threshold`: The minimum distance the swipe must travel to trigger dismissal.
///   - `tap`: A single tap gesture to dismiss the alert.
///   - `none`: No gesture interaction is configured.
///
/// - Example:
/// ```swift
/// let gestureConfig: AlertGestureConfigEnum = .swipe(direction: [.up, .down], threshold: 20)
/// ```
public enum AlertGestureConfigEnum {
    case swipe(direction: [SwipeDirection], threshold: CGFloat) /// threshold - порог для определения swipe
    case tap
    case none
}
/// Specifies the possible directions for a swipe gesture.
///
/// Used in combination with `AlertGestureConfigEnum.swipe` to define the swipe directions that trigger dismissal.
///
/// - Cases:
///   - `left`: A swipe to the left.
///   - `right`: A swipe to the right.
///   - `up`: A swipe upwards.
///   - `down`: A swipe downwards.
///
/// - Example:
/// ```swift
/// let directions: [SwipeDirection] = [.left, .up]
/// ```
public enum SwipeDirection {
    case left, right, up, down
}
