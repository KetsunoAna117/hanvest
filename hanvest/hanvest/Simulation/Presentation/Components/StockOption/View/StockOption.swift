import SwiftUI

struct StockOption: View {
    // Constant
    let SHADOW_OFFSET: CGFloat = 5
    let WIDTH: CGFloat = 75
    let HEIGHT: CGFloat = 75
    
    // Bind to the parent selection
    @Binding var selectedStockID: String
    
    // Styling Variable (Initialized Before)
    var initialState: HanvestStockOptionDefaultState
    
    @State private var state: HanvestStockOptionDefaultState =
        .unselected(color: .mineShaft500)
    
    // Button Content
    var id: String
    var image: Image
    var color: Color
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(state.backgroundColor)
                .frame(width: WIDTH, height: HEIGHT)
                .cornerRadius(12)
                .shadow(
                    color: (state.shadowColor),
                    radius: getPressedStatus() ? 0 : 0, x: 0, y: getPressedStatus() ? 0 : SHADOW_OFFSET
                )
            
            // The Image
            image
                .foregroundStyle(Color.white)
        }
        .frame(maxWidth: WIDTH, maxHeight: HEIGHT)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .fill(.clear)
        )
        .offset(y: getPressedStatus() ? SHADOW_OFFSET : 0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: self.state)
        .onTapGesture {
            if selectedStockID != id {
                self.selectedStockID = self.id
                state = .selected(color: color)
                print("\(id) pressed")
                action()
            }

        }
        .onChange(of: selectedStockID) { oldValue, newValue in
            if newValue != id {
                state = .unselected(color: .mineShaft500)
            }
        }
    }
    
    func getPressedStatus() -> Bool {
        return state == .selected(color: color)
    }
    
}

#Preview {
    @Previewable @State var selectedStockOption: String = ""
    HStack {
        StockOption(
            selectedStockID: $selectedStockOption,
            initialState: .unselected(color: .red),
            id: "Stock-1",
            image: Image(systemName: "star"), color: .red
        ) {
            print("Stock-1 selected")
        }
        
        StockOption(
            selectedStockID: $selectedStockOption,
            initialState: .unselected(color: .blue),
            id: "Stock-2",
            image: Image(systemName: "person"), color: .blue
        ) {
            print("Stock-2 selected")
        }
        
        StockOption(
            selectedStockID: $selectedStockOption,
            initialState: .unselected(color: .green),
            id: "Stock-3",
            image: Image(systemName: "book"), color: .green
        ) {
            print("Stock-3 selected")
        }
    }
}
