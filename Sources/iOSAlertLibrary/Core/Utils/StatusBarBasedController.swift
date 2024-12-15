import UIKit

/// Позволяет менять цвета статус бара для Dynamic Island баннеров
final class StatusBarBasedController: UIViewController {
    private var preferredStyle: UIStatusBarStyle = .default
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return preferredStyle
    }
    
    func updateStatusBarStyle(_ style: UIStatusBarStyle) {
        preferredStyle = style
        setNeedsStatusBarAppearanceUpdate()
    }
}
