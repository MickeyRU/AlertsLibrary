import UIKit

/// Defines the possible positions for displaying an alert on the screen.
public enum AlertPositionEnum: Sendable {
    case top, center, bottom, dynamicIsland
    
    @MainActor
    func calculateOrigin(for size: CGSize, in window: UIWindow) -> CGPoint {
           let windowSize = window.bounds.size
           let safeAreaInsets = window.safeAreaInsets
           
           let topInset = safeAreaInsets.top > 0 ? safeAreaInsets.top : 20
           
           switch self {
           case .top:
               return CGPoint(x: (windowSize.width - size.width) / 2,
                              y: topInset)
           case .center:
               return CGPoint(x: (windowSize.width - size.width) / 2,
                              y: (windowSize.height - size.height) / 2)
           case .bottom:
               return CGPoint(x: (windowSize.width - size.width) / 2,
                              y: windowSize.height - size.height - safeAreaInsets.bottom)
           case .dynamicIsland:
               return  CGPoint(x: (windowSize.width - size.width) / 2,
                               y: topInset > 20 ? topInset - 113 : 20)
           }
       }
}

extension AlertPositionEnum {
    @MainActor
    func calculateFrame(for size: CGSize, in window: UIWindow) -> CGRect {
        let origin = calculateOrigin(for: size, in: window)
        return CGRect(origin: origin, size: size)
    }
}
