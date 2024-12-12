import SwiftUI

@MainActor
final class SwiftUIViewModel: ObservableObject {
    private let alertDataManager: AlertDataManager
    
    @Published var sections: [AlertSection] = []
    
    init() {
        self.alertDataManager = AlertDataManager()
        sections = alertDataManager.setupSections()
    }
    
    func dismissSpecificAlerts() {
        let specificAlertIDs: [AlertSectionType] = [.toasts, .commonAlerts, .infoAlerts]
        alertDataManager.dismissAlerts(forSections: specificAlertIDs)
    }
}
