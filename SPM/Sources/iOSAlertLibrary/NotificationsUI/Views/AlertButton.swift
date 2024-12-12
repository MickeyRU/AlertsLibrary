import Foundation
import SwiftUI

struct AlertButton: View {
    
    let config: AlertButtonConfig
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: config.action) {
            Text(config.title)
                .frame(maxWidth: .infinity)
                .font(.headline)
                .padding()
                .background(AlertButtonColorProvider.getBackgroundColor(config: config, for: colorScheme))
                .foregroundColor(AlertButtonColorProvider.getTitleColor(config: config, for: colorScheme))
                .cornerRadius(50)
        }
    }
}
