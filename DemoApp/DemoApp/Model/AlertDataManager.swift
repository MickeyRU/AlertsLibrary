import SwiftUI
import iOSAlertLibrary

@MainActor
final class AlertDataManager {
    private let iosAlertlibrary: iOSAlertLibary
    
    /// Хранилище для ID алертов
    private var alertIDsBySection: [AlertSectionType: [String]] = [:]
    
    init() {
        self.iosAlertlibrary = iOSAlertLibary()
    }
    
    func setupSections() -> [AlertSection]  {
        return [
            AlertSection(
                title: AlertSectionType.toasts.rawValue,
                buttons: [
                    AlertButton(title: "Short Toast - top, slide") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .toasts)
                        let alertConfig = ToastConfig(message: "Transaction was completed successfully!",
                                                      style: .success,
                                                      maxWidth: .infinity,
                                                      closeAction: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
                                                      isExpandable: false,
                                                      expandedToastConfig: nil)
                        
                        let alert = ToastView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 3,
                                                              position: .top,
                                                              gestures: [.swipe(direction: [.up], threshold: 20)],
                                                              animationType: .slide,
                                                              animationConfig: AnimationConfig(offset: (x: (start: -50, end: 0), y: (start: 0, end: 0)),
                                                                                               opacity: (start: 0, end: 1),
                                                                                               scaleEffect: (from: 1, anchor: .center)))
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    },
                    AlertButton(title: "Short Toast 2 - top, slide") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .toasts)
                        let alertConfig = ToastConfig(message: "Transaction failed! Try again!",
                                                      style: .error,
                                                      maxWidth: .infinity,
                                                      closeAction: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id)},
                                                      isExpandable: false,
                                                      expandedToastConfig: nil)
                        
                        let alert = ToastView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 3,
                                                              position: .top,
                                                              gestures: [.swipe(direction: [.up], threshold: 20)],
                                                              animationType: .slide,
                                                              animationConfig: AnimationConfig(offset: (x: (start: -50, end: 0), y: (start: 0, end: 0)),
                                                                                               opacity: (start: 0, end: 1),
                                                                                               scaleEffect: (from: 1, anchor: .center)))
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    },
                    AlertButton(title: "Short Toast - bottom, slide") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .toasts)
                        let alertConfig = ToastConfig(message: "Battery percentage is low! Charge your phone!",
                                                      style: .warning,
                                                      maxWidth: .infinity,
                                                      closeAction: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
                                                      isExpandable: false,
                                                      expandedToastConfig: nil)
                        
                        let alert = ToastView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 3,
                                                              position: .bottom,
                                                              gestures: [.swipe(direction: [.down], threshold: 20)],
                                                              animationType: .slide,
                                                              animationConfig: AnimationConfig(offset: (x: (start: 0, end: 0), y: (start: 50, end: 0)),
                                                                                               opacity: (start: 0, end: 1),
                                                                                               scaleEffect: (from: 0.5, anchor: .center)))
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    },
                    AlertButton(title: "Expanded Toast - mid, bounce") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .toasts)
                        let alertConfig = ToastConfig(message: "Update your payment info!",
                                                      style: .info,
                                                      maxWidth: .infinity,
                                                      closeAction: {},
                                                      isExpandable: true,
                                                      expandedToastConfig: ExpandedToastConfig(title: "Update your payment info!",
                                                                                               description: "The saved credit card for your account has expired. Update your payment information to complete the purchase. \n\n[TEST]The saved credit card for your account has expired. Update your payment information to complete the purchase. \n[TEST]The saved credit card for your account has expired. Update your payment information to complete the purchase.",
                                                                                               style: .info,
                                                                                               buttonConfig: AlertButtonConfig(title: "I got it!",
                                                                                                                               style: .info,
                                                                                                                               action: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id)})))
                        
                        let alert = ToastView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 5,
                                                              position: .center,
                                                              gestures: [.swipe(direction: [.left], threshold: 20)],
                                                              animationType: .bounce,
                                                              animationConfig: AnimationConfig())
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    },
                ]
            ),
            AlertSection(
                title: AlertSectionType.islandBanner.rawValue,
                buttons: [
                    AlertButton(title: "Island Banner") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .islandBanner)
                        let alertConfig = DynamicIslandAlertConfig(primaryButtonConfig: AlertButtonConfig(title: "OK",
                                                                                                          action: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
                                                                                                          lightModeBackgroundColor: .gray,
                                                                                                          darkModeBackgroundColor: .gray),
                                                                   secondaryButtonConfig: AlertButtonConfig(title: "Settings",
                                                                                                            action: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) }))
                        
                        let alert = DynamicIslandAlertView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 5,
                                                              position: .dynamicIsland,
                                                              gestures: [.swipe(direction: [.up], threshold: 20)],
                                                              animationType: .dynamicIsland,
                                                              animationConfig: AnimationConfig())
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    }
                ]
            ),
            AlertSection(
                title: AlertSectionType.commonAlerts.rawValue,
                buttons: [
                    AlertButton(title: "Alert - one button, mid, slide") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .commonAlerts)
                        let alertConfig = AlertConfig(icon: "trash.fill",
                                                      lightModeIconColor: .blue,
                                                      darkModeIconColor: .blue.opacity(0.8),
                                                      title: "Data storage is full!",
                                                      lightModeTitleColor: .black,
                                                      darkModeTitleColor: .white,
                                                      message: "Your cloud storage is full. You can no longer save data. Please delete unnecessary files. To upgrade your plan, press the button below!",
                                                      lightModeMessageColor: .gray,
                                                      darkModeMessageColor: .gray,
                                                      lightModeBackgroundColor: .white,
                                                      darkModeBackgroundColor: Color(white: 0.15),
                                                      dismissAction: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
                                                      cancelButtonConfig: nil,
                                                      continueButtonConfig: AlertButtonConfig(title: "Upgrade Plan",
                                                                                              action: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
                                                                                              lightModeTitleColor: .white,
                                                                                              darkModeTitleColor: .white,
                                                                                              lightModeBackgroundColor: .blue,
                                                                                              darkModeBackgroundColor: .blue))
                        
                        let alert = AlertView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 5,
                                                              position: .center,
                                                              gestures: [.swipe(direction: [.down, .up, .left, .right], threshold: 20)],
                                                              animationType: .slide,
                                                              animationConfig: AnimationConfig(offset: (x: (-100, 0), y: (0, 0)), opacity: (start: 0, end: 1)))
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    },
                    AlertButton(title: "Alert - two buttons, bottom, scale") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .commonAlerts)
                        let alertConfig = AlertConfig(icon: "trash.fill",
                                                      lightModeIconColor: .red,
                                                      darkModeIconColor: .orange,
                                                      title: "Data storage is full!",
                                                      lightModeTitleColor: .black,
                                                      darkModeTitleColor: .white,
                                                      message: "Your cloud storage is full. You can no longer save data. Please delete unnecessary files. To upgrade your plan, press the button below!",
                                                      lightModeMessageColor: .gray,
                                                      darkModeMessageColor: .gray,
                                                      lightModeBackgroundColor: .white,
                                                      darkModeBackgroundColor: Color(white: 0.15),
                                                      dismissAction: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
                                                      cancelButtonConfig: AlertButtonConfig(title: "Cancel",
                                                                                            action: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
                                                                                            lightModeTitleColor: .white,
                                                                                            darkModeTitleColor: .white,
                                                                                            lightModeBackgroundColor: .gray,
                                                                                            darkModeBackgroundColor: .gray),
                                                      continueButtonConfig: AlertButtonConfig(title: "Upgrade Plan",
                                                                                              action: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) },
                                                                                              lightModeTitleColor: .white,
                                                                                              darkModeTitleColor: .white,
                                                                                              lightModeBackgroundColor: .red,
                                                                                              darkModeBackgroundColor: .orange))
                        
                        let alert = AlertView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 5,
                                                              position: .bottom,
                                                              gestures: [.swipe(direction: [.down, .up, .left, .right], threshold: 20)],
                                                              animationType: .scale,
                                                              animationConfig: AnimationConfig(offset: (x: (-100, 0), y: (0, 0)), opacity: (start: 0, end: 1)))
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    }
                ]
            ),
            AlertSection(
                title: AlertSectionType.infoAlerts.rawValue,
                buttons: [
                    AlertButton(title: "Info Alert - mid, scale") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .infoAlerts)
                        let alertConfig = InformationAlertConfig(title: "Tokens",
                                                                 message: "Tokens are digital assets that come in many different forms. Some tokens have a monetary value, such as USDC, which is a token that represents $1. \n\nTokens can be anything from digital art, such as NFTs, to domain names that live on the blockchain, such as hello.eth.",
                                                                 buttonAction: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) })
                        
                        
                        let alert = InformationAlertView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 5,
                                                              position: .center,
                                                              gestures: [.swipe(direction: [.down, .up, .left, .right], threshold: 20)],
                                                              animationType: .scale,
                                                              animationConfig: AnimationConfig(offset: (x: (-100, 0), y: (0, 0)), opacity: (start: 0, end: 1)))
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    },
                    AlertButton(title: "Info Alert - bottom, bounce") {
                        let id = UUID().uuidString
                        self.saveAlertID(id, forSection: .infoAlerts)
                        let alertConfig = InformationAlertConfig(title: "Tokens",
                                                                 message: "Tokens are digital assets that come in many different forms. Some tokens have a monetary value, such as USDC, which is a token that represents $1. \n\nTokens can be anything from digital art, such as NFTs, to domain names that live on the blockchain, such as hello.eth.",
                                                                 buttonAction: { [weak self] in self?.iosAlertlibrary.dismissAlert(id: id) })
                        
                        let alert = InformationAlertView(config: alertConfig)
                        let containerConfig = ContainerConfig(id: id,
                                                              duration: 5,
                                                              position: .bottom,
                                                              gestures: [.swipe(direction: [.down, .up, .left, .right], threshold: 20)],
                                                              animationType: .bounce,
                                                              animationConfig: AnimationConfig(offset: (x: (-100, 0), y: (0, 0)), opacity: (start: 0, end: 1)))
                        
                        let container = BasicContainerView(content: alert, containerConfig: containerConfig)
                        self.iosAlertlibrary.showAlert(container: container)
                    }
                ]
            )
        ]
    }
    
    
    /// Сохраняет ID алерта в словарь
    private func saveAlertID(_ id: String, forSection section: AlertSectionType) {
        if alertIDsBySection[section] == nil {
            alertIDsBySection[section] = []
        }
        alertIDsBySection[section]?.append(id)
    }
    
    /// Удаляет алерты по секциям
    func dismissAlerts(forSections sections: [AlertSectionType]) {
        sections.forEach { section in
            if let ids = alertIDsBySection[section] {
                ids.forEach { id in
                    iosAlertlibrary.dismissAlert(id: id)
                }
                alertIDsBySection[section] = nil
            }
        }
    }
}
