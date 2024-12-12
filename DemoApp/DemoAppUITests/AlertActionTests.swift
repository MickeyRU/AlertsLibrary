import XCTest
import SnapshotTesting
import UIKit

final class AlertActionTests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        
        if app.state == .notRunning || app.state == .unknown {
            app.launch()
        }
    }
    
    func testCloseAlert() {
        let collectionViewsQuery = app.collectionViews
        let button = collectionViewsQuery.buttons["Alert - one button, mid, slide"]
        button.tap()
        
        //Wait for appearence
        Thread.sleep(forTimeInterval: 1)
        let closeButton = app.buttons["xmark"]
        closeButton.tap()
        
        //Wait for disappearance
        Thread.sleep(forTimeInterval: 1)
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
        
        if let croppedImage = croppedImage {
            assertSnapshot(
                matching: croppedImage,
                as: .image,
                record: false
            )
        }
    }
    
    func testAlertButtonAction() {
        let collectionViewsQuery = app.collectionViews
        let button = collectionViewsQuery.buttons["Alert - one button, mid, slide"]
        button.tap()
        
        Thread.sleep(forTimeInterval: 1)
        let actionButton = app.buttons["Upgrade Plan"]
        actionButton.tap()
        
        //Wait for disappearance
        Thread.sleep(forTimeInterval: 1)
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
        
        if let croppedImage = croppedImage {
            assertSnapshot(
                matching: croppedImage,
                as: .image,
                record: false
            )
        }
    }
}


