import SwiftUI
/// A basic container view for presenting content with configurable animations and gestures.
///
/// This view wraps custom content and provides built-in support for dismissing alerts through animations and gestures,
/// as defined in the `ContainerConfig` and `BasicContainerViewModel`.
///
/// - Generics:
///   - `Content`: The type of the view content to be displayed within the container.
///
/// - Properties:
///   - `config`: The configuration for the container, including animation and gesture settings, provided via `ContainerConfig`.
///   - `viewModel`: The view model (`BasicContainerViewModel`) that manages gestures and dismissal logic.
///   - `onDismiss`: An optional closure that is called when the alert is dismissed.
///   - `animateAlert`: A private state controlling the visibility of the alert during animations.
///
/// - Initializer:
///   - `content`: The view to be displayed inside the container.
///   - `containerConfig`: The configuration for the container's behavior and appearance.
///   - `onDismiss`: An optional closure to handle the dismissal of the alert.
///
/// - Methods:
///   - `showAlertWithAnimation()`: Triggers the alert's appearance with animation and starts a dismissal timer if a duration is set.
///   - `dismissWithAnimation()`: Animates the alert's disappearance and calls `onDismiss` when the animation is complete.
///
/// - Gestures:
///   Supports swipe and tap gestures for dismissing the alert, as configured in `ContainerConfig`.
///
/// - Example:
/// ```swift
/// let containerConfig = ContainerConfig(
///     id: "alert1",
///     gestures: [.swipe(direction: [.up]), .tap],
///     animationType: .slide,
///     duration: 5
/// )
///
/// let alert = BasicContainerView(
///     content: Text("Hello, World!"),
///     containerConfig: containerConfig
/// ) {
///     print("Alert dismissed")
/// }
///
/// // Add `alert` to your SwiftUI hierarchy to display.
/// ```
public struct BasicContainerView<Content: View>: ContainerViewProtocol {
    public let config: ContainerConfig
    public let viewModel: BasicContainerViewModel
    public var onDismiss: (() -> Void)?
    
    private var content: Content
    
    @State private var animateAlert: Bool = false
    
    public init(content: Content,
         containerConfig: ContainerConfig,
         onDismiss: (() -> Void)? = nil) {
        self.content = content
        self.config = containerConfig
        self.onDismiss = onDismiss
        self.viewModel = BasicContainerViewModel(gestures: containerConfig.gestures)
    }
    
    public var body: some View {
        content
            .applySomeModifier(type: config.animationType, config: config.animationConfig, isAnimating: animateAlert)
            .onAppear {
                showAlertWithAnimation()
            }
            .onReceive(viewModel.$shouldDismiss) { shouldDismiss in
                if shouldDismiss {
                    dismissWithAnimation()
                }
            }
            .gesture(
                ExclusiveGesture(
                    DragGesture()
                        .onEnded { value in
                            if viewModel.shouldDismissOnSwipe(value: value) {
                                dismissWithAnimation()
                            }
                        },
                    TapGesture()
                        .onEnded { _ in
                            if viewModel.shouldDismissOnTap() {
                                dismissWithAnimation()
                            }
                        }
                )
            )
    }
    
    
    /// Показываем алерт с анимацией
    private func showAlertWithAnimation() {
        Task {
            withAnimation(.smooth) {
                animateAlert = true
            }
            guard let duration = config.duration else { return }
            try await Task.sleep(for: .seconds(duration < 1 ? 1 : duration))
            dismissWithAnimation()
        }
    }
    
    /// Анимация исчезновения
    private func dismissWithAnimation() {
        Task {
            withAnimation(.easeInOut(duration: 0.3)) {
                animateAlert = false
            }
            try await Task.sleep(nanoseconds: 300_000_000)
            onDismiss?()
        }
    }
}
