import SwiftUI

struct DismissButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 30, height: 30)
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .heavy))
            }
        }
    }
}
