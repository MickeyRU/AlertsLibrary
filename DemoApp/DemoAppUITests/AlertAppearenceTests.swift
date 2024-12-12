import XCTest
import SnapshotTesting
import UIKit

final class AlertAppearenceTests: XCTestCase {
    let app = XCUIApplication()
    let buttonNames: [String] = [
        "Short Toast - top, slide",
        "Short Toast 2 - top, slide",
        "Short Toast - bottom, slide",
        "Expanded Toast - mid, bounce",
        "Alert - one button, mid, slide",
        "Alert - two buttons, bottom, scale",
        "Info Alert - mid, scale",
        "Info Alert - bottom, bounce"
    ]
    
    override func setUp() {
        super.setUp()
        
        if app.state == .notRunning || app.state == .unknown {
            app.launch()
        }
    }
    
    func testAlertAppearence() {
        let collectionViewsQuery = app.collectionViews
        for buttonName in buttonNames {
            let button = collectionViewsQuery.buttons[buttonName]
            button.tap()
            
            Thread.sleep(forTimeInterval: 1.5)
            
            let fullScreenshot = app.screenshot().image
            let screenHeight = fullScreenshot.size.height
            let screenWidth = fullScreenshot.size.width
            let statusBarHeight: CGFloat = 50
            
            let croppedImage = fullScreenshot.cropped(to: CGRect(
                x: 0,
                y: statusBarHeight,
                width: screenWidth,
                height: screenHeight - statusBarHeight
            ))
            
            // Проверка, что изображение обрезалось
            XCTAssertNotNil(croppedImage, "Failed to crop image")
            
            // Сравнение снимка
            if let croppedImage = croppedImage {
                assertSnapshot(
                    matching: croppedImage,
                    as: .image,
                    named: "\(buttonName)-appearanceTest",
                    record: false,
                    testName: "\(buttonName)-snapshot-test"
                )
            }
            
            Thread.sleep(forTimeInterval: 5)
        }
    }
}
