import SwiftUI

struct CollapsedToastView: View {
    
    let config: ToastConfig
    @Binding var isExpanded: Bool
    let namespace: Namespace.ID
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: config.style.icon)
                    .foregroundColor(config.style.buttonColor)
                    .font(.title)
                    .matchedGeometryEffect(id: "icon", in: namespace)
                
                Text(config.message)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .matchedGeometryEffect(id: "title", in: namespace)
                
                Button(action: config.isExpandable
                       ? { withAnimation(.easeIn(duration: 0.3)) { isExpanded.toggle() } }
                       : config.closeAction) {
                    Image(systemName: config.isExpandable ? "chevron.forward" : "xmark")
                        .foregroundColor(config.style.buttonColor)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .matchedGeometryEffect(id: "expandButton", in: namespace)
            }
            .matchedGeometryEffect(id: "button", in: namespace)
            .matchedGeometryEffect(id: "scroll", in: namespace)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(config.style.backgroundColor)
                    .matchedGeometryEffect(id: "background", in: namespace)
            )
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal, 16)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        }
    }
}
