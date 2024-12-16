import SwiftUI

/// Defines the types of animations available for alert presentation.
///
/// This enumeration specifies the animation styles that can be applied when presenting or dismissing alerts.
///
/// - Cases:
///   - `slide`: Moves the alert into view with a sliding animation.
///   - `scale`: Scales the alert into view, starting from a smaller or larger size.
///   - `bounce`: Adds a bouncing effect when the alert appears or disappears.
///   - `dynamicIsland`: A custom animation resembling the style used in the Dynamic Island on iOS.
///
/// - Example:
/// ```swift
/// let animationType: AnimationType = .bounce
/// ```
public enum AnimationType {
    case slide
    case scale
    case bounce
    case dynamicIsland
}
