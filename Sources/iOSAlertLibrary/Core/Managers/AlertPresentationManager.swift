import SwiftUI

final class AlertPresentationManager {
    private let overlayWindowManager: OverlayWindowManager
    private var alerts: [String: BasicContainerViewModel] = [:]
    private var isOrientationObserverAdded: Bool = false
    
    init(overlayWindowManager: OverlayWindowManager = OverlayWindowManager()) {
        self.overlayWindowManager = overlayWindowManager
    }
    
    @MainActor
    func show<Container: ContainerViewProtocol> (container: Container) {
        
        guard let hostingController = prepareHostingController(container: container,
                                                               uniqueID: container.config.id) else {
            print("Error: Can't prepare HostingController for \(container)")
            return
        }
        
        addAlertToOverlayWindow(hostingController: hostingController,
                                containerConfig: container.config,
                                containerViewModel: container.viewModel)
    }
    
    @MainActor
    func dismiss(id: String) {
        guard let alert = alerts[id] else {
            print("Error: ID not found in alerts")
            return
        }
        alert.shouldDismiss = true
    }
    
    @MainActor
    private func prepareHostingController<Container: ContainerViewProtocol>(container: Container, uniqueID: String) -> DynamicUIHostingController<Container>? {
        var containerWithDismiss = container
        
        containerWithDismiss.onDismiss = { [weak self] in
            Task { @MainActor in
                self?.removeAlertView(identifier: uniqueID)
            }
        }
        
        let hostingController = DynamicUIHostingController(rootView: containerWithDismiss)
        hostingController.view.accessibilityIdentifier = uniqueID
        hostingController.view.backgroundColor = .clear
        
        hostingController.onLayoutChange = { [weak self] newSize in
            guard let self = self else { return }
            
            let maxWidth = UIScreen.main.bounds.width
            let maxHeight = UIScreen.main.bounds.height
            let clampedSize = CGSize(width: min(maxWidth, newSize.width),
                                     height: min(maxHeight, newSize.height))
            
            self.updateFrame(for: hostingController,
                             newSize: clampedSize,
                             position: container.config.position)
        }
        
        return hostingController
    }
    
    @MainActor
    private func addAlertToOverlayWindow(
        hostingController: DynamicUIHostingController<some View>,
        containerConfig: ContainerConfig,
        containerViewModel: BasicContainerViewModel
    ) {
        
        overlayWindowManager.setupOverlayWindowIfNeeded()
        
        guard let overlayWindow = overlayWindowManager.overlayWindow else {
            print("Error: Can't create overlay window")
            return
        }
        
        guard let containerSize = hostingController.view?.calculateFittingSize(maxWidth: overlayWindow.bounds.width, maxHeight: overlayWindow.bounds.height) else { return }
        
        if containerConfig.position == .dynamicIsland {
            updateStatusBar(for: overlayWindow, to: .darkContent)
        }
        
        let frame = containerConfig.position.calculateFrame(
            for: containerSize,
            in: overlayWindow
        )
        hostingController.view.frame = frame
        
        overlayWindow.rootViewController?.addChild(hostingController)
        overlayWindow.rootViewController?.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: overlayWindow.rootViewController)
        
        alerts[containerConfig.id] = containerViewModel
        
        addOrientationObserver(
            for: containerSize,
            position: containerConfig.position,
            hostingController: hostingController,
            window: overlayWindow
        )
    }
    
    @MainActor
    private func updateStatusBar(for window: UIWindow?, to style: UIStatusBarStyle) {
        guard let rootViewController = window?.rootViewController else {
            print("Error: Root view controller not found")
            return
        }
        
        if let statusBarController = rootViewController as? StatusBarBasedController {
            statusBarController.updateStatusBarStyle(style)
        }
    }
    
    @MainActor
    private func updateFrame(
        for hostingController: DynamicUIHostingController<some View>,
        newSize: CGSize,
        position: AlertPositionEnum
    ) {
        guard let window = hostingController.view.window else {
            print("Error: Unable to retrieve window for hostingController")
            return
        }
        
        let newFrame = position.calculateFrame(for: newSize, in: window)
        
        hostingController.view.frame = newFrame
    }
    
    @MainActor
    private func removeAlertView(identifier: String) {
        guard let alert = alerts.removeValue(forKey: identifier),
              let overlayWindow = overlayWindowManager.overlayWindow else {
            print("Error: Can't create overlay window / find Alert by identifier: \(identifier)")
            return
        }
        
        overlayWindow.rootViewController?.view?.removeSubview(withIdentifier: identifier)
        
        if overlayWindow.rootViewController?.view?.subviews.isEmpty == true {
            updateStatusBar(for: overlayWindow, to: .default)
            overlayWindowManager.removeOverlayWindowIfNeeded()
        }
        
        clearObserversIfNeeded()
    }
    
    @MainActor
    private func getKeyWindow() -> UIWindow? {
        UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}

// MARK: - Поддержка смены ориентации экрана

extension AlertPresentationManager {
    private func addOrientationObserver(
        for containerSize: CGSize,
        position: AlertPositionEnum,
        hostingController: UIHostingController<some View>,
        window: UIWindow
    ) {
        guard !isOrientationObserverAdded else { return }
        isOrientationObserverAdded = true
        
        NotificationCenter.default.addObserver(
            forName: UIDevice.orientationDidChangeNotification,
            object: nil,
            queue: .main
        ) { _ in
            Task { @MainActor in
                let newFrame = position.calculateFrame(for: containerSize, in: window)
                hostingController.view.frame = newFrame
            }
        }
    }
    
    private func clearObserversIfNeeded() {
        if alerts.isEmpty {
            NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
            isOrientationObserverAdded = false
        }
    }
}
