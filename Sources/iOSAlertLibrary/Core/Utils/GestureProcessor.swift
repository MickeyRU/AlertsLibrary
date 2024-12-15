import SwiftUI

final class GestureProcessor {
    private let swipeThresholds: [SwipeDirection: CGFloat]
    let hasTapGesture: Bool
    
    init(gestures: [AlertGestureConfigEnum]) {
        var tapGestureDetected = false
        var thresholds: [SwipeDirection: CGFloat] = [:]
        
        for gesture in gestures {
            switch gesture {
            case .tap:
                tapGestureDetected = true
            case .swipe(let directions, let threshold):
                for direction in directions {
                    thresholds[direction] = max(thresholds[direction] ?? 0, threshold)
                }
            case .none:
                break
            }
        }
        
        self.hasTapGesture = tapGestureDetected
        self.swipeThresholds = thresholds
    }
    
    func shouldDismissOnSwipe(value: DragGesture.Value) -> Bool {
        let horizontalTranslation = value.translation.width
        let verticalTranslation = value.translation.height

        for (direction, threshold) in swipeThresholds {
            switch direction {
            case .left:
                if horizontalTranslation < -threshold &&
                    abs(horizontalTranslation) > abs(verticalTranslation) {
                    return true
                }
            case .right:
                if horizontalTranslation > threshold &&
                    abs(horizontalTranslation) > abs(verticalTranslation) {
                    return true
                }
            case .up:
                if verticalTranslation < -threshold &&
                    abs(verticalTranslation) > abs(horizontalTranslation) {
                    return true
                }
            case .down:
                if verticalTranslation > threshold &&
                    abs(verticalTranslation) > abs(horizontalTranslation) {
                    return true
                }
            }
        }
        return false
    }
}
