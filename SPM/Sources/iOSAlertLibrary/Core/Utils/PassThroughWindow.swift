import UIKit

/// UIWindow для Overlay, которое пропускает UIEvent на основной UIWindow - если они направлены вне границ Алертов
final class PassThroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event), view != rootViewController?.view else {
            return nil
        }
        return view
    }
}
