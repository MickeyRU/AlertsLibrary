import Foundation

@MainActor
class UIKitViewModel {
    private let alertDataManager: AlertDataManager
    
    var sections: [AlertSection] = []
    
    init() {
        self.alertDataManager = AlertDataManager()
        sections = alertDataManager.setupSections()
    }
    
    func dismissSpecificAlerts() {
        let specificAlertIDs: [AlertSectionType] = [.toasts, .commonAlerts, .infoAlerts]
        alertDataManager.dismissAlerts(forSections: specificAlertIDs)
    }
}
