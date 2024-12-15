# iOSAlertLibrary

**iOSAlertLibrary** is a SwiftUI-based notification library that works seamlessly on any screen.

<table>
    <thead>
        <tr>
            <th>Toasts</th>
            <th>Dynamic Island</th>
            <th>Alerts</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <img src="https://github.com/user-attachments/assets/568f0232-33e3-4113-8c74-490a644aaba6" height="400" alt="Toasts"/>
            </td>
            <td>
                <img src="https://github.com/user-attachments/assets/9e341c68-56d9-4d5a-9a5b-895755a30e86" height="400" alt="DynamicIsland"/>
            </td>
            <td>
                <img src="https://github.com/user-attachments/assets/e047ec71-fb6d-4157-b283-79f1a6de2cb3" height="400" alt="Alerts"/>
            </td>
        </tr>
    </tbody>
</table>

---

## Features

- ✅ Predefined notifications with various designs and configurations.
- ✅ Toast notifications with adjustable size on tap.
- ✅ Notifications for Dynamic Island.
- ✅ Built-in animations with customizable parameters.
- ✅ Support for custom notification UI.
- ✅ Gesture support (swipes in four directions, taps).
- ✅ Notifications displayed above any screen.
- ✅ Full dark mode adaptation.
- ✅ Screen rotation support.
- ✅ Available via Swift Package Manager (SPM).
- ✅ UI tests to ensure functionality.

---

## Customize Your Notifications!

The library provides an intuitive interface for creating and displaying notifications. You can use predefined templates or integrate custom UI.

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

## Library Components

The library's architecture is modular, allowing you to use only the required functionality.

- [Alerts UI presets](Sources/iOSAlertLibrary/NotificationsUI) - A collection of predefined notification templates.
- [BasicContainerView](Sources/iOSAlertLibrary/Core/Containers/BasicContainerView.swift) - An intermediate wrapper for UI elements (View), enabling gesture and animation configuration, and implementing the **ContainerViewProtocol**.
- [AlertPresentationManager](Sources/iOSAlertLibrary/Core/Managers/AlertPresentationManager.swift) - Manages the display of containers (Views implementing ContainerViewProtocol) and their lifecycle.

## Requirements

| Platform  | 
|-----------| 
| iOS 16.0+ | 

## Authors

<a href="https://github.com/MickeyRU"><img src="https://github.com/MickeyRU.png" width="50" height="50" /></a>
<a href="https://github.com/Archichil"><img src="https://github.com/Archichil.png" width="50" height="50" /></a>
<a href="https://github.com/Uvexer"><img src="https://github.com/Uvexer.png" width="50" height="50" /></a>
