import SwiftUI

/// Represents the visual style of a toast notification.
///
/// The `ToastStyle` enum provides predefined styles for toast notifications,
/// such as success, error, warning, and informational messages. Each style includes
/// a background color, button color, and an associated SF Symbol icon.
public enum ToastStyle {
    /// Indicates a successful operation.
    case success
    
    /// Indicates an error or failure.
    case error
    
    /// Indicates a warning or caution.
    case warning
    
    /// Provides informational content.
    case info
}

extension ToastStyle {
    var backgroundColor: Color {
        switch self {
        case .success:
            return Color(red: 0.85, green: 1.0, blue: 0.85)
        case .error:
            return Color(red: 1.0, green: 0.85, blue: 0.85)
        case .warning:
            return Color(red: 1.0, green: 0.95, blue: 0.75)
        case .info:
            return Color(red: 0.85, green: 0.95, blue: 1.0)
        }
    }

    var buttonColor: Color {
        switch self {
        case .success:
            return Color(red: 0.2, green: 0.8, blue: 0.2)
        case .error:
            return Color(red: 0.8, green: 0.2, blue: 0.2)
        case .warning:
            return Color(red: 0.8, green: 0.6, blue: 0.2)
        case .info:
            return Color(red: 0.2, green: 0.5, blue: 0.8)
        }
    }
    
    var icon: String {
        switch self {
        case .success:
            return "checkmark.circle.fill"
        case .error:
            return "xmark.circle.fill"
        case .warning:
            return "exclamationmark.triangle.fill"
        case .info:
            return "info.circle.fill"
        }
    }
}
