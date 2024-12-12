import UIKit
import SwiftUI

final class OverlayWindowManager {
    private(set) var overlayWindow: PassThroughWindow?
    
    @MainActor
    func setupOverlayWindowIfNeeded() {
        guard overlayWindow == nil else { return }
        
        guard let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive && $0.windows.isEmpty == false }) else {
            print("Unable to find active UIWindowScene.")
            return 
        }
        
        let window = PassThroughWindow(windowScene: windowScene)
        window.backgroundColor = .clear
        window.isHidden = false
        window.isUserInteractionEnabled = true
        window.rootViewController = StatusBarBasedController()

        overlayWindow = window
    }
    
    @MainActor
    func removeOverlayWindowIfNeeded() {
        guard let overlayWindow = overlayWindow else { return }
        
        overlayWindow.rootViewController = nil
        overlayWindow.isHidden = true
        overlayWindow.windowScene = nil
        self.overlayWindow = nil
    }
}
