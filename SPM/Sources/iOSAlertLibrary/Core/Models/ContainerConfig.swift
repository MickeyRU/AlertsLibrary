import SwiftUI

/// Configuration for the container that determines its behavior and appearance.
///
/// This structure holds various settings used to customize the presentation and behavior of a container,
/// including its position, gestures, animations, and duration.
///
/// - Properties:
///   - `id`: A unique identifier for the container.
///   - `duration`: The duration in seconds that the container remains visible before dismissing automatically.
///     If `nil`, the container will not dismiss automatically.
///   - `position`: The position of the container on the screen, defined by `AlertPositionEnum`.
///   - `gestures`: A list of gestures (`AlertGestureConfigEnum`) that can be used to dismiss the container.
///   - `animationType`: The type of animation to use for the container, defined by `AnimationType`.
///   - `animationConfig`: Detailed animation settings, including offset, opacity, and scaling, defined by `AnimationConfig`.
///
/// - Example:
/// ```swift
/// let config = ContainerConfig(
///     id: "alert1",
///     duration: 5,
///     position: .top,
///     gestures: [.swipe(direction: [.up], threshold: 20), .tap],
///     animationType: .slide,
///     animationConfig: AnimationConfig(
///         offset: (x: (start: 0, end: 0), y: (start: -50, end: 0)),
///         opacity: (start: 0.0, end: 1.0),
///         scaleEffect: nil
///     )
/// )
/// ```
public struct ContainerConfig {
    let id: String
    var duration: CGFloat?
    var position: AlertPositionEnum
    var gestures: [AlertGestureConfigEnum]
    var animationType: AnimationType
    var animationConfig: AnimationConfig
    
    public init(id: String,
                duration: CGFloat? = nil,
                position: AlertPositionEnum,
                gestures: [AlertGestureConfigEnum],
                animationType: AnimationType,
                animationConfig: AnimationConfig) {
        self.id = id
        self.duration = duration
        self.position = position
        self.gestures = gestures
        self.animationType = animationType
        self.animationConfig = animationConfig
    }
}
