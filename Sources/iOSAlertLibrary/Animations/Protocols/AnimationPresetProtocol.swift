import SwiftUI

/// A protocol defining a preset animation behavior for modifying a SwiftUI view.
///
/// Conforming types are responsible for applying a predefined animation effect to a view, using the provided configuration and animation state.
///
/// - Properties:
///   - `config`: The animation configuration, defined by `AnimationConfig`, that specifies the animation's parameters (e.g., offset, opacity, scale).
///   - `isAnimating`: A Boolean value indicating whether the animation is currently active.
///
/// - Conformance:
/// Types conforming to `AnimationPresetProtocol` should implement `body(content:)` to apply the animation logic to the SwiftUI view.
///
/// - Example:
/// ```swift
/// struct BounceAnimation: AnimationPresetProtocol {
///     var config: AnimationConfig
///     var isAnimating: Bool
///
///     func body(content: Content) -> some View {
///         content
///             .offset(x: isAnimating ? config.offset?.x.end ?? 0 : config.offset?.x.start ?? 0,
///                     y: isAnimating ? config.offset?.y.end ?? 0 : config.offset?.y.start ?? 0)
///             .opacity(isAnimating ? config.opacity?.end ?? 1 : config.opacity?.start ?? 0)
///             .scaleEffect(isAnimating ? 1 : config.scaleEffect?.from ?? 1, anchor: config.scaleEffect?.anchor ?? .center)
///             .animation(.easeInOut, value: isAnimating)
///     }
/// }
/// ```
protocol AnimationPresetProtocol: ViewModifier {
    var config: AnimationConfig { get }
    var isAnimating: Bool { get }
}
