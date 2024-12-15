import SwiftUI

/// Configuration for custom animations used in alert presentation.
///
/// This structure defines animation parameters such as offset, opacity, and scale effect, which can be applied during the appearance and disappearance of alerts.
///
/// - Properties:
///   - offset: A tuple defining the animation's start and end positions along the X and Y axes.
///     - `x`: Horizontal offset, with `start` being the initial position and `end` the final position.
///     - `y`: Vertical offset, with `start` being the initial position and `end` the final position.
///   - opacity: A tuple specifying the opacity transition, where `start` is the initial opacity and `end` is the final opacity.
///   - scaleEffect: A tuple specifying the starting scale and its anchor point, controlling the scale animation effect.
///
/// - Example:
/// ```swift
/// let animation = AnimationConfig(
///     offset: (x: (start: -100, end: 0), y: (start: 0, end: 0)),
///     opacity: (start: 0.0, end: 1.0),
///     scaleEffect: (from: 0.5, anchor: .center)
/// )
/// ```
public struct AnimationConfig {
    let offset: (x: (start: CGFloat, end: CGFloat), y: (start: CGFloat, end: CGFloat))?
    let opacity: (start: Double, end: Double)?
    let scaleEffect: (from: CGFloat, anchor: UnitPoint)?
    
    public init(
        offset: (x: (start: CGFloat, end: CGFloat),
                 y: (start: CGFloat, end: CGFloat))? = nil,
        opacity: (start: Double, end: Double)? = nil,
        scaleEffect: (from: CGFloat, anchor: UnitPoint)? = nil
    ) {
        self.offset = offset
        self.opacity = opacity
        self.scaleEffect = scaleEffect
    }
}
