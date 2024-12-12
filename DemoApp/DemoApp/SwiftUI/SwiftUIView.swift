import SwiftUI

struct SwiftUIView: View {
    @StateObject private var viewModel = SwiftUIViewModel()
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.sections, id: \.title) { section in
                        Section(header: Text(section.title)) {
                            ForEach(section.buttons, id: \.title) { button in
                                Button(button.title) {
                                    button.action()
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                
                Button("Показать модальное окно") {
                    viewModel.dismissSpecificAlerts()
                    isSheetPresented = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .font(.headline)
                .foregroundColor(.primary)
                .cornerRadius(10)
                .padding(.horizontal, 16)
            }
            
            .navigationTitle("iOS Alert Library")
            .sheet(isPresented: $isSheetPresented) {
                SecondEmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
