import SwiftUI

/// Кастомный UIHostingController с поддержкой динамической перерисовки
final class DynamicUIHostingController<Content: View>: UIHostingController<Content> {
    
    var onLayoutChange: ((CGSize) -> Void)?
    
    private var previousSize: CGSize?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let newSize = view.intrinsicContentSize
        
        if previousSize == nil {
            previousSize = newSize
        }
        
        if newSize != previousSize {
            previousSize = newSize
            onLayoutChange?(newSize)
        }
    }
}
