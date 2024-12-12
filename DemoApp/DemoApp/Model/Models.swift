import Foundation

struct AlertButton {
    let title: String
    let action: () -> Void
}

struct AlertSection {
    let title: String
    let buttons: [AlertButton]
}

enum AlertSectionType: String {
    case toasts = "Toasts"
    case islandBanner = "Banner for Dynamic Island"
    case commonAlerts = "Common Alerts"
    case infoAlerts = "Info Alerts"
}
