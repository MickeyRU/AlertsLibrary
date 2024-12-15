# Getting Started with iOSAlertLibrary

Create alerts using predefined templates or integrate custom UI.

## Alert LifeCycle

```swift
// Create an instance of the library
let iosAlertLibrary = iOSAlertLibrary()

// Generate a unique ID for the notification
let id = UUID().uuidString

// Configure the notification
let alertConfig = AlertConfig(
    icon: "trash.fill",
    lightModeIconColor: .blue,
    darkModeIconColor: .blue.opacity(0.8),
    title: "Storage Full!",
    lightModeTitleColor: .black,
    darkModeTitleColor: .white,
    message: """
             Your cloud storage is full. You can no longer save data. \
             Delete unnecessary files or upgrade your plan.
             """,
    lightModeMessageColor: .gray,
    darkModeMessageColor: .gray,
    lightModeBackgroundColor: .white,
    darkModeBackgroundColor: Color(white: 0.15),
    dismissAction: { [weak self] in self?.iosAlertLibrary.dismissAlert(id: id) },
    cancelButtonConfig: nil,
    continueButtonConfig: AlertButtonConfig(
        title: "Upgrade Plan",
        action: { print("Plan upgraded") },
        lightModeTitleColor: .white,
        darkModeTitleColor: .white,
        lightModeBackgroundColor: .blue,
        darkModeBackgroundColor: .blue
    )
)

// Create the alert view
let alert = AlertView(config: alertConfig)

// Configure the alert container
let containerConfig = ContainerConfig(
    id: id,
    duration: 3,
    position: .top,
    gestures: [.swipe(direction: [.up], threshold: 20)],
    animationType: .slide,
    animationConfig: AnimationConfig(
        offset: (x: (start: -50, end: 0), y: (start: 0, end: 0)),
        opacity: (start: 0, end: 1),
        scaleEffect: (from: 1, anchor: .center)
    )
)

// Create the alert container
let container = BasicContainerView(content: alert, containerConfig: containerConfig)

// Display the notification
iosAlertLibrary.showAlert(container: container, useOverlayWindow: false)

// Force dismiss the notification
iosAlertLibrary.dismissAlert(id: id)

```
