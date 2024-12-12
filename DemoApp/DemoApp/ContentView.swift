import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SwiftUIView()
                .tabItem {
                    Label("SwiftUI", systemImage: "swift")
                }
            UIKitWrapper()
                .tabItem {
                    Label("UIKit", systemImage: "gearshape.fill")
                }
        }
        .tint(.primary)
    }
}

#Preview {
    ContentView()
}
