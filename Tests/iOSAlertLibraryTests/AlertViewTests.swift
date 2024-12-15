import Testing
import SwiftUI
import SnapshotTesting
@testable import iOSAlertLibrary

@Suite("AlertView Tests")
struct AlertViewTests {
    
    @Suite("Proper Appearence Tests")
    struct AlertAppearenceTests {
        
        @Test("Alert with two buttons")
        @MainActor
        func alertViewAppearanceWithTwoButtons() {
            let view = AlertView(config: AlertConfig())
            let hostingController = UIHostingController(rootView: view)
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }

        @Test("Alert with one button")
        @MainActor
        func alertViewAppearanceWithOneButton() {
            let view = AlertView(config: AlertConfig(cancelButtonConfig: nil, continueButtonConfig: AlertButtonConfig(title: "Continue")))
            let hostingController = UIHostingController(rootView: view)
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }

        @Test("Alert dark mode adaptation")
        @MainActor
        func alertViewAppearanceInDarkMode() {
            let view = AlertView(config: AlertConfig())
            let hostingController = UIHostingController(rootView: view)
            hostingController.overrideUserInterfaceStyle = .dark

            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }
    }
}

