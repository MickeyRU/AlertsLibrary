import Testing
import SwiftUI
import SnapshotTesting
@testable import iOSAlertLibrary


@Suite("InformationAlertView Tests")
struct InformationAlertViewTests {
    
    @Suite("Proper Appearence Tests")
    struct InfoAlertAppearenceTests {
        
        @Test
        @MainActor
        func informationAlertViewAppearance() {
            let view = InformationAlertView(config: InformationAlertConfig(title: "Example of an Information Alert!",
                                                                           message: "This alert shows additional information about something.\n\nAlert can be used in different situations.\n\nSome text to fill the alert.Some text to fill the alert.Some text to fill the alert.Some text to fill the alert."))
            let hostingController = UIHostingController(rootView: view)
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }
        
        @Test("Dark mode adaptation")
        @MainActor
        func informationAlertViewAppearanceInDarkMode() {
            let view = InformationAlertView(config: InformationAlertConfig(title: "Example of an Information Alert!",
                                                                           message: "This alert shows additional information about something.\n\nAlert can be used in different situations.\n\nSome text to fill the alert.Some text to fill the alert.Some text to fill the alert.Some text to fill the alert."))
            let hostingController = UIHostingController(rootView: view)
            hostingController.overrideUserInterfaceStyle = .dark
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }
    }
}
