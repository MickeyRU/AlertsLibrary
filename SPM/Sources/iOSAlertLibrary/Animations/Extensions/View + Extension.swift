import SwiftUI

extension View {
    func applySomeModifier(type: AnimationType, config: AnimationConfig, isAnimating: Bool) -> some View {
        self
            .modifier(AnimationPreset(animationType: type, config: config, isAnimating: isAnimating))
    }
}
