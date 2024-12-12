import Testing
import SwiftUI
import SnapshotTesting
@testable import iOSAlertLibrary


@Suite("ToastView Tests")
struct ToastViewTests {
    
    @Suite("Proper Appearence Tests")
    struct ToastAppearenceTests {
        
        @Test("Success style")
        @MainActor
        func toastViewAppearanceWithSuccessStyle() {
            let view = ToastView(config: ToastConfig(message: "This is a toast view! There you can deliver some messages to users!",
                                                     style: .success,
                                                     closeAction: {},
                                                     isExpandable: false,
                                                     expandedToastConfig: nil))
            let hostingController = UIHostingController(rootView: view)
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }

        @Test("Warning style")
        @MainActor
        func toastViewAppearanceWithWarningStyle() {
            let view = ToastView(config: ToastConfig(message: "This is a toast view! There you can deliver some messages to users!",
                                                     style: .warning,
                                                     closeAction: {},
                                                     isExpandable: false,
                                                     expandedToastConfig: nil))
            let hostingController = UIHostingController(rootView: view)
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }

        @Test("Info style")
        @MainActor
        func toastViewAppearanceWithInfoStyle() {
            let view = ToastView(config: ToastConfig(message: "This is a toast view! There you can deliver some messages to users!",
                                                     style: .info,
                                                     closeAction: {},
                                                     isExpandable: false,
                                                     expandedToastConfig: nil))
            let hostingController = UIHostingController(rootView: view)
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }

        @Test("Error style")
        @MainActor
        func toastViewAppearanceWithErrorStyle() {
            let view = ToastView(config: ToastConfig(message: "This is a toast view! There you can deliver some messages to users!",
                                                     style: .error,
                                                     closeAction: {},
                                                     isExpandable: false,
                                                     expandedToastConfig: nil))
            let hostingController = UIHostingController(rootView: view)
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }

        @Test("Text takes more than 2 lines")
        @MainActor
        func toastViewAppearanceWhenTextIsLarge() {
            let view = ToastView(config: ToastConfig(message: "This is a toast view! There you can deliver some messages to users! This text is so large to be dispayed in the toast",
                                                     style: .error,
                                                     closeAction: {},
                                                     isExpandable: false,
                                                     expandedToastConfig: nil))
            let hostingController = UIHostingController(rootView: view)
            
            assertSnapshot(of: hostingController, as: .image(on: .iPhone13ProMax))
        }

    }
}
