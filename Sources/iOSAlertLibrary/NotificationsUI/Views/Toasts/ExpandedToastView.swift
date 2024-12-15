import SwiftUI

struct ExpandedToastView: View {
    
    let config: ToastConfig
    @Binding var isExpanded: Bool
    let namespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: config.style.icon)
                    .foregroundColor(config.style.buttonColor)
                    .font(.title)
                    .matchedGeometryEffect(id: "icon", in: namespace)
                
                Text(config.expandedToastConfig?.title ?? config.message)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: config.maxWidth, alignment: .leading)
                
                Button(action: { withAnimation(.easeIn(duration: 0.3)) { isExpanded.toggle() } }) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(config.style.buttonColor)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .matchedGeometryEffect(id: "expandButton", in: namespace)
            }
            .frame(maxWidth: config.maxWidth)
            
            ScrollView(showsIndicators: true) {
                Text(config.expandedToastConfig?.description ?? config.message)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: config.maxWidth, alignment: .topLeading)
            .matchedGeometryEffect(id: "scroll", in: namespace)
            .frame(height: 180)
            .scrollIndicators(.visible)
            
            AlertButton(config: config.expandedToastConfig?.buttonConfig ?? AlertButtonConfig(title: "Ok", action: {}))
                .matchedGeometryEffect(id: "button", in: namespace)
        }
        .padding()
        .frame(maxWidth: config.maxWidth)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(config.style.backgroundColor)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .padding(.horizontal, 10)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}


