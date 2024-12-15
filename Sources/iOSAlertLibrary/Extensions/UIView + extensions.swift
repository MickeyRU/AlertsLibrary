import UIKit

extension UIView {
    func removeSubview(withIdentifier identifier: String) {
        subviews.first(where: { $0.accessibilityIdentifier == identifier })?.removeFromSuperview()
    }
}

extension UIView {
    func calculateFittingSize(maxWidth: CGFloat, maxHeight: CGFloat) -> CGSize? {
        let fittingSize = CGSize(width: maxWidth, height: maxHeight)
        translatesAutoresizingMaskIntoConstraints = false
        setNeedsLayout()
        layoutIfNeeded()
        return systemLayoutSizeFitting(
            fittingSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
    }
}
