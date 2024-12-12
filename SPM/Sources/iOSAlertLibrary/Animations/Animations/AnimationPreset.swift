import SwiftUI

struct AnimationPreset: ViewModifier {
    let animationType: AnimationType
    let config: AnimationConfig
    let isAnimating: Bool
    
    @State private var viewHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        switch animationType {
        case .slide:
            content
                .opacity(isAnimating ? config.opacity?.end ?? 1 : config.opacity?.start ?? 0)
                .offset(
                    x: isAnimating ? config.offset?.x.end ?? 0 : config.offset?.x.start ?? 0,
                    y: isAnimating ? config.offset?.y.end ?? 0 : config.offset?.y.start ?? 0
                )
        case .scale:
            content
                .opacity(isAnimating ? config.opacity?.end ?? 1 : config.opacity?.start ?? 0)
                .scaleEffect(isAnimating ? 1.0 : config.scaleEffect?.from ?? 0.5, anchor: config.scaleEffect?.anchor ?? .center)
        case .bounce:
            content
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1.0 : 0.5)
                .rotationEffect(isAnimating ? .degrees(0) : .degrees(-10))
                .animation(
                    isAnimating
                    ? .spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.2)
                    : .easeOut(duration: 0.2),
                    value: isAnimating
                )
        case .dynamicIsland:
            content
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                if viewHeight == 0 {
                                    viewHeight = geometry.size.height / 2
                                }
                            }
                    }
                )
                .blur(radius: isAnimating ? 0 : 10)
                .scaleEffect( isAnimating ? 1 : 0)
                .offset(x: 0, y: isAnimating ? 0 : -(viewHeight))
        }
    }
}
