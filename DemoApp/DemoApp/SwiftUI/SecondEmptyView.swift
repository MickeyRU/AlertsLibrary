import SwiftUI

struct SecondEmptyView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 100) {
            Image(systemName: "arrow.up")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .foregroundColor(.primary)
            
            Text("Алерт отображается в новом Overlay UIWindow")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    SecondEmptyView()
}
